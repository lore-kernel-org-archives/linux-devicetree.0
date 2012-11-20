From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] powerpc/pseries: pci: Use NULL instead of 0 for pointers
Date: Tue, 20 Nov 2012 10:01:52 +0530
Message-ID: <1353385912-25882-2-git-send-email-tushar.behera@linaro.org>
References: <1353385912-25882-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353385912-25882-1-git-send-email-tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The third argument for of_get_property() is a pointer, hence pass
NULL instead of 0.

Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
This code is in a '#if 0' section, but I went ahead with the patch as
this is the only location in kernel where of_get_property is passed 0
as the third argument. If this function is not going to be used again,
then we may consider removing the code altogether.

 arch/powerpc/platforms/pseries/pci.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 56b864d..0b580f4 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -40,7 +40,8 @@ void pcibios_name_device(struct pci_dev *dev)
 	 */
 	dn = pci_device_to_OF_node(dev);
 	if (dn) {
-		const char *loc_code = of_get_property(dn, "ibm,loc-code", 0);
+		const char *loc_code = of_get_property(dn, "ibm,loc-code",
+				NULL);
 		if (loc_code) {
 			int loc_len = strlen(loc_code);
 			if (loc_len < sizeof(dev->dev.name)) {
-- 
1.7.4.1
