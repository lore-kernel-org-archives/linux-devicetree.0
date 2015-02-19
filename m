From: Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>
Subject: Re: [Patch v6 0/2] gpio: add GPIO hogging mechanism
Date: Thu, 19 Feb 2015 15:46:39 -0600
Message-ID: <20150219214639.GB8656@deathray>
References: <AAE35E953C746D4784A1A0C604EFEA714DFBD819@DLEE10.ent.ti.com>
 <20150218172341.GA3851@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150218172341.GA3851-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2015 at 11:23:42AM -0600, Benoit Parrot wrote:
> Gentle ping.
> 
> Is there any chance this will make it in 3.21?
> 
> Benoit
>

Is there a reason that the pin has to be "hogged"?

Couldn't the pin be released after configuration for eventual use in the userspace?
 
> Parrot, Benoit <bparrot-l0cyMroinI0@public.gmane.org> wrote on Wed [2015-Feb-02 17:44:43 -0600]:
> > This patch set re-introduces the gpio hogging concept first
> > presented by Boris Brezillion.
> > This patch set provides a way to initially configure specific GPIO
> > when the GPIO controller is probed.
> >  
> > The actual DT scanning to collect the GPIO specific data is performed
> > as part of of_gpiochip_add().
> >  
> > The purpose of this is to allow specific GPIOs to be configured
> > without any driver specific code.
> > This is particularly useful because board design are getting
> > increasingly complex and given SoC pins can now have more
> > than 10 mux values a lot of connections are now dependent on
> > external IO muxes to switch various modes.
> >  
> > Specific drivers should not necessarily need to be aware of
> > what accounts to a specific board implementation. This board level
> > "description" should be best kept as part of the dts file.
> >  
> > Changes since v5:
> > * Addressed review comment from Linus Walleij
> > * Replace "state" property back with separate boolean properties
> > * Renamed helper function
> > * Refactored pr_* calls to remove "__func__"
> >  
> > Changes since v4:
> > * Addressed review comments from Alexandre Courbot
> >  
> > Changes since v3:
> > * Relocated the non-DT "hog" function to gpiolib.c.
> > * Rename some of the function to be clearer and remove _ prefixes.
> > * Replace the gpiod_request/gpiod_put usage with
> >    gpiochip_request_own_desc/free_own_desc version instead.
> > * Refactor some of the logic to better handle error condition/reporting
> > * Renamed the "direction" DT properties to "state".
> >  
> > Changes since v2:
> > * Refactor the gpio-hog mechanism to split the DT related action
> >    from the actual "hogging" operation.
> > * This allows non-DT providers to implement hogs as well.
> > * Added FLAG_IS_HOGGED to mark hogged gpio and make gpiochip removal
> >    able to release hogged gpio.
> > * Similarly to the hogging, the cleanup is performed as part of
> >    of_gpiochip_remove
> >  
> > Changes since v1:
> > * Split the devicetree bindings documentation in its own patch.
> > * Refactor the gpio-hog mechanism as private functions meant to
> >    be to invoked from of_gpiochip_add().
> >  
> >  
> > Benoit Parrot (2):
> >   gpio: add GPIO hogging mechanism
> >   gpio: Document GPIO hogging mechanism
> >  
> > Documentation/devicetree/bindings/gpio/gpio.txt |  30 ++++++
> > drivers/gpio/gpiolib-of.c                       | 111 +++++++++++++++++++++
> > drivers/gpio/gpiolib.c                          | 124 ++++++++++++++++++++----
> > drivers/gpio/gpiolib.h                          |   3 +
> > 4 files changed, 249 insertions(+), 19 deletions(-)
> >  
> > --
> > 1.8.5.1
> >  
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >  
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
