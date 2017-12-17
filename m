From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] arm: sunxi: IR support for A83T
Date: Sun, 17 Dec 2017 23:45:42 +0100
Message-ID: <20171217224547.21481-1-embed3d@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for the sunxi A83T ir module and enhances the sunxi-ir driver.
Right now the base clock frequency for the ir driver is a hard coded define and is set to 8 MHz.
This works for the most common ir receivers. On the Sinovoip Bananapi M3 the ir receiver needs,
a 3 MHz base clock frequency to work without problems with this driver.

This patch series adds support for an optinal property that makes it able to override the default
base clock frequency and enables the ir interface on the a83t and the Bananapi M3.

changes since rfc:
* The property is now optinal. If the property is not available in the dtb the driver 
  uses the default base clock frequency.
* the driver prints out the the selected base clock frequency.
* changed devicetree property from base-clk-frequency to clock-frequency

Regards,
Philipp

rfc: https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg123359.html 

Philipp Rossak (5):
  media: rc: update sunxi-ir driver to get base clock frequency from
    devicetree
  media: dt: bindings: Update binding documentation for sunxi IR
    controller
  arm: dts: sun8i: a83t: Add the ir pin for the A83T
  arm: dts: sun8i: a83t: Add support for the ir interface
  arm: dts: sun8i: a83t: bananapi-m3: Enable IR controller

 Documentation/devicetree/bindings/media/sunxi-ir.txt |  2 ++
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts         |  7 +++++++
 arch/arm/boot/dts/sun8i-a83t.dtsi                    | 15 +++++++++++++++
 drivers/media/rc/sunxi-cir.c                         | 20 ++++++++++++--------
 4 files changed, 36 insertions(+), 8 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
