From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 9/9] of: remove undefined request_OF_resource &
	release_OF_resource
Date: Sat, 13 Feb 2010 09:03:15 -0700
Message-ID: <20100213160314.4767.93924.stgit__5314.49568593434$1266077352$gmane$org@angua>
References: <20100213154838.4767.83881.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100213154838.4767.83881.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sparclinu
List-Id: devicetree@vger.kernel.org

Neither request_OF_resource or release_OF_resource are defined
anywhere.  Remove the declarations.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/include/asm/prom.h |    4 ----
 arch/powerpc/include/asm/prom.h    |    5 -----
 2 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index aa1a437..03f45a9 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -31,10 +31,6 @@
 /* Other Prototypes */
 extern int early_uartlite_console(void);
 
-extern struct resource *request_OF_resource(struct device_node *node,
-				int index, const char *name_postfix);
-extern int release_OF_resource(struct device_node *node, int index);
-
 /*
  * OF address retreival & translation
  */
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 7f9a50a..ddd408a 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -39,11 +39,6 @@ extern struct device_node* pci_device_to_OF_node(struct pci_dev *);
 extern void pci_create_OF_bus_map(void);
 #endif
 
-extern struct resource *request_OF_resource(struct device_node* node,
-				int index, const char* name_postfix);
-extern int release_OF_resource(struct device_node* node, int index);
-
-
 /*
  * OF address retreival & translation
  */
