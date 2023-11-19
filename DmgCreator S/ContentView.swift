//
//  ContentView.swift
//  DmgCreator S
//
//  Created by Lucas Drouot on 19/11/2023.
//

import SwiftUI

struct ContentView: View {
    let applicationBundleIdentifier = "com.apple.ScriptEditor.id.DmgCreatorTool"
    
    var body: some View {
            VStack {
                Spacer()
                
                VStack{
                    Text("🚀💿")
                        .font(.system(size: 50))
                    Text("")
                        .font(.largeTitle)
                    Text("Bienvenue dans DmgCreator S !")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                VStack{
                    Button(action: {
                        if isApplicationInstalled(bundleIdentifier: applicationBundleIdentifier) {
                            startCreation()
                            
                            AfterCreation().openInWindow(title: "Retour", sender: self)
                        } else {
                            errorCreation()
                        }
                    }) {
                        Text("🚀")
                            .font(.system(size: 30))
                            .padding()
                        Text("Créer une image disque")
                            .font(.system(size: 15))
                            .padding()
                    }
                    .cornerRadius(50)
                    
                    Button(action: {
                        SetupContent().openInWindow(title: "Mise en place des composants", sender: self)
                    }) {
                        Text("💿")
                            .font(.system(size: 24))
                            .padding()
                        Text("Mise en place des composants")
                            .font(.system(size: 12))
                            .padding()
                    }
                    .cornerRadius(50)
                }
                
                Spacer()
                
                VStack{
                    Button(action: {
                        AboutContent().openInWindow(title: "À propos", sender: self)
                    }) {
                        Text("À propos")
                            .font(.system(size: 10))
                            .padding(5)
                    }
                    .cornerRadius(50)
                }
            }
            .padding()
            .frame(minWidth: 400, idealWidth:400, minHeight: 350, idealHeight: 350)
    }
    
    func startCreation() {
            launchApplication(bundleIdentifier: applicationBundleIdentifier)
    }
    
    func errorCreation() {
        let alert = NSAlert()
        alert.messageText = "🛑 Les scripts ne sont pas installés..."
        alert.informativeText = "Consultez la section 'Mise en place des composants' pour les télécharger puis les installer."
        alert.alertStyle = .warning
        alert.addButton(withTitle: "D'accord")
        
        let response1 = alert.runModal()
    }
}

extension View {
    
    @discardableResult
    func openInWindow(title: String, sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let win = NSWindow(contentViewController: controller)
        win.contentViewController = controller
        win.title = title
        win.makeKeyAndOrderFront(sender)
        return win
    }
}

struct SetupContent: View {
    var body: some View {
        VStack{
            Spacer()
            
            Text("Mise en place des composants.")
                .font(.largeTitle)
            
            Spacer()
            
            VStack{
                Text("À l'aide du bouton ci-dessous, téléchargez le paquet d'installation. Lancez-le pour installer automatiquement les scripts nécessaires au bon fonctionnement de l'application.\n")
                
                Button(action: downloadFiles) {
                    Text("📦")
                        .font(.system(size: 24))
                        .padding(10)
                    Text("Télécharger le paquet d'installation")
                        .font(.system(size: 12))
                        .padding()
                }
                .cornerRadius(50)
            }
            .padding()
            
            Spacer()
            
        }
        .frame(minWidth: 500, idealWidth:500, minHeight: 300, idealHeight: 300)
    }
}

struct AboutContent: View {
    var body: some View {
        VStack{
            Spacer()
            
            Text("À propos de DmgCreator")
                .font(.largeTitle)
            
            Spacer()
            
            VStack{
                Text("Créez des images disques en quelques clics avec DmgCreator. C'est aussi simple que cela.\n\nDmgCreator est un freeware vous permettant de créer une image disque (.dmg) en quelques clics. Aucune connaissance requise, votre Mac effectue tout le processus de création à votre place.\n\niStuces s'engage : DmgCreator est et sera toujours gratuit.\n\n\nvS-1.0\n© 2023, iStuces\n")
                
                Button(action: moreApps) {
                    Text("🧭")
                        .font(.system(size: 24))
                        .padding(10)
                    Text("Plus d'applications de iStuces")
                        .font(.system(size: 12))
                        .padding()
                }
                .cornerRadius(50)
            }
            .padding()
            
            Spacer()
            
        }
        .frame(minWidth: 500, idealWidth:500, minHeight: 400, idealHeight: 400)
    }
}

func downloadFiles() {
    if let url = URL(string: "https://github.com/istucesyt/DmgCreator/blob/main/Ressources/DmgCreatorTools.pkg") {
        NSWorkspace.shared.open(url)
    }
}

func moreApps() {
    if let url = URL(string: "https://github.com/istucesyt") {
        NSWorkspace.shared.open(url)
    }
}

struct AfterCreation: View {
    var body: some View {
        VStack{
            Spacer()
            
            Text("🚀")
                .font(.system(size: 40))
            Text("")
                .font(.largeTitle)
            Text("Fin de l'opération.")
                .font(.largeTitle)
            
            Spacer()
            
            VStack{
                Text("Opération terminée ! Consultez les tutoriels ci-dessous pour personnaliser votre image disque !\n")
                
                Button(action: modifyIcon) {
                    Text("💡")
                        .font(.system(size: 24))
                        .padding(10)
                    Text("Modifier l'icône de l'image disque (aide en ligne)")
                        .font(.system(size: 12))
                        .padding()
                }
                .cornerRadius(50)
                Button(action: lockDMG) {
                    Text("💡")
                        .font(.system(size: 24))
                        .padding(10)
                    Text("Verrouiller l'image disque (aide en ligne)")
                        .font(.system(size: 12))
                        .padding()
                }
                .cornerRadius(50)
            }
            .padding()
            
            Spacer()
            
        }
        .frame(minWidth: 500, idealWidth:500, minHeight: 400, idealHeight: 400)
    }
}

func modifyIcon() {
    if let url = URL(string: "https://github.com/istucesyt/DmgCreator/blob/main/Ressources/Personnaliser%20l'ico%CC%82ne%20d'une%20image%20disque.pdf") {
        NSWorkspace.shared.open(url)
    }
}

func lockDMG() {
    if let url = URL(string: "https://github.com/istucesyt/DmgCreator/blob/main/Ressources/Prote%CC%81ger%20un%20volume%20d'image%20disque%20par%20un%20mot%20de%20passe.pdf") {
        NSWorkspace.shared.open(url)
    }
}

func isApplicationInstalled(bundleIdentifier: String) -> Bool {
    if let _ = NSWorkspace.shared.urlForApplication(withBundleIdentifier: bundleIdentifier) {
        return true
    } else {
        return false
    }
}

func launchApplication(bundleIdentifier: String) {
    if let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: bundleIdentifier) {
        let configuration = NSWorkspace.OpenConfiguration()
        NSWorkspace.shared.openApplication(at: url, configuration: configuration) { _, _ in
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    SetupContent()
}

#Preview {
    AboutContent()
}

#Preview {
    AfterCreation()
}
