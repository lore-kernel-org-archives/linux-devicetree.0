From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: kirkwood: add Linksys EA4500
Date: Thu, 5 Nov 2015 00:34:47 +0100
Message-ID: <20151104233447.GB8263@lunn.ch>
References: <00000150d49a7cf7-e97bf540-89ce-49bf-a25e-2d082acab273-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00000150d49a7cf7-e97bf540-89ce-49bf-a25e-2d082acab273-000000-p/GC64/jrecnJqMo6gzdpkEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luka Perkov <luka.perkov-RnoqsreqS2Fd2+I6+x7OVA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 82d2ac9..264f8ba 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -124,6 +124,7 @@ lantiq	Lantiq Semiconductor
>  lenovo	Lenovo Group Ltd.
>  lg	LG Corporation
>  linux	Linux-specific binding
> +linksys	Belkin International, Inc.
>  lsi	LSI Corp. (LSI Logic)
>  lltc	Linear Technology Corporation
>  marvell	Marvell Technology Group Ltd.

Hi Luka

This part should probably be a patch of its own, sent to the DT
maintainers.

> +/ {
> +	model = "Linksys EA4500";
> +	compatible = "linksys,ea4500", "marvell,kirkwood-88f6282", "marvell,kirkwood";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x00000000 0x8000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200n8 earlyprintk";

Please use stdout-path = &uart0; You can also put the baud rate etc on
the end.

> +&nand {
> +	status = "okay";
> +	pinctrl-0 = <&pmx_nand>;
> +	pinctrl-names = "default";
> +
> +	partition@0 {
> +		label = "u-boot";
> +		reg = <0x0000000 0x80000>;
> +	};
> +
> +	partition@80000 {
> +		label = "u-boot environment";
> +		reg = <0x80000 0x20000>;
> +	};

Is there a hole here?

> +
> +	partition@200000 {
> +		label = "kernel";
> +		reg = <0x200000 0x200000>;
> +	};
> +
> +	partition@400000 {
> +		label = "root";
> +		reg = <0x400000 0x1c00000>;
> +	};
> +};

> +&eth0 {
> +	status = "okay";
> +	ethernet0-port@0 {
> +		speed = <1000>;
> +		duplex = <1>;
> +	};
> +};
> +
> +&eth1 {
> +	status = "okay";
> +	ethernet1-port@0 {
> +		speed = <1000>;
> +		duplex = <1>;
> +	};
> +};

Why fix the speed? Are they connected to a switch?

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
