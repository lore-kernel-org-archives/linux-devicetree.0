From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCHv2 0/8] ARM: dts: update Ka-Ro i.MX6 module support
Date: Tue,  8 Mar 2016 09:03:56 +0100
Message-ID: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set updates the Ka-Ro electronics i.MX6 based module
support and adds support for some new modules and a new baseboard.

changes vs. v1:
- relicense DTS files under GPLv2/X11
- dropped patches which have been applied already
- added some cleanup patches

[PATCHv2 1/8] ARM: dts: imx6-tx6: Relicense the Ka-Ro DT files under GPLv2/X11
[PATCHv2 2/8] ARM: dts: imx6-tx6: cleanup; no functional change
[PATCHv2 3/8] ARM: dts: imx6-tx6: remove regulator bus
[PATCHv2 4/8] ARM: dts: imx6-tx6: disable the spi node by default
[PATCHv2 5/8] ARM: dts: imx6-tx6: remove container node around pinctrl nodes
[PATCHv2 6/8] ARM: dts: imx6qdl-tx6: add mdio node for ethernet phy
[PATCHv2 7/8] ARM: dts: imx6: add support for more Ka-Ro electronics modules
[PATCHv2 8/8] ARM: dts: imx6: add support for the Ka-Ro electronics 'MB7' baseboard

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
