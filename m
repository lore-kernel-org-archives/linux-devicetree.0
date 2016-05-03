From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: add Cypress FM33256B Processor Companion driver
Date: Tue, 3 May 2016 10:14:18 +0200
Message-ID: <20160503081418.GC2335@piout.net>
References: <1461150471-23163-1-git-send-email-jlp@gomspace.com>
 <1461150471-23163-2-git-send-email-jlp@gomspace.com>
 <20160422193232.GA9737@rob-hp-laptop>
 <20160422201153.GB17051@piout.net>
 <571F7BD2.60201@gomspace.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <571F7BD2.60201-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/04/2016 at 16:31:46 +0200, Jeppe Ledet-Pedersen wrote :
> > Good catch, I didn't look at this patch but it includes a lot of code
> > that should be going to the RTC driver.
> > If trickle charging is not enabled, I guess the RTC will not charge its
> > backup battery.
> 
> Thank you for the comments.
> 
> Alexandre is correct. If the "cypress,charge-enabled" property is
> present, the internal 80 uA trickle charger is enabled to charge a
> backup capacitor on the VBAK pin.
> 
> Do you want more code than the trickle charger setup moved to the RTC
> driver?
> 

I guess the 32k oscillator could go in the rtc driver too.

> >>> +- cypress,charge-fast: enable fast (1 mA) charging
> >>
> >> What does fast mean?
> >>
> 
> Fast charging means charging with 1 mA instead of 80 uA. The wording is
> from the datasheet, but I agree it should be renamed to something that
> better explains what the difference is.
> 
> >> I think it is time for a common binding here. There's all sorts of 
> >> variations on setting the charge current in bindings. Add something like 
> >> "charge-current-microamp" in power_supply.txt and use it here. Then 
> >> 1000uA implies "fast charge".
> > 
> > Well, this is not a power supply, it is an RTC.
> > 
> > I think both properties should got to the RTC subdevice and be parsed in
> > the RTC driver.
> 
> The backup capacitor is primarily used to supply current to the RTC, but
> a couple of other registers are also battery-backed (watchdog reset
> cause, event counter), so I put the charger setup in the main MFD file.
> 
> If you prefer, I can move them both to the RTC driver?

I would prefer unless you think that many people are not using the RTC
while still using the watchdog (I'd say that is not the case).

> 
> > Note that for trickle charging, we currently have the following
> > properties:
> >  - trickle-resistor-ohms
> >  - trickle-diode-disable
> >  - abracon,tc-diode
> >  - abracon,tc-resistor
> > 
> > abracon,tc-resistor can be replaced by trickle-resistor-ohms, I'll make
> > a patch but abracon,tc-diode allows to select a diode type (and in
> > particular a voltage drop).
> > 
> > I think we could add a trickle-current-microamp like you suggested and
> > trickle-diode-disable can be reused.
> 
> So replace "cypress,charge-enabled/charge-fast" with
> "trickle-current-microamp" and a check for 0/80/1000 uA?
> 

Yeah, seems fine.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
