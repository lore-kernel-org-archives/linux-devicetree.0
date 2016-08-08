From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx6sx: Add UDOO Neo support
Date: Mon, 8 Aug 2016 22:04:39 +0800
Message-ID: <20160808140439.GH4678@tiger>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de>
 <1467691450-22975-3-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467691450-22975-3-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2016 at 06:04:09AM +0200, Andreas Färber wrote:
> +&fec1 {
> +	status = "okay";
> +	phy-handle = <&ethphy1>;

We generally have 'status' at the bottom of property list.

Shawn

> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy1: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +		};
> +	};
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
