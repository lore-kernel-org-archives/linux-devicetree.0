From: John Youn <johnyoun@synopsys.com>
Subject: [PATCH v3] usb: dwc2: add amcc,dwc-otg support
Date: Tue, 15 Nov 2016 15:03:40 -0800
Message-ID: <e2d277d12b82ea88e5092058e883f7cdecb5cec3.1479250846.git.johnyoun__33116.4007577629$1479251140$gmane$org@synopsys.com>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Felipe Balbi <balbi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, John Youn <johnyoun@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christian Lamparter <chunkeey@googlemail.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Christian Lamparter <chunkeey@googlemail.com>

This patch adds support for the "amcc,usb-otg" device
which is found in the PowerPC Canyonlands' dts.

The device definition was added by:

commit c89b3458d8cc ("powerpc/44x: Add USB DWC DTS entry to Canyonlands
board")

but without any driver support as the dwc2 driver wasn't available at
that time.

Note: The system can't use the generic "snps,dwc2" compatible
because of the special ahbcfg configuration. The default
GAHBCFG_HBSTLEN_INCR4 of snps,dwc2 can cause a system hang
when the USB and SATA is used concurrently.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: John Youn <johnyoun@synopsys.com>
---

Sorry, the previous one broke compilation. This fixes it.

Regards,
John

v3 [johnyoun]:
* Fixed compilation issue

v2 [johnyoun]:
* Removed params struct
* Minor commit message formatting

 Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
 drivers/usb/dwc2/params.c                      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index ad8f7ff..6c7c2bce 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -12,6 +12,7 @@ Required properties:
   - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XRX SoCs;
   - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
   - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
+  - "amcc,dwc-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 513556a..a786256 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -239,6 +239,7 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "samsung,s3c6400-hsotg", .data = NULL},
 	{ .compatible = "amlogic,meson8b-usb", .data = &params_amlogic },
 	{ .compatible = "amlogic,meson-gxbb-usb", .data = &params_amlogic },
+	{ .compatible = "amcc,dwc-otg", .data = NULL },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-- 
2.10.0
