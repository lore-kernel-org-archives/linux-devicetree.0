From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: kirkwood: add Linksys EA4500
Date: Wed, 04 Nov 2015 23:41:01 +0100
Message-ID: <3957044.Sz6eC5OsVr@wuerfel>
References: <00000150d49a7cf7-e97bf540-89ce-49bf-a25e-2d082acab273-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <00000150d49a7cf7-e97bf540-89ce-49bf-a25e-2d082acab273-000000-p/GC64/jrecnJqMo6gzdpkEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Luka Perkov <luka.perkov-RnoqsreqS2Fd2+I6+x7OVA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 04 November 2015 22:25:05 Luka Perkov wrote:
> +/ {
> +	model = "Linksys EA4500";
> +	compatible = "linksys,ea4500", "marvell,kirkwood-88f6282", "marvell,kirkwood";

According to https://wikidevi.com/wiki/Linksys_EA4500 there are multiple versions
of this device, and at least EA4500v3 is completely incompatible with the version
in this patch. Should we add "linksys,ea4500v1" as a compatible string to identify
this better?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
