From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: kirkwood: Add DTS for Linksys
 EA4200v2/EA4500
Date: Mon, 4 Apr 2016 14:10:45 +0200
Message-ID: <20160404121045.GB21828@lunn.ch>
References: <1459770433-2876-1-git-send-email-bert@biot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459770433-2876-1-git-send-email-bert-Nh2F35Ii2RQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Vermeulen <bert-Nh2F35Ii2RQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 04, 2016 at 01:47:12PM +0200, Bert Vermeulen wrote:
> This platform is based on a Marvell 88E6282 SoC and 88E6171 switch.
> ---

Hi Bert

Under the --- it is normal to list what you have changed. That helps
the reviewer focus on just the changes.

>  arch/arm/boot/dts/kirkwood-viper.dts | 236 +++++++++++++++++++++++++++++++++++

Please include linksys in the filename.

ls *linksys*
armada-385-linksys-caiman.dts  armada-385-linksys.dtsi
armada-385-linksys-cobra.dts   armada-xp-linksys-mamba.dts

>  1 file changed, 236 insertions(+)
>  create mode 100644 arch/arm/boot/dts/kirkwood-viper.dts

Please add this file to the Makefile. And keep the entries in
alphabetical order.

Otherwise this looks good.

Thanks
	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
