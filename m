From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] Documentation/devicetree: document OCTEON USB bindings
Date: Tue, 05 May 2015 12:02:04 +0200
Message-ID: <3842439.qIvEyqJvhE@wuerfel>
References: <1430423040-2088-1-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430423040-2088-1-git-send-email-aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 30 April 2015 22:44:00 Aaro Koskinen wrote:
> +1) Main node
> +
> +   Required properties:
> +
> +   - compatible: must be "cavium,octeon-5750-usbn"
> +
> +   - reg: specifies the physical base address of the USBN block and
> +     the length of the memory mapped region.
> +
> +   - #address-cells: specifies the number of cells needed to encode an
> +     address. The value must be 2.
> +
> +   - #size-cells: specifies the number of cells used to represent the size
> +     of an address. The value must be 2.
> +
> +   - ranges: specifies the translation between child address space and parent
> +     address space.
> +
> +   - refclk-frequency: speed of the USB reference clock. Allowed values are
> +     12000000, 24000000 or 48000000.
> +
> +   - refclk-type: type of the USB reference clock. Allowed values are
> +     "crystal" or "external".
> +
> +2) Child node
> +
> +   The main node must have one child node which describes the built-in
> +   USB controller.
> +
> +   Required properties:
> +
> +   - compatible: must be "cavium,octeon-5750-usbc"
> +
> +   - reg: specifies the physical base address of the USBC block and
> +     the length of the memory mapped region.
> +
> +   - interrupts: specifies the interrupt number for the USB controller.
> +
> 

What does that main node actually do?

The common setup is that you have regular ehci/ohci/uhci host bridges
connected to an mmio bus, plus with shared PHY driver that would nowadays
sit in drivers/phy/ and handle the setup of the physical USB interface.

Is Octeon different from everything else here?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
