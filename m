From: "Imre Kaloz" <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: kirkwood: Add DTS for Linksys EA4200v2/EA4500
Date: Sun, 03 Apr 2016 11:56:36 +0200
Message-ID: <op.yfb8kmk22s3iss@ecaz>
References: <1459601753-31193-1-git-send-email-bert@biot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459601753-31193-1-git-send-email-bert-Nh2F35Ii2RQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Bert Vermeulen <bert-Nh2F35Ii2RQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x, ..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Sat, 02 Apr 2016 14:55:52 +0200, Bert Vermeulen <bert-Nh2F35Ii2RQ@public.gmane.org> wrote:

> This platform is based on a Marvell 88E6282 SoC and 88E6171 switch.
>
> The DSA port labels follow the switchdev convention.
>
> Signed-off-by: Bert Vermeulen <bert-Nh2F35Ii2RQ@public.gmane.org>

> --- /dev/null
> +++ b/arch/arm/boot/dts/kirkwood-candyhouse.dts

Candyhouse is the name of the platform, not the router. please use

arch/arm/boot/dts/kirkwood-linksys-viper.dts

> +	model = "Linksys Candyhouse (E4200v2 / EA4500)";
> +	compatible = "linksys,ea4500", "linksys,e4200v2",  
> "marvell,kirkwood-88f6282", "marvell,kirkwood";

The EA4200v2 is the same as the EA4500. The name is viper, so

compatible = "linksys,viper"



Best,

Imre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
