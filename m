From: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 1/4] msm_serial: Use relative resources for iomem
Date: Thu, 18 Aug 2011 10:25:42 -0700
Message-ID: <1313688345-17699-2-git-send-email-davidb__38987.8494818278$1313689844$gmane$org@codeaurora.org>
References: <1313688345-17699-1-git-send-email-davidb@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Resent-Message-ID: <20110818173809.GA17990-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
Resent-To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
In-Reply-To: <1313688345-17699-1-git-send-email-davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Walker <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Device tree iomem resources are only accessible by index, and not by
name.  The msm_serial devices always have either 1 or 2 iomem
resources, that are always in the same order.  Convert the
platform_get_resource_byname into just platform_get_resource to
facilitate device tree conversion.

Signed-off-by: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/tty/serial/msm_serial.c |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index e6ba838..d9863b2 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -589,9 +589,8 @@ static void msm_release_port(struct uart_port *port)
 		iowrite32(GSBI_PROTOCOL_IDLE, msm_port->gsbi_base +
 			  GSBI_CONTROL);
 
-		gsbi_resource = platform_get_resource_byname(pdev,
-							     IORESOURCE_MEM,
-							     "gsbi_resource");
+		gsbi_resource = platform_get_resource(pdev,
+							IORESOURCE_MEM, 1);
 
 		if (unlikely(!gsbi_resource))
 			return;
@@ -612,8 +611,7 @@ static int msm_request_port(struct uart_port *port)
 	resource_size_t size;
 	int ret;
 
-	uart_resource = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						     "uart_resource");
+	uart_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (unlikely(!uart_resource))
 		return -ENXIO;
 
@@ -628,8 +626,7 @@ static int msm_request_port(struct uart_port *port)
 		goto fail_release_port;
 	}
 
-	gsbi_resource = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						     "gsbi_resource");
+	gsbi_resource = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	/* Is this a GSBI-based port? */
 	if (gsbi_resource) {
 		size = resource_size(gsbi_resource);
@@ -875,7 +872,7 @@ static int __init msm_serial_probe(struct platform_device *pdev)
 	port->dev = &pdev->dev;
 	msm_port = UART_TO_MSM(port);
 
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "gsbi_resource"))
+	if (platform_get_resource(pdev, IORESOURCE_MEM, 1))
 		msm_port->is_uartdm = 1;
 	else
 		msm_port->is_uartdm = 0;
@@ -899,8 +896,7 @@ static int __init msm_serial_probe(struct platform_device *pdev)
 	printk(KERN_INFO "uartclk = %d\n", port->uartclk);
 
 
-	resource = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						     "uart_resource");
+	resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (unlikely(!resource))
 		return -ENXIO;
 	port->mapbase = resource->start;
-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
