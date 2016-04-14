From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4 v4] iio: st_sensors: support open drain mode
Date: Thu, 14 Apr 2016 08:30:34 -0500
Message-ID: <20160414133034.GA10104@rob-hp-laptop>
References: <1460466079-15392-1-git-send-email-linus.walleij@linaro.org>
 <CAL_JsqKudTxbK9goinYCQhGLK=Gd_+PHgQ+mnpkU=cz4pB0k2w@mail.gmail.com>
 <CACRpkdZs6g+UEOo+pEd1bS1tV7JpUhA1uJ9s6i=Jr39R=2RGfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZs6g+UEOo+pEd1bS1tV7JpUhA1uJ9s6i=Jr39R=2RGfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Giuseppe Barba <giuseppe.barba-qxv4g6HH51o@public.gmane.org>, Denis Ciocca <denis.ciocca-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 10:36:53AM +0200, Linus Walleij wrote:
> On Wed, Apr 13, 2016 at 10:52 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, Apr 12, 2016 at 8:01 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >> Some types of ST Sensors can be connected to the same IRQ line
> >> as other peripherals using open drain. Add a device tree binding
> >> and a sensor data property to flip the right bit in the interrupt
> >> control register to enable open drain mode on the INT line.
> >>
> >> If the line is set to be open drain, also tag on IRQF_SHARED
> >> to the IRQ flags when requesting the interrupt, as the whole
> >> point of using open drain interrupt lines is to share them with
> >> more than one peripheral (wire-or).
> >>
> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Cc: Giuseppe Barba <giuseppe.barba-qxv4g6HH51o@public.gmane.org>
> >> Cc: Denis Ciocca <denis.ciocca-qxv4g6HH51o@public.gmane.org>
> >> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >> ChangeLog v3->v4:
> >> - Rename DT bool property st,int-pin-open-drain to int-pin-open-drain
> >> - Rob Herring ACKed st,int-pin-open-drain but not including his ACK
> >>   on this even though it's close
> >
> > We already have st,irq-open-drain, gpio-open-drain, linux,open-drain
> > and drive-open-drain (from pinctrl).
> >
> > If we want something common, then it should probably be part of
> > interrupt bindings, not something common to IIO.
> 
> I could agree to use the pin control drive-open-drain;
> 
> It has very little to do with the interrupt bindings, there are
> so many interrupt lines in the world, the fact that some of them
> go over open drain rails doesn't matter to the interrupt-controller
> devices, it needs to be below them.

Yes, but it is open drain because the interrupt is shared. That fact is 
enough to determine how to configure the pin. Unfortunately, it is a bit 
hard to determine an interrupt is shared based on how the interrupt 
bindings work. Adding a flag doesn't work because the cell contents are 
specific to the interrupt controller (though we have standardized them 
to some extent).

> I will resubmit using the pin control binding.

Given I don't have a better suggestion, that sounds fine.

Rob
