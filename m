From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] Documentation/devicetree: document OCTEON USB bindings
Date: Mon, 18 May 2015 22:13:20 +0300
Message-ID: <20150518191320.GF609@fuloong-minipc.musicnaut.iki.fi>
References: <1430423040-2088-1-git-send-email-aaro.koskinen@iki.fi>
 <3842439.qIvEyqJvhE@wuerfel>
 <20150505175752.GB2358@fuloong-minipc.musicnaut.iki.fi>
 <2413453.XQqLtVJvlF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2413453.XQqLtVJvlF@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, May 05, 2015 at 10:42:36PM +0200, Arnd Bergmann wrote:
> On Tuesday 05 May 2015 20:57:52 Aaro Koskinen wrote:
> > 
> > On Tue, May 05, 2015 at 12:02:04PM +0200, Arnd Bergmann wrote:
> > > What does that main node actually do?
> > > 
> > > The common setup is that you have regular ehci/ohci/uhci host bridges
> > > connected to an mmio bus, plus with shared PHY driver that would nowadays
> > > sit in drivers/phy/ and handle the setup of the physical USB interface.
> > 
> > The main node is not just PHY and clock control, there is also DMA
> > registers at least. Also the controller part is not generic ?hci.
> 
> Are you sure it's not one of the other common host implementations
> (synopsys dwc2, mentor musb, chipidea, ...) then? Maybe there is
> already a binding.

The usbn block is Cavium proprietary. The usbc part is apparantely
based on dwc2, but even still the current dwc2 driver does not work
with the cavium variant as it's coupled with usbn (and perhaps due
to some other undocumented differences).

> If not, would it make sense to put the two nodes into one that is
> just handled by a single driver?

It's already handled by single driver (staging/octeon-usb). The reason
for this specific binding is to allow compatibility with flashed firmware
providing the cavium DTB. But for my boards, I'm using in-tree DTB
so probably I could change it if that's strictly required.

A.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
