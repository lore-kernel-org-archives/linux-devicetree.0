From: Anton Vorontsov <avorontsov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] USB: FHCI: Use .dev.of_node instead of .node in struct
	of_device
Date: Sun, 2 May 2010 21:00:44 +0400
Message-ID: <20100502170044.GC14036@oksana.dev.rtsoft.ru>
References: <20100502165912.GA11300@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100502165912.GA11300-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixes following build failure:

drivers/usb/host/fhci-hcd.c: In function 'of_fhci_probe':
drivers/usb/host/fhci-hcd.c:568: error: 'struct platform_device' has no member named 'node'
drivers/usb/host/fhci-hcd.c:673: error: 'struct platform_device' has no member named 'node'

Signed-off-by: Anton Vorontsov <avorontsov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/fhci-hcd.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 84adca4..7b5c626 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -565,7 +565,7 @@ static int __devinit of_fhci_probe(struct of_device *ofdev,
 				   const struct of_device_id *ofid)
 {
 	struct device *dev = &ofdev->dev;
-	struct device_node *node = ofdev->node;
+	struct device_node *node = dev->of_node;
 	struct usb_hcd *hcd;
 	struct fhci_hcd *fhci;
 	struct resource usb_regs;
@@ -670,7 +670,7 @@ static int __devinit of_fhci_probe(struct of_device *ofdev,
 	}
 
 	for (j = 0; j < NUM_PINS; j++) {
-		fhci->pins[j] = qe_pin_request(ofdev->node, j);
+		fhci->pins[j] = qe_pin_request(node, j);
 		if (IS_ERR(fhci->pins[j])) {
 			ret = PTR_ERR(fhci->pins[j]);
 			dev_err(dev, "can't get pin %d: %d\n", j, ret);
-- 
1.7.0.5
