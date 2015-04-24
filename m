From: alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org
Subject: [PATCHv2 0/2] i.MX6-SabreAuto: DTS: use gpio-hog to enable WEIM-NOR at boo
Date: Fri, 24 Apr 2015 01:00:19 -0700
Message-ID: <1429862420-15434-1-git-send-email-alison_chaiken@mentor.com>
References: <20150423063127.GJ6325@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150423063127.GJ6325-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

The parallel NOR on the i.MX6 SabreAuto boards is connected by the
WEIM simple bus.  WEIM needs gpio5 low at boot in order to properly
set the steering of I2C3.

Rather than modifying the GPIO5 node in a new DTSI file, it would be better
to add the weim_nor gpio-hog to imx6qdl.dtsi and disable it by default.
However, gpio-hogs are always enabled, so inclusion of a separate, new
file is necessary.

Changes since version 1:

... Refer to gpio5 by its phandle rather than overriding the node
    completely.

... Change the name of the new file for greater consistency with other
    i.MX6 dtsi files.

Alison Chaiken (1):
  i.MX6-SabreAuto: DTS: use gpio-hog to enable WEIM-NOR at boot

 arch/arm/boot/dts/imx6qdl-sabreauto-weim-nor.dtsi | 43 +++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6qdl-sabreauto-weim-nor.dtsi

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
