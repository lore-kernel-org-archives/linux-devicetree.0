From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: Re: [PATCH 1/2] USB: Update EHCI-platform driver to devicetree.
Date: Sun, 21 Oct 2012 11:20:20 +1300
Message-ID: <1350771620.10819.3.camel@gitbox>
References: <Pine.LNX.4.44L0.1210201027280.24222-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1210201027280.24222-100000-pYrvlCTfrz9XsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2012-10-20 at 10:31 -0400, Alan Stern wrote:
> On Sat, 20 Oct 2012, Florian Fainelli wrote:
> 
> > Hi Tony,
> > 
> > On Saturday 20 October 2012 16:17:32 Tony Prisk wrote:
> > > This patch adds devicetree support to the EHCI-platform driver,
> > > and removes the now unneeded ehci-vt8500.c
> > > 
> > > Existing platform properties are maintained, with the exception
> > > the power_(on/off) and suspend function pointers.
> > 
> > Ok, so I have recently sent a bit patchset to remove most OHCI/EHCI drivers
> > that could be converted to the generic variants, series starts here:
> > 1349701906-16481-1-git-send-email-florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
> > 
> > in this patchset I added a new property to the EHCI platform data:
> > need_io_watchdog, which needs to be handled too from DT ideally.
> 
> Actually the new property is "no_io_watchdog".  See
> 
> 	http://marc.info/?l=linux-usb&m=134970247511140&w=2
> 
> > Adding device tree bindings is on my TODO after having a generic way
> > to pass clocks to the ehci/ohci platform drivers, so you are right on time :)
> 
> At some point we'll need a way to handle the power_{on,off,suspend} 
> callbacks.  I don't know how that should be done.
> 
> Alan Stern

I actually included a comment in the patch regarding the missing
functions:

> +                * No platform data is being passed, so initalize
> pdata.
> +                * Limitation: we can't support power_on, power_off or
> +                * power_suspend function pointers from DT.
> +                * TODO: The missing functions could be replaced with
> +                * power sequence handlers.
> +                */

I don't know anything about the power sequence code, but have seen some
patches for pwm backlight using it. I don't know if it would allow
everything that's needed, but it seems to have support for voltage
regulators and gpios (among other things).

Regards
Tony P

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
