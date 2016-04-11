From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 0/5] ARM: dts: update Ka-Ro i.MX6 module support
Date: Mon, 11 Apr 2016 21:57:49 +0800
Message-ID: <20160411135749.GD13735@tiger>
References: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
 <1459427625-15568-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459427625-15568-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 02:33:40PM +0200, Lothar Wa=DFmann wrote:
> This patch set updates the Ka-Ro electronics i.MX6 based module
> support and adds support for some new modules and a new baseboard.
>=20
> changes vs. v1:
> - relicense DTS files under GPLv2/X11
> - dropped patches which have been applied already
> - added some cleanup patches
>=20
> changes vs. v2:
> - dropped patches which have been applied already
> - addressed comments from Shawn Guo
> - added patch to remove LED pinctrl from hoggrp
> - added patch to enable rtscts support on UARTs
>=20
> [PATCHv3 1/5] ARM: dts: imx6-tx6: remove regulator bus
> [PATCHv3 2/5] ARM: dts: imx6-tx6: remove LED pinctrl setting from hog=
grp
> [PATCHv3 3/5] ARM: dts: imx6-tx6: enable support for rtscts on UARTs
> [PATCHv3 4/5] ARM: dts: imx6: add support for more Ka-Ro electronics =
modules
> [PATCHv3 5/5] ARM: dts: imx6: add support for the Ka-Ro electronics '=
MB7' baseboard

Applied all, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
