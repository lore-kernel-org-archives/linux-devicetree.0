From: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: arizona: Add GPIO maintain state flag
Date: Thu, 13 Apr 2017 13:21:33 +0100
Message-ID: <1492086093.4826.25.camel@rf-debian.wolfsonmicro.main>
References: <1491568725-14882-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
         <20170410201758.lobmtzxt2jgcwwvc@rob-hp-laptop>
         <1491903267.4826.8.camel@rf-debian.wolfsonmicro.main>
         <20170413091513.GA1878@localhost.localdomain>
         <CACRpkdZ6PBv72BCn1bXsvhcHD2+dsCdh=3F3Vnnm7AWZqyWrig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZ6PBv72BCn1bXsvhcHD2+dsCdh=3F3Vnnm7AWZqyWrig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2017-04-13 at 14:14 +0200, Linus Walleij wrote:
> On Thu, Apr 13, 2017 at 11:15 AM, Charles Keepax
> <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> > On Tue, Apr 11, 2017 at 10:34:27AM +0100, Richard Fitzgerald wrote:
> 
> >> 3) The codec only has to be kept awake while any such GPIO is actually
> >> in use. See (2)
> >
> > Yeah option 3 is the primary issue here, we only want to keep the
> > CODEC enabled whilst specific GPIOs are in use. As GPIOs can be
> > dynamically requested/released by things in the kernel we want to
> > know which GPIOs require the CODEC to be kept alive. Also in the
> > future one might be tempted to add maintain whilst high and
> > maintain whilst low options for lines with pulls on them to
> > further optimise power.
> 
> Why does this have to be encoded as information in the device
> tree? Isn't it better to use a static table in the driver?
> 
> I don't see what use system integrators and others playing
> around with the device tree has of this, it will just be confusing
> to them if it is a chip-internal detail.
> 

They are GPIOs for connecting to external hardware, we don't know what
people are going to connect them to so they have to tell us how they
need them to behave.

> Yours,
> Linus Walleij


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
