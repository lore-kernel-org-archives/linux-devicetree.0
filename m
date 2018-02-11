From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH usb-next v2 0/3] DWC3 support for Amlogic Meson AXG and GXL SoCs
Date: Sun, 11 Feb 2018 22:15:14 +0100
Message-ID: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Amlogic Meson AXG and GXL SoCs can use the dwc3-of-simple with little
modifications. These SoCs use:
- a gate clock for the USB components (DWC3, USB PHYs)
- a reset line which is shared across all USB components (DWC3, USB2 and
  USB3 PHYs, OTG detection logic inside the USB3 PHY registers)
- a reset pulse to trigger the reset
- depending on the SoC two or more PHYs (AXG: 1x USB2 and 1x USB3 PHY,
  GXL: 2x USB2 and 1x USB3 PHY)

This extends the dwc3-of-simple so it supports (depending on the
platform) shared and level resets. Additionally it adds new bindings
for the Amlogic Meson AXG and GXL SoCs, along with the documentation
(dt-bindings).

NOTE: for full support on Amlogic Meson GXL SoCs my other series called
"initialize (multiple) PHYs for a HCD" (see [0] for v8 of that series)
is required. However, there is no direct dependency on that series.
Especially since Meson AXG doesn't need it (since it only has one USB2
and one USB3 PHY, which is already supported by the current dwc3 driver,
unlike the 2x USB2 and 1x USB3 PHYs on Meson GXL).
So I believe that this series can still be merged, even if the other
patchset is not ready yet.


changes since v1 at [1]:
- use of_device_is_compatible() instead of struct dwc3_of_simple_params
  as requested by Felipe Balbi (affects PATCH #2 and #3)
- added Rob's Acked-by to the dt-bindings patch
- added Yixun Lan's Tested-by to the whole series as he tested this
  successfully (along with other patches) on the Amlogic Meson AXG SoC


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006274.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006286.html

Martin Blumenstingl (3):
  dt-bindings: usb: add support for dwc3 controller on Amlogic Meson GX
  usb: dwc3: of-simple: add support for shared and pulsed reset lines
  usb: dwc3: of-simple: add support for the Amlogic Meson GXL and AXG
    SoCs

 .../devicetree/bindings/usb/amlogic,dwc3.txt       | 42 ++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-of-simple.c                  | 31 ++++++++++++----
 2 files changed, 67 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
