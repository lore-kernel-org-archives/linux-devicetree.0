From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4] Documentation: dt: binding: fsl: add devicetree
 binding for describing RCPM
Date: Tue, 17 Nov 2015 17:16:51 -0600
Message-ID: <1447802211.27264.48.camel@freescale.com>
References: <1445841852-6830-1-git-send-email-dongsheng.wang@freescale.com>
	 <20151116172611.GA27814@rob-hp-laptop>
	 <1447726048.2262.385.camel@freescale.com>
	 <CAL_JsqLQPj43S=x4j2VenGC+-CSYxwPSMkQxB5HxGz+Uv_G3vA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLQPj43S=x4j2VenGC+-CSYxwPSMkQxB5HxGz+Uv_G3vA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jason.jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-11-17 at 16:05 -0600, Rob Herring wrote:
> On Mon, Nov 16, 2015 at 8:07 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > On Mon, 2015-11-16 at 11:26 -0600, Rob Herring wrote:
> > > We just merged a common wakeup source binding[1]. It doesn't really work
> > > in a similar way to what you have done, but I'd like to see something
> > > common here. How exactly wakeup is done tends to depend on whether
> > > interrupts are also wakeup signals or wake-up signally is completely
> > > separate from interrupts. Depending on that, I think there are 2 options
> > > here:
> > > 
> > > - Use the common binding and implement a stacked irqdomain for the
> > > wakeup controller.
> > 
> > I'm not sure what a stacked irqdomain is, but the mechanism described here
> > isn't about interrupts at all.  It's about controlling whether certain
> > devices
> > are kept awake in order to have the possibility of generating a wakeup.  I
> > believe the actual wakeup comes via the ordinary device interrupt.
> 
> Stacked irqdomains were recently added. They allow you to have
> multiple layers of control of interrupt lines. What you typically see
> is device interrupts will go to both the main interrupt controller and
> a special wake-up controller. So both devices need to be controlled.
> The main controller can be powered down in suspend, but the wake-up
> controller remains powered and can bring the cpu and interrupt
> controller back up.
> 
> Keeping a device awake (clocks and power on) is somewhat different
> than wake-up mechanisms and we generally have the subsystems needed
> for that.

I'm not sure how we'd map this to the clock infrastructure either.  We don't
have a control that turns the block on or off; instead, we have a bit that we
can set to tell the chip to not automatically turn a certain block off when
the chip goes to sleep.

> Directly exposing another block's registers to a client
> driver is generally not the right way to do things. Although there is
> syscon for all the misc signals the h/w designers just clumped
> together.

It's not really exposing the registers; it's exposing a wakeup specifier that
happens to match the content of a specific register.  The actual I/O is done
in the RCPM driver, not the client.

> > > - Extend the common binding to allow a phandle+args value to point to
> > > the wakeup controller.
> > 
> > Possibly, but the description in the common binding would have to be
> > fairly
> > vague to make the semantics fit.
> > 
> > The current common binding is also a bit confusing by saying that the
> > presence
> > of the property means that all of the device's interrupts can be used as
> > wakeup events, but then saying that there can also be a dedicated wakeup
> > but
> > not making it clear how to represent that...  Overloading it with device
> > power
> > control might muddy things even further.
> 
> I believe it just means any device interrupt can be used or only the
> irq named "wakeup" can be used.

That's what the examples show, but the binding itself says "device specific
interrupt name", not "wakeup".

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
