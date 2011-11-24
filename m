From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 12/34] usb: dwc3: core: add DeviceTree match table
Date: Thu, 24 Nov 2011 13:02:14 +0200
Message-ID: <1322132556-16805-13-git-send-email-balbi__35653.641066938$1322135212$gmane$org@ti.com>
References: <1322132556-16805-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Resent-Message-ID: <20111124113823.GI3352-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
Resent-To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
In-Reply-To: <1322132556-16805-1-git-send-email-balbi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

in the long run we will have DeviceTree creating
all devices for us. Adding a match table here is
the first step towards that goal.

Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/dwc3/core.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 410835e..dab28f1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -515,11 +515,19 @@ static int __devexit dwc3_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id of_dwc3_match[] = {
+	{
+		"synosys,dwc3",
+	},
+	{  }, /* Terminating Entry */
+};
+
 static struct platform_driver dwc3_driver = {
 	.probe		= dwc3_probe,
 	.remove		= __devexit_p(dwc3_remove),
 	.driver		= {
 		.name	= "dwc3",
+		.of_match_table = of_dwc3_match,
 	},
 };
 
-- 
1.7.8.rc3
