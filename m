From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v5 03/14] dt-bindings: net: Document Intel pch_gbe binding
Date: Sat, 17 Feb 2018 23:32:29 +0100
Message-ID: <20180217223229.GC21315@lunn.ch>
References: <20180217201037.3006-1-paul.burton@mips.com>
 <20180217201037.3006-4-paul.burton@mips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180217201037.3006-4-paul.burton-8NJIiSa5LzA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hassan Naveed <hassan.naveed-8NJIiSa5LzA@public.gmane.org>, Matt Redfearn <matt.redfearn-8NJIiSa5LzA@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> @@ -0,0 +1,25 @@
> +Intel Platform Controller Hub (PCH) GigaBit Ethernet (GBE)
> +
> +Required properties:
> +- compatible:		Should be the PCI vendor & device ID, eg. "pci8086,8802".
> +- reg:			Should be a PCI device number as specified by the PCI bus
> +			binding to IEEE Std 1275-1994.
> +- phy-reset-gpios:	Should be a GPIO list containing a single GPIO that
> +			resets the attached PHY when active.
> +

Hi Paul

Please see Documentation/devicetree/bindings/net/phy.txt. In
particular:

reset-gpios: The GPIO phandle and specifier for the PHY reset signal.

You should be conforming to the existing binding.

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
