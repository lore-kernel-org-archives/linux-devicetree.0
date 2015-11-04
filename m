From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: kirkwood: add Linksys EA3500
Date: Thu, 5 Nov 2015 00:38:22 +0100
Message-ID: <20151104233822.GC8263@lunn.ch>
References: <1446675888-24495-1-git-send-email-luka.perkov@sartura.hr>
 <00000150d49a832c-f77d66d7-8f66-4b36-ac2c-df85deee46b6-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00000150d49a832c-f77d66d7-8f66-4b36-ac2c-df85deee46b6-000000-p/GC64/jrecnJqMo6gzdpkEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luka Perkov <luka.perkov-RnoqsreqS2Fd2+I6+x7OVA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Luka

>  "lacie,netspace_mini_v2"
>  "lacie,netspace_v2"
>  "linksys,ea4500"
> +"linksys,ea3500"

Other way around please, to keep the sorted order.

> +	chosen {
> +		bootargs = "console=ttyS0,115200n8 earlyprintk";

stdout = ...

> +&nand {
> +	status = "okay";
> +	pinctrl-0 = <&pmx_nand>;
> +	pinctrl-names = "default";
> +
> +	partition@0 {
> +		label = "u-boot";
> +		reg = <0x0000000 0x80000>;
> +		read-only;
> +	};
> +
> +	partition@80000 {
> +		label = "u-boot environment";
> +		reg = <0x80000 0x20000>;
> +	};

Same hole?

> +	partition@200000 {
> +		label = "kernel";
> +		reg = <0x200000 0x200000>;
> +	};
> +
> +	partition@400000 {
> +		label = "root";
> +		reg = <0x400000 0x1200000>;
> +	};
> +};

  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
