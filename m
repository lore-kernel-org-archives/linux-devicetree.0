From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH 0/4] Qualcomm Shared Memory State Machines
Date: Tue, 8 Sep 2015 15:22:27 -0700
Message-ID: <20150908222227.GY13472@usrtlx11787.corpusers.net>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
 <CACRpkdb-624MauE4sS0mqxarXRRaS3sEB2aMzeRNZw945xhMnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb-624MauE4sS0mqxarXRRaS3sEB2aMzeRNZw945xhMnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 08 Sep 05:20 PDT 2015, Linus Walleij wrote:

> On Thu, Aug 27, 2015 at 7:37 PM, Bjorn Andersson
> <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
> 
> Let's discuss this a bit, looping in Mark Brown.
> 
> > As some of these states on some platforms are passed as physical signals
> > instead, the two drivers are modelled as gpio- and interrupt-controllers -
> > providing a nice abstraction both in device tree sense and Linux implementation
> > sense.
> 
> I have unfortunately repeatedly encountered an argument of the type
> "GPIO has nice infrastructure so let's call X 'a kind of GPIO' so
> we can use that nice infrastructure".
> 

I guess that's what you get for maintaining a subsystem with "general
purpose" in the name ;)

Sorry for adding one more item to your list.

> I'm not pleased with something that is not really general purpose
> input/output being called GPIO. It fits badly with the GPIO subsystem
> when we support things like open drain and cross-mappings to
> the pin control subsystem that will never be applicable to these
> new users. It's more like "special purpose input/output" or
> something.
> 

Right, this doesn't match at all with the electrical properties.

What it does give is the nice symmetry with the irq bits and existing
apis for poking and peeking.

> This happened with syscon LEDs for example, and was the reason
> I implemented syscon-leds. The original proposal was to say the LEDs
> register was "a kind of GPIO" on top of regmap and then use gpio-leds
> on top of that. Instead I insisted it was a syscon/regmap and the
> LEDs go directly to that, bypassing one layer of abstraction.
> 
> I also imagine creating syscon-keys.c for input from arbitrary keys
> in a syscon register actually. Just didn't get around to that yet.
> 

The difference with those two cases is that the pieces didn't fit
together, so we tried to use the gpio framework as an adaptor to make it
work.

I picked the gpio framework because:
* the DT nicely represent the structure of the memory and relationship
  between the individual components.

* the implementation needs to be able to set and clear individual bits,
  as well as register handlers for state changes.

* I'm told the SMP2P entries are on some platform (I've never seen)
  actual gpio lines.

> I also see some of the stuff GPIO does out-of-the-box being useful,
> for example in MFD: some of these are interrupt controllers and
> basically duplicate the kind of code I have in gpiolib for
> GPIOLIB_IRQCHIP.
> 

I do learn about new helper functions every time I touch these things.

> So we need to figure out what is really needed.
> 
> While sparsely documented: what about regmap (maybe in the
> form of syscon) and drivers/base/regmap/regmap-irq.c for the
> interrupt handling?
> 

regmap-irq looks good and reasonable.

The problem is that for SMSM I need custom masking operations and on
SMP2P I have multiple regmaps sharing one incoming IRQ. So it doesn't
look applicable for my use cases.

> I cannot claim to understand regmap-irq.c, but I just intuitively
> think it deserves consideration, such that drivers who need one
> of these misc registers can read/write their bits with regmap
> accessors and also get IRQs by way of regmap-irq.
> 

I was expecting some push back from you, but as it was the cleanest
abstraction I would come up with I gave it a shot :)

I'll rewrite the outgoing part based on regmaps instead. Thanks for
reviewing.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
