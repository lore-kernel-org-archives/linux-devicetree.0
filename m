From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/3] prepare GPC driver for multiple domain support
Date: Mon, 23 Nov 2015 16:07:00 +0100
Message-ID: <1448291223-9938-1-git-send-email-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series reworks the i.MX6 GPC driver to support multiple power
domains. The main issue is the DT binding which is not sufficient
to support more than the single "PU" domain present on MX6Q.

This series introduces a new DT binding, which is more flexible and
allows to model different numbers of power domains with a single
unified binding. The driver is then reworked to split things a bit
more cleanly and work with the new binding. Compatibility for the
currently supported i.MX6Q/DL binding is kept, but deprecated, so
existing DTBs continue to work.

Regards,
Lucas

Lucas Stach (3):
  dt-bindings: add multidomain support to i.MX GPC DT binding
  ARM: imx6: rework GPC to support mutiple power domains
  ARM: imx6: adopt DT to new GPC binding

 .../devicetree/bindings/power/fsl,imx-gpc.txt      |  81 ++--
 arch/arm/boot/dts/imx6qdl.dtsi                     |  33 +-
 arch/arm/mach-imx/gpc.c                            | 435 ++++++++++++++++-----
 3 files changed, 407 insertions(+), 142 deletions(-)

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
