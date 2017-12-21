From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv3 1/3] dt-bindings: net: Add DT bindings for Socionext
 Netsec
Date: Thu, 21 Dec 2017 14:55:41 +0100
Message-ID: <20171221135541.GC15416@lunn.ch>
References: <1513858196-14137-1-git-send-email-jassisinghbrar@gmail.com>
 <1513858254-14197-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513858254-14197-1-git-send-email-jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +- mdio device tree subnode: When the Netsec has a phy connected to its local
> +		mdio, there must be device tree subnode with the following
> +		required properties:
> +
> +	- compatible: Must be "socionext,snq-mdio".

Is there a need for a compatible string? Is there different versions
of the MDIO bus hardware? If it was an independent MDIO bus driver,
then yes, you need a compatible string. But since it is embedded in
the MAC driver, there should not be a need.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
