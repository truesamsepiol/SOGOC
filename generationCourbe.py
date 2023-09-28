#!/bin/python3
import sys
import os
import csv
import matplotlib.pyplot as plt
import numpy as np


def generationDiagramme(nomFichier, tailleX, tailleY, titre, labelX, valeursX, valeursY, couleur):

    nomFichierPng = nomFichier + ".png"
    # Generation d'un diagramme en baton
    plt.figure(figsize=(tailleX, tailleY)) 
    plt.grid(axis = "x", color = "black", linestyle="--")
    plt.title(titre)
    plt.xlabel(labelX)
    #plt.barh(valeursX, valeursY, color=couleur) # baton horizontal
    plt.bar(valeursX, valeursY, color=couleur) # baton verticale
    plt.savefig(nomFichierPng)



def traitement(fichier, nomFichier, titre, couleur):
    print("Debut de traitement du fichier")
   
    annees = []
    nombrePersonnes = []
    donnees = csv.reader(fichier)
    for ligne in donnees:
        annees.append(int(ligne[0]))
        nombrePersonnes.append(int(ligne[1]))

    generationDiagramme(nomFichier, 10, 5, titre ,"Années", annees, nombrePersonnes, couleur)
    print("Fin de traitement du fichier\n\n")

if __name__ == "__main__":

    with open("nombreInscritParAnnee.csv", "rt") as fichier1:
        traitement(fichier1, "nombreInscritParAnnee", "Nombre d'inscription par an", "blue")
    with open("nombrePersonnesAyantCotise.csv", "rt") as fichier2:
        traitement(fichier2, "nombrePersonnesAyantCotise", "Nombre de cotisation par an", "green")
