From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Sat, 5 Nov 2016 22:04:41 +0100
Message-ID: <20161105210441.GB1216@lunn.ch>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161105203841.9661-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Martin Strba??ka <martin.strbacka-x+rMaJPWets@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> +&mdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mdio_pins>;
> +	status = "okay";
> +
> +	phy1: phy@1 {
> +		status = "okay";
> +		compatible = "marvell,88E1514", "marvell,88E1510", "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};

phy.txt says:

- compatible: Compatible list, may contain
  "ethernet-phy-ieee802.3-c22" or "ethernet-phy-ieee802.3-c45" for
  PHYs that implement IEEE802.3 clause 22 or IEEE802.3 clause 45
  specifications. If neither of these are specified, the default is to
  assume clause 22.

  If the phy's identifier is known then the list may contain an entry
  of the form: "ethernet-phy-idAAAA.BBBB" where
     AAAA - The value of the 16 bit Phy Identifier 1 register as
            4 hex digits. This is the chip vendor OUI bits 3:18
     BBBB - The value of the 16 bit Phy Identifier 2 register as
            4 hex digits. This is the chip vendor OUI bits 19:24,
            followed by 10 bits of a vendor specific ID.

  The compatible list should not contain other values than those
  listed here.

Please don't list the "marvell,*" names.

       Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
