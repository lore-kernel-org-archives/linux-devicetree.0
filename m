From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] Documentation/devicetree: document OCTEON USB bindings
Date: Tue, 5 May 2015 20:57:52 +0300
Message-ID: <20150505175752.GB2358@fuloong-minipc.musicnaut.iki.fi>
References: <1430423040-2088-1-git-send-email-aaro.koskinen@iki.fi>
 <3842439.qIvEyqJvhE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3842439.qIvEyqJvhE@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, May 05, 2015 at 12:02:04PM +0200, Arnd Bergmann wrote:
> What does that main node actually do?
> 
> The common setup is that you have regular ehci/ohci/uhci host bridges
> connected to an mmio bus, plus with shared PHY driver that would nowadays
> sit in drivers/phy/ and handle the setup of the physical USB interface.

The main node is not just PHY and clock control, there is also DMA
registers at least. Also the controller part is not generic ?hci.

> Is Octeon different from everything else here?

Certainly it's not like any generic COTS PC HW...

A.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
