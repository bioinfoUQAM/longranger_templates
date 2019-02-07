#!/bin/bash
#SBATCH --job-name=$__Job_Name__$
#SBATCH --export=ALL
#SBATCH --nodes=4 --ntasks-per-node=32
#SBATCH --mem=128000M
#SBATCH --account=$__account_name__$
#SBATCH --signal=2
#SBATCH --no-requeue
#SBATCH --workdir=<give your path here that you want your program to be executed in>
#SBATCH --time=72:00:00
#SBATCH --output=<out put path>.out
#SBATCH --error=<error put path>.err

### Alternatively: --ntasks=1 --cpus-per-task=__MRO_THREADS__
###   Consult with your cluster administrators to find the combination that
###   works best for single-node, multi-threaded applications on your system.

### j'ai change maxjobs a 400 instead of 200
longranger wgs --id=$_JobID_$ --fastqs=<path to your fastq files> \
               --reference=<path to your indexed genome> \
               --disable-ui --jobinterval=1500 --maxjobs=400 --nopreflight --jobmode=slurm   --vcmode=freebayes --somatic
