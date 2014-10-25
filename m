From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv0] arm: mvebu: add .dts file for Synology DS213j
Date: Sun, 26 Oct 2014 00:16:11 +0200
Message-ID: <20141025221611.GA14620@lunn.ch>
References: <3d0cc6de9ea5506d5fb201129ad277e57d0cdfc8.1414268057.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3d0cc6de9ea5506d5fb201129ad277e57d0cdfc8.1414268057.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnaud

Nice to see another device supported.

> - When I bought the NAS, it had an old Marvell bootloader. After install
>   of latest DSM version, the u-boot was a new one w/ I had to change the
>   'ranges' in the .dts to the ones below to have the kernel boot. I guess
>   new DS213j hardware will be shipped with new u-boot version at some
>   point and this will be fine; Otherwise, users will either have to
>   upgrade their DSM or manually s/1f/d0/ in .dts.

Marvell have made a real mess here. Since there seems to be two
different base addresses in use, i suggest you put a fat comment on
the top of the .dts file about this issue. Give users a clue what to
try if the kernel does not do anything at all.

 
> - Andrew,Ben: SPI flash partitions are correct, I can read all those,
>   'file' recognize them and the content looks kosher. Nonetheless, I did
>   a diff before and after a 'saveenv' under u-boot and u-boot
>   environment is saved by u-boot itself in the middle of the kernel
>   (0x40000 after the start of mtd1). This make kernel CRC incorrect and
>   prevent u-boot to boot the kernel. If you have any idea on this, I am
>   interested.

This sounds like the default install of u-boot does not make use of
any environment variables which are not the default value. Hence the
uboot environment store being in the middle of the kernel is not an
issue. Maybe you can ask for the u-boot sources, or see if they are on
the synology download site, and check this? Again, a fat warning in
the .dts file may be a good idea. What does seem odd is the Reboot,
FIS, etc, mtd partition names. Is there redboot installed at all?

> - Andrew, Ben: I did a single file for the .dts but I intend to create
>   a .dtsi; I have started a .dts for the DS414 (2-core Armada XP) and
>   they share various nodes.

O.K, good.

>  arch/arm/boot/dts/Makefile                       |   3 +-
>  arch/arm/boot/dts/armada-370-synology-ds213j.dts | 312 +++++++++++++++++++++++
>  2 files changed, 314 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/armada-370-synology-ds213j.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 38c89cafa1ab..95387b59ebb2 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -495,7 +495,8 @@ dtb-$(CONFIG_MACH_ARMADA_370) += \
>  	armada-370-mirabox.dtb \
>  	armada-370-netgear-rn102.dtb \
>  	armada-370-netgear-rn104.dtb \
> -	armada-370-rd.dtb
> +	armada-370-rd.dtb \
> +	armada-370-synology-ds213j.dtb
>  dtb-$(CONFIG_MACH_ARMADA_375) += \
>  	armada-375-db.dtb
>  dtb-$(CONFIG_MACH_ARMADA_38X) += \
> diff --git a/arch/arm/boot/dts/armada-370-synology-ds213j.dts b/arch/arm/boot/dts/armada-370-synology-ds213j.dts
> new file mode 100644
> index 000000000000..a99ccd0df20d
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-370-synology-ds213j.dts
> @@ -0,0 +1,312 @@
> +/*
> + * Device Tree file for Synology DS213j
> + *
> + * Copyright (C) 2014, Arnaud EBALARD <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */

There has been some discussion on using MIT or BSD for .dts files.
Your choice thought.

> +				pmx_syno_id_bit0: pmx_syno_id_bit0 {

Should always be _ in the first part, and - in the second. There are other nodes which are wrong.

> +				spi-flash@0 {
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					compatible = "n25q064";

Should have a vendor prefix.

> +			i2c@11000 {
> +				compatible = "marvell,mv64xxx-i2c";
> +				clock-frequency = <400000>;
> +				status = "okay";
> +
> +				s35390a: s35390a@30 {
> +					 compatible = "ssi,s35390a";
> +					 reg = <0x30>;
> +				};
> +			};

If it uses an external RTC, it makes sense the disable the internal
one.

> +
> +			serial@12000 {
> +				status = "okay";
> +			};
> +
> +			serial@12100 {
> +				status = "okay";
> +			};

It would be nice to put comments about what these two serial ports are
used for. i.e. internal header, and to a PIC for power control.

Looks good otherwise.

      Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
