From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH net-next v7 1/2] dt-bindings: net: add DT bindings for Socionext UniPhier AVE
Date: Thu, 21 Dec 2017 21:45:54 +0900
Message-ID: <20171221214553.D308.4A936039@socionext.com>
References: <1513854776-4149-2-git-send-email-hayashi.kunihiko@socionext.com> <20171221113254.GB9930@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221113254.GB9930-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Andrew,

On Thu, 21 Dec 2017 12:32:54 +0100 Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> > +Optional properties:
> > + - resets: A phandle to the reset control for the MAC
> > + - local-mac-address: See ethernet.txt in the same directory.
> > +
> > +Required subnode:
> > + - mdio: Device tree subnode with the following required properties:
> > +
> > +Example:
> 
> It sounds like there should be some properties before the Example.

Indeed, this is my carelessness.

> 
>    Andrew
> 
> > +
> > +	ether: ethernet@65000000 {
> > +		compatible = "socionext,uniphier-ld20-ave4";
> > +		reg = <0x65000000 0x8500>;
> > +		interrupts = <0 66 4>;
> > +		phy-mode = "rgmii";
> > +		phy-handle = <&ethphy>;
> > +		clocks = <&sys_clk 6>;
> > +		resets = <&sys_rst 6>;
> > +		local-mac-address = [00 00 00 00 00 00];
> 
> Typically you would put a blank line here, before the mdio node.

Okay, I'll put it.

> > +		mdio {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			ethphy: ethphy@1 {
> > +				reg = <1>;
> > +			};
> > +		};
> > +	};
> 
>   Andrew

Thank you,

---
Best Regards,
Kunihiko Hayashi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
