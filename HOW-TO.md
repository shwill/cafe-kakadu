# Café Kakadu — Anleitung zur Bearbeitung

## Preise ändern

1. Öffne `data/menu.yml` (direkt auf github.com oder lokal)
2. Finde den Eintrag und ändere die Zahl:
   ```yaml
   - name: Espresso
     price: "1,90"    # ← diese Zahl ändern
   ```
3. Speichern → Die GitHub Action generiert automatisch die JSON-Datei

## Neues Getränk hinzufügen

Kopiere eine bestehende Zeile und passe sie an:

```yaml
# Einfacher Eintrag (Cocktails, Essen, etc.):
- name: Neuer Drink
  price: "7,40"

# Mit Beschreibung:
- name: Neuer Drink
  detail: saisonabhängig
  price: "7,40"

# Mit mehreren Größen (Kalte Getränke, Biere, etc.):
- name: Neues Getränk
  prices: ["2,80", ~, "3,30"]
  # ~ bedeutet: kein Preis für diese Größe
```

## Getränk entfernen

Lösche die entsprechenden Zeilen (name + price + ggf. detail).

## Neue Kategorie hinzufügen

Am Ende der Datei hinzufügen:

```yaml
- id: neues
  title: Neue Kategorie
  type: simple
  items:
    - name: Erster Eintrag
      price: "5,00"
```

## Fotos hinzufügen

1. Gehe auf github.com zum Ordner `images/gallery/`
2. Klicke "Add file" → "Upload files"
3. Bilder hochladen (JPG, PNG oder WebP)
4. Die GitHub Action konvertiert automatisch zu WebP und aktualisiert die Galerie

## Fotos lokal hinzufügen

1. Bilder in `images/gallery/` legen
2. `./build.sh` ausführen (konvertiert zu WebP + generiert gallery.json)
3. Commit & Push

## Wichtig

- Preise immer in Anführungszeichen: `"2,80"` (nicht `2,80`)
- `~` bedeutet "kein Preis" bei Größen-Spalten
- Einrückung mit Leerzeichen (2 Leerzeichen pro Ebene)
- Nach jeder Änderung: speichern und pushen
