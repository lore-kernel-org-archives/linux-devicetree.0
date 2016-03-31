From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 0/8] ARM: dts: update Ka-Ro i.MX6 module support
Date: Thu, 31 Mar 2016 14:14:05 +0800
Message-ID: <20160331061405.GP28207@tiger>
References: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457424244-14549-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2016 at 09:03:56AM +0100, Lothar Wa=DFmann wrote:
> This patch set updates the Ka-Ro electronics i.MX6 based module
> support and adds support for some new modules and a new baseboard.
>=20
> changes vs. v1:
> - relicense DTS files under GPLv2/X11
> - dropped patches which have been applied already
> - added some cleanup patches
>=20
> [PATCHv2 1/8] ARM: dts: imx6-tx6: Relicense the Ka-Ro DT files under =
GPLv2/X11
> [PATCHv2 2/8] ARM: dts: imx6-tx6: cleanup; no functional change
> [PATCHv2 4/8] ARM: dts: imx6-tx6: disable the spi node by default
> [PATCHv2 5/8] ARM: dts: imx6-tx6: remove container node around pinctr=
l nodes
> [PATCHv2 6/8] ARM: dts: imx6qdl-tx6: add mdio node for ethernet phy

Applied above 5 patches, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
