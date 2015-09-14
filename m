From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Add dtb for the Radxa Rock 2 Square board
Date: Mon, 14 Sep 2015 10:47:19 +0200
Message-ID: <7783425.5jykIre40o@diego>
References: <1442011005-4828-1-git-send-email-sjoerd.simons@collabora.co.uk> <CABxcv==JF5QKG8qmrRRUSi4j0=7guQQJTzVzR2bgSxdtUDBv7Q@mail.gmail.com> <1442217958.8778.103.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442217958.8778.103.camel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 14. September 2015, 10:05:58 schrieb Sjoerd Simons:
> Hey Javier,
> 
> On Mon, 2015-09-14 at 09:50 +0200, Javier Martinez Canillas wrote:
> > Hello Sjoerd,
> > 
> > On Mon, Sep 14, 2015 at 9:30 AM, Sjoerd Simons
> > 
> > <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> > > For the first patch i do prefer to keep them on so we can have get
> > > some
> > > more testing  with this board before fine-tuning those things
> > > (fwiw,
> > 
> > Ok.
> > 
> > > the rockchip evb board and others with essentially the same pmic
> > > setup
> > > all also have them always-on)
> > 
> > Yes but I believe that's because it was easier and there are
> > regulators on these boards that don't need to be always-on as well.
> 
> Yes what i was trying to say is that it's not an uncommon to keep these
> on for convenience while fine-tuning the device-tree setups ;)

Also, a lot of drivers do not yet do proper regulator handling (our drm/kms 
driver as a prime example), so the number of regulators able to being actually 
turned off is quite slim.

So I guess I'm ok, with handling these once driver components can actually do 
something with their supplies :-) .


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
