From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/8] watchdog: bindings: Provide ST bindings for ST's LPC Watchdog device
Date: Thu, 18 Dec 2014 09:46:56 +0100
Message-ID: <2894129.AmAkgPJPNf@wuerfel>
References: <1418834727-1602-1-git-send-email-lee.jones@linaro.org> <5479005.CEJLtxOOIa@wuerfel> <20141218081334.GO13885@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141218081334.GO13885@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 18 December 2014 08:13:34 Lee Jones wrote:
> On Wed, 17 Dec 2014, Arnd Bergmann wrote:
> 
> > On Wednesday 17 December 2014 16:45:24 Lee Jones wrote:
> > > +- compatible   : Must be one of: "st,stih407-lpc" "st,stih416-lpc"
> > > +                                 "st,stih415-lpc" "st,stid127-lpc"
> > > +- reg          : LPC registers base address + size
> > > +- interrupts    : LPC interrupt line number and associated flags
> > > +- clocks       : Clock used by LPC device (See: ../clock/clock-bindings.txt)
> > > +- st,lpc-mode  : The LPC can run either one of two modes ST_LPC_MODE_RTC [0] or
> > > +                 ST_LPC_MODE_WDT [1].  One (and only one) mode must be
> > > +                 selected.
> > > 
> > 
> > I'm glad you got it to work with two drivers for the same device.
> > 
> > With this binding, I'm still a bit unhappy about the st,lpc-mode property,
> > in particular since you rely on a shared include file for something that
> > can only be set in one way or another and always has to be present.
> > 
> > Why not just use a boolean property that enforces one mode when present
> > and another mode when absent?
> 
> There is nothing stopping me from doing that, and it was a
> consideration.  I concluded that this method would be more explicit
> however.  Both when describing our choices in DT and at a functional
> level within each of the drivers.
> 
> Let me know if you fundamentally disagree and I can fix-up.

I generally don't like  header files that define interfaces between C code
and DT nodes. There are cases where it's the least ugly solution, but I don't
think this is one of them.

If you want to be more explicit about the modes, how about having one
boolean property per mode? That would also allow devices that could be
driven in either mode, e.g. if you have only one instance of this device.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
