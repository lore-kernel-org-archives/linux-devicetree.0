From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] clk: si570: Add a driver for SI570 oscillators
Date: Wed, 18 Sep 2013 16:32:59 -0700
Message-ID: <1119f60e-99dd-45f8-8d91-2b0fa8b7f03b@DB8EHSMHS027.ehs.local>
References: <1379544219-23579-1-git-send-email-soren.brinkmann@xilinx.com>
 <1379545361.1787.87.camel@joe-AO722>
 <0da25c5c-660c-4836-8179-6e7c51fd0d9f@CO9EHSMHS005.ehs.local>
 <1379546336.1787.95.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379546336.1787.95.camel@joe-AO722>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2013 at 04:18:56PM -0700, Joe Perches wrote:
> On Wed, 2013-09-18 at 16:09 -0700, S=C3=B6ren Brinkmann wrote:
> > On Wed, Sep 18, 2013 at 04:02:41PM -0700, Joe Perches wrote:
> > > On Wed, 2013-09-18 at 15:43 -0700, Soren Brinkmann wrote:
> > > > Add a driver for SILabs 570, 571, 598, 599 programmable oscilla=
tors.
> > > > The devices generate low-jitter clock signals and are reprogram=
mable via
> > > > an I2C interface.
> > > []
> > > > v2:
> > > []
> > > >  - use 10000 as MIN and MAX value in usleep_range
> > > []
> > > > diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
> > > []
> > > > +static int si570_set_frequency(struct clk_si570 *data, unsigne=
d long frequency)
> > > > +{
> > > []
> > > > +	/* Applying a new frequency can take up to 10ms */
> > > > +	usleep_range(10000, 10000);
> > >=20
> > > Generally it's nicer to have an actual range for usleep_range.
> > Well, as I said in the discussion with Guenther. I'm flexible and n=
obody
> > objected when I said to make both equal. A real range doesn't make =
sense
> > here though, but I don't know what's common practice for cases like
> > this.
>=20
> udelay is normal, but I guess you don't need atomic context.
After checkpatch correcting me a few times I went with what
Documentation/timers/timers-howto.txt suggests. But yes, then we have
this situation, that I want to sleep 10ms, but not longer using a
*_range function. I guess it is very application specific whether a
longer delay here is acceptable or not.

> =20
> > > Is there a bit you could periodically poll to see
> > > if the new frequency has been set or is stable so
> > > that a 10ms delay isn't always used?
>=20
> > Unfortunately not.
>=20
> Thanks.  I suppose I should read the datasheets before asking.
>=20
> http://www.silabs.com/Support%20Documents/TechnicalDocs/si570.pdf
> (page 12)
>=20
> Anyway, perhaps si570_set_frequency_small needs a delay too.'
>=20
> The 570 datasheet says it needs a 100uS delay.
You're right. I'll add a delay there as well. The 'rang' question
applies here as well.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
