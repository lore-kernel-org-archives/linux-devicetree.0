From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv1 0/3] arm: mvebu: add Synology DS213j and DS414 .dts
 files
Date: Sun, 16 Nov 2014 03:20:35 +0100
Message-ID: <20141116022035.GE15870@lunn.ch>
References: <cover.1416095841.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1416095841.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Andrew, in this v1, the two .dts files are still separate w/o any common
> .dtsi. I took a quick look it seems there are small differences between
> the two which make me wonder if its worth the trouble:
> 
>  - DS414 fans are not handled by the SoC
>  - various pinctrl variations
>  - a tiny difference in SPI flash partitioning
>  - phy-mode for ethernet interfaces
>  - different comments associated w/ same nodes (e.g. uart1)
>  - etc

O.K, lets wait for the moment. It could be that there is more in
common between different 370 devices, and between different XP
devices, but less in common across 370 and XP.

We can refactor it later when a pattern starts to appear.

>  - Added a comment in the .dts file about the bootloader screwing the kernel
>    if the environment is saved.

Is this well know in the forums? Do you think Synology knows about it?
It would be nice if it was fixed. Maybe not for these products, but
for the next generation.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
