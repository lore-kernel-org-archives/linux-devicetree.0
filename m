From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [GIT PULL] Mediatek: 32-bit DT update for v4.15
Date: Fri, 3 Nov 2017 09:37:18 +0800
Message-ID: <1509673038.19220.19.camel@mtkswgap22>
References: <c7145c00-b2b9-780c-0bfd-15f7d8a08dd6@gmail.com>
         <CAK8P3a3NWwoe0mX45WrFONyiHt9eWTTMziEc+rjqSfr5QZv8xQ@mail.gmail.com>
         <1509423579.10793.10.camel@mtkswgap22>
         <e8fdd9a9-ce13-8804-aea0-46becc6f9730@gmail.com>
         <CAK8P3a0+9fChSbObS9boR8okHtO8u8_hr2Te+RjfRD0T54QYWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a0+9fChSbObS9boR8okHtO8u8_hr2Te+RjfRD0T54QYWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Weiqing Kong <weiqing.kong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 2017-11-02 at 17:05 +0100, Arnd Bergmann wrote:
> On Thu, Nov 2, 2017 at 12:47 PM, Matthias Brugger
> <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi Arnd,
> >
> > On 10/31/2017 05:19 AM, Ryder Lee wrote:
> >> Hi Arnd,
> >>
> >> We have 3 root ports in MT7623, but this is a bug in this chip where the
> >> HW designers wired the IRQs in a nonstandard way. We've tried to
> >> statically assign the bus portion of the address part in the parent
> >> interrupt-map before, but this approach cannot handle the case - if we
> >> attach the device in random order.
> >>
> >
> > Ryder, please don't top post :)

Oh. My bad!

> >> Thanks.
> >>
> >> On Mon, 2017-10-30 at 13:42 +0100, Arnd Bergmann wrote:
> >>> On Mon, Oct 23, 2017 at 12:06 AM, Matthias Brugger
> >>> <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> - mt76233 add PCIe node
> >>>
> >>> Could you clarify what the subnodes in the PCI node are for? It seems odd
> >>> to have "interrupt-map" properties in both the pcie controller and its child
> >>> nodes, and I want to ensure this is following the standard PCIe binding before
> >>> I pull it.
> >>>
> >
> > Arnd, I didn't found the pull request in your next/dt branch.
> > Is there more clarification needed from our side?
> 
> I'm still unsure about it., this looks like exactly the thing that the top-level
> interrupt-map is supposed to handle fine.
> 
> Can you send a pull request for the series without the pci child nodes for the
> moment while we figure out what the exact problem is? We can take
> whatever fix we come up with during the v4.15 -rc cycle then.
> 
> I would assume that either the parent interrupt-map is wrong, or something
> broke the parser, but that it's not actually something that's wrong in the
> hardware design in a way that we can't already handle in a standard way.
> 
> Ryder, can you be more specific how the interrupts are wired up?
> Is there one IRQ per slot that is connected to all of IntA/IntB/IntC/IntD
> and gets propagated through the bridges like that, or is it something else?

Yes, that's what I mean - we only have one IRQ which is connected to all
INTx for each slot, and I'm not sure if there is any better way to solve
this problem. 

>      Arnd
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
