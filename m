From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Fwd: [PATCH 7/8] watchdog: davinci: add "clocks" property
Date: Mon, 25 Nov 2013 12:15:29 +0000
Message-ID: <20131125121529.GE32081@e106331-lin.cambridge.arm.com>
References: <1383680783-12114-8-git-send-email-ivan.khoronzhuk@ti.com>
 <527A28E8.4010204@ti.com>
 <201311231857.47104.arnd@arndb.de>
 <52932DA1.8040204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52932DA1.8040204-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "nsekhar-l0cyMroinI0@public.gmane.org" <nsekhar-l0cyMroinI0@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 25, 2013 at 10:59:45AM +0000, ivan.khoronzhuk wrote:
> On 11/23/2013 07:57 PM, Arnd Bergmann wrote:
> > On Wednesday 06 November 2013, ivan.khoronzhuk wrote:
> >> @@ -7,6 +7,10 @@ Required properties:
> >>   
> >>   - reg : Should contain WDT registers location and length
> >>   
> >> +- clocks: phandle reference to the controller clock.
> >> +         Required only for Keystone arch.
> >> +         See clock-bindings.txt
> >> +
> >>   Optional properties:
> >>   
> >>   - timeout-sec:         Contains the watchdog timeout in seconds
> > 
> > I think it should really be listed under "Optional properties" and the
> > reference to Keystone removed. Note how the binding would need
> > to change otherwise if another platform started to use the clock, which
> > is a little silly.
> > 
> > 	Arnd
> > 
> 
> Ok, I'll move clocks property under "Optional properties" and describe it
> as following:
> 
> Optional properties:
> - timeout-sec : Contains the watchdog timeout in seconds
> - clocks: phandle reference to the controller clock.
> 	  Needed if platform uses clocks.
> 	  See clock-bindings.txt

Nit: clocks aren't just phandles, they have a clock-specifier too (which
might be 0 cells).

Otherwise this looks fine to me.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
