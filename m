From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v14 0/5] ZII RAVE platform driver
Date: Tue, 19 Dec 2017 09:22:02 +0000
Message-ID: <20171219092202.jmuj5am3japbqv5r@dell>
References: <20171207162735.25873-1-andrew.smirnov@gmail.com>
 <b64f8d3e-fb7d-328b-dfd5-ddd0e9dfe932@roeck-us.net>
 <20171219085603.nk6x25b7kkc2rukz@dell>
 <20171219090624.GB8917@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171219090624.GB8917@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 19 Dec 2017, Johan Hovold wrote:

> On Tue, Dec 19, 2017 at 08:56:03AM +0000, Lee Jones wrote:
> > On Sat, 16 Dec 2017, Guenter Roeck wrote:
> > > On 12/07/2017 08:27 AM, Andrey Smirnov wrote:
> > > > Lee:
> > > > 
> > > > This patch set has been marinating out there for a while now and
> > > > yours, I belive, is that last signature I need to start pushing it for
> > > > inclusion. I'd really appreciate if you could spare some of your time
> > > > to give it a look. Thanks!
> > > > 
> > > > Everyone:
> > > > 
> > > > This patch series is v14 of the driver for supervisory processor found
> > > > on RAVE series of devices from ZII. Supervisory processor is a PIC
> > > > microcontroller connected to various electrical subsystems on RAVE
> > > > devices whose firmware implements protocol to command/qery them.
> > > > 
> > > > NOTE:
> > > > 
> > > >   * This driver dependends on crc_ccitt_false(), added by
> > > >     2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next', the patch
> > > >     was pulled in by Andrew Morton and is currently avaiting users, so
> > > >     this series might have to go in through Andrew's tree
> > > > 
> > > 
> > > Strictly speaking, the solution would be for Andrew to provide an immutable
> > > branch with the above, for Rob to provide an immutable branch based on Andrew's
> > > branch, adding the serdev drivers, for Lee to provide yet another immutable
> > > branch with all those plus the mfd driver, and for Wim to pick it all up
> > > into the watchdog tree.
> > 
> > I think that's the craziest thing I've ever heard. ;)  Only 1
> > immutable branch is required, which can be pulled in by everyone.
> > 
> > Bear with me.  Pull-request to follow.
> 
> Did the compatible-strings issue get sorted out? That is, that the cell
> drivers were matching on the parent compatible string to determine
> their type instead of encoding that in their own compatible strings. Is
> that desired (and recommended)?

Looks like they are still doing that.

I'd suggest that it was sub-optimal.  It would be better to pass
platform information through pdata or ddata IMHO.  Or yes, use the
child compatible strings (if they differ from platform to platform).

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
