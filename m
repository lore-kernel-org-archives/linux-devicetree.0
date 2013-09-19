From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC PATCH 5/6] extcon-gpio: Describe devicetree bindings
Date: Thu, 19 Sep 2013 11:28:50 -0700
Message-ID: <20130919182850.GA22775@roeck-us.net>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
 <1377836978-24082-6-git-send-email-linux@roeck-us.net>
 <20130912164100.GF22013@e106331-lin.cambridge.arm.com>
 <20130912165304.GA12202@roeck-us.net>
 <20130916142147.GF30650@e106331-lin.cambridge.arm.com>
 <20130916151953.GA5801@roeck-us.net>
 <20130918153828.GB17453@e106331-lin.cambridge.arm.com>
 <20130919164245.GG21013@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130919164245.GG21013-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2013 at 05:42:45PM +0100, Mark Brown wrote:
> On Wed, Sep 18, 2013 at 04:38:28PM +0100, Mark Rutland wrote:
> > On Mon, Sep 16, 2013 at 04:19:53PM +0100, Guenter Roeck wrote:
> 
> > > I think what you are saying is that describing a generic connector via
> > > devicetree is not acceptable, even though it _does_ describe hardware.
> > > I would have to describe a specific connector for a specific hardware
> > > instead, which in turn would need its own driver. Is that correct ?
> 
> > Regardless of how the connector is described, the block of hardware it
> > connects to will have to be described, and some description of the
> > connector will be necessary (either in the node for the block, or by
> > phandle to a node for the connector). I agree that having a combined IP
> > block + connector driver for each permutation is not good.
> 
> Many of the things described only have passive components attached, or
> things that otherwise don't need drivers - things like power inputs or
> headphone connectors, they're mainly providing information to allow
> userspace to behave differently (eg, display a charging indicator in the
> UI).  It's not 100% true but by and by large if detection is being done
> using a GPIO it's probably something like that.

Correct. However, gpio based 'detect' pins typically need debounce support
which is not directly available through the gpio userspace API. I tried to add
that earlier, but was told to use extcon instead as it provides the necessary
infrastructure. Now it almost looks like I can not use it either because the
required devicetree bindings may be considered unacceptable.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
