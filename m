From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] clk: si570: Add a driver for SI570 oscillators
Date: Wed, 18 Sep 2013 16:18:56 -0700
Message-ID: <1379546336.1787.95.camel@joe-AO722>
References: <1379544219-23579-1-git-send-email-soren.brinkmann@xilinx.com>
	 <1379545361.1787.87.camel@joe-AO722>
	 <0da25c5c-660c-4836-8179-6e7c51fd0d9f@CO9EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0da25c5c-660c-4836-8179-6e7c51fd0d9f-QhSrsHip19tEus+KprP3J7jjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-09-18 at 16:09 -0700, S=F6ren Brinkmann wrote:
> On Wed, Sep 18, 2013 at 04:02:41PM -0700, Joe Perches wrote:
> > On Wed, 2013-09-18 at 15:43 -0700, Soren Brinkmann wrote:
> > > Add a driver for SILabs 570, 571, 598, 599 programmable oscillato=
rs.
> > > The devices generate low-jitter clock signals and are reprogramma=
ble via
> > > an I2C interface.
> > []
> > > v2:
> > []
> > >  - use 10000 as MIN and MAX value in usleep_range
> > []
> > > diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
> > []
> > > +static int si570_set_frequency(struct clk_si570 *data, unsigned =
long frequency)
> > > +{
> > []
> > > +	/* Applying a new frequency can take up to 10ms */
> > > +	usleep_range(10000, 10000);
> >=20
> > Generally it's nicer to have an actual range for usleep_range.
> Well, as I said in the discussion with Guenther. I'm flexible and nob=
ody
> objected when I said to make both equal. A real range doesn't make se=
nse
> here though, but I don't know what's common practice for cases like
> this.

udelay is normal, but I guess you don't need atomic context.
=20
> > Is there a bit you could periodically poll to see
> > if the new frequency has been set or is stable so
> > that a 10ms delay isn't always used?

> Unfortunately not.

Thanks.  I suppose I should read the datasheets before asking.

http://www.silabs.com/Support%20Documents/TechnicalDocs/si570.pdf
(page 12)

Anyway, perhaps si570_set_frequency_small needs a delay too.'

The 570 datasheet says it needs a 100uS delay.

> On Wed, 2013-09-18 at 15:43 -0700, Soren Brinkmann wrote:
> Add a driver for SILabs 570, 571, 598, 599 programmable oscillators.
> The devices generate low-jitter clock signals and are reprogrammable =
via
> an I2C interface.
> []
> +static int si570_set_frequency_small(struct clk_si570 *data,
> +				     unsigned long frequency)
> +{
> +	/*
> +	 * This is a re-implementation of DIV_ROUND_CLOSEST
> +	 * using the div64_u64 function lieu of letting the compiler
> +	 * insert EABI calls
> +	 */
> +	data->rfreq =3D div64_u64((data->rfreq * frequency) +
> +			div_u64(data->frequency, 2), data->frequency);
> +	regmap_write(data->regmap, SI570_REG_CONTROL, SI570_CNTRL_FREEZE_M)=
;
> +	si570_update_rfreq(data);
> +	regmap_write(data->regmap, SI570_REG_CONTROL, 0);
> +
> +	return 0;
> +}


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
