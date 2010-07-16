From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/8] drivers/of: Make device tree code work on any arch.
Date: Fri, 16 Jul 2010 11:13:35 -0700
Message-ID: <592c6c35-556d-4874-8b75-2ebf0acf00e9@VA3EHSMHS011.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279304021-22216-2-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

---

I'm not sure what the right way to abstract these functions is.
of_node_to_nid seems specific to those platforms which have a root
device tree.  pci_address_to_pio seems to probably have a useful
implementation, but I'm not sure what it's trying to do.  Perhaps
someone can shed some light?
---
 drivers/of/address.c |    5 +++++
 drivers/of/device.c  |    7 ++++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index fcadb72..61e652b 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -539,7 +539,12 @@ static int __of_address_to_resource(struct device_node *dev, const u32 *addrp,
 	memset(r, 0, sizeof(struct resource));
 	if (flags & IORESOURCE_IO) {
 		unsigned long port;
+		// FIXME: utter hack...
+#if defined(CONFIG_MICROBLAZE) || defined(CONFIG_POWERPC)
 		port = pci_address_to_pio(taddr);
+#else
+		port = -1;
+#endif
 		if (port == (unsigned long)-1)
 			return -EINVAL;
 		r->start = port;
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 5282a20..27a65fc 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -107,8 +107,13 @@ int of_device_register(struct of_device *ofdev)
 	/* device_add will assume that this device is on the same node as
 	 * the parent. If there is no parent defined, set the node
 	 * explicitly */
-	if (!ofdev->dev.parent)
+	if (!ofdev->dev.parent) {
+#if defined(CONFIG_MICROBLAZE) || defined(CONFIG_POWERPC) || defined(CONFIG_SPARC) 
 		set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
+#else
+		set_dev_node(&ofdev->dev, -1);
+#endif
+	}
 
 	return device_add(&ofdev->dev);
 }
-- 
1.5.6.6



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
