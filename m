From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: vf610-zii-dev: Add .dts file for rev. C
Date: Mon, 14 Nov 2016 18:10:34 +0100
Message-ID: <20161114171034.GC24546@lunn.ch>
References: <1479141306-15141-1-git-send-email-andrew.smirnov@gmail.com>
 <1479141306-15141-2-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479141306-15141-2-git-send-email-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

> +		mdio_mux_1: mdio@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			switch0: switch0@0 {
> +				compatible = "marvell,mv88e6390";

Hi Andrey

The driver for this is not in net-next yet. And when it is, it will
probably be called "marvell,mv88e6190", keeping to the pattern of the
lowest product ID which supports these features.

> +					port@4 {
> +						reg = <4>;
> +						label = "lan4";
> +					};
> +
> +					port@9 {
> +						reg = <9>;
> +						label = "lan4";
> +						phy-handle = <&switch0phy0>;
> +					};
> +

You have two "lan4". I would also suggest leaving port 9 out for the
moment. It needs clause 45 MDIO to talk to the PHY, which we don't
have yet. Hence it cannot find it, and so give an error.

> +
> +					switch0port10: port@10 {
> +						reg = <10>;
> +						label = "dsa";
> +						phy-mode = "xgmii";
> +						link = <&switch1port10>;
> +						fixed-link {
> +							speed = <10000>;
> +							full-duplex;
> +						};

This fixed-link node is wrong, and invalid. 10000 is not supported by
the fixed link driver, only 10, 100, and 1000. Also, it is not
required. The DSA driver should configure the link to the fastest
possible speed the port supports. You only need a fixed-link property
when you need to configure it at a lower speed. Rev B also gets this
wrong.

> +					};
> +				};
> +
> +				mdio {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					switch0phy0: switch0phy0@0 {
> +						reg = <0>;
> +					};

I think the strapping for the PHY is such that it is at address 9.
Also, it is on the external mdio bus, not the internal mdio bus. The
6390 family has two MDIO busses. I have patches to support this, which
will appear eventually.

  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
