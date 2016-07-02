From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: sun4i-lradc: Add binding documentation
Date: Sat, 2 Jul 2016 15:32:43 +0200
Message-ID: <20160702133243.GB20045@piout.net>
References: <1467406855-9677-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAGb2v66PzgVqVGxs4FSQkkX=2hX42UmftahOgJmepv4wA-mwnw@mail.gmail.com>
 <777642fd-5e77-206f-a503-23bbf187e6f3@redhat.com>
 <20160702110227.GB4604@lukather>
 <9b02394e-b38b-c804-780b-e9707c292486@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9b02394e-b38b-c804-780b-e9707c292486-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/07/2016 at 13:45:18 +0200, Hans de Goede wrote :
> Hi,
> 
> On 02-07-16 13:02, Maxime Ripard wrote:
> > On Sat, Jul 02, 2016 at 11:32:07AM +0200, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 02-07-16 11:12, Chen-Yu Tsai wrote:
> > > > Hi,
> > > > 
> > > > On Sat, Jul 2, 2016 at 5:00 AM, Alexandre Belloni
> > > > <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > > > Document the bindings for the Allwinner LRADC.
> > > > 
> > > > We already have Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> > > > and I'm pretty sure Hans (CC-ed) argued that this is not a generic ADC
> > > > block.
> > > 
> > > Right, this block is used on many tablets and some dev boards to
> > > provide buttons (as in the hid type) and the block is designed for
> > > this purpose, giving an irq when the adc level crosses a certain
> > > threshold.
> > > 
> > > Sure it can be used in a more generic way, but that is not its
> > > primary goal.
> > 
> > We've always had a different view on this, but it's a detail :)
> > 
> > > So any generic purpose adc driver must not break the current
> > > use-case (which is already used in mainline kernel dts files
> > > in plenty of cases).
> > 
> > Yep.
> > 
> > > I believe that the best way to deal with this is to add an
> > > "allwinner,general-purpose-mode" flag to the existing binding
> > > (as well as document general purpose mode in the existing
> > > binding rather then in a new binding doc).
> > > 
> > > That seems to be the right thing to do purely looking at this
> > > from a dt binding pov.
> > 
> > There's a way simpler solution: if there's no child nodes, it's meant
> > to be used as an ADC, otherwise, as input.
> > 
> > The logic will have to be a bit more complex than that, since there's
> > two channels, and you could only require one for the buttons, leaving
> > the other one available as an ADC.
> > 
> > But that doesn't require any new property.
> 
> True, if there are no button nodes, then go general-purpose will
> work too.
> 

Well, I'd still argue that we need two different compatibles because
encoding the usage of an IP in its compatible string is less than ideal.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
