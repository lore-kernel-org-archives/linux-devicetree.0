From: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Subject: Re: properties to describe a rotary encoder
Date: Fri, 16 Oct 2015 12:09:21 +0200
Message-ID: <5620CCD1.8030509@zonque.org>
References: <20151016095951.GA6533@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151016095951.GA6533-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 10/16/2015 11:59 AM, Uwe Kleine-K=C3=B6nig wrote:
> there is already a driver for rotary encoders described in
> Documentation/devicetree/bindings/input/rotary-encoder.txt. This howe=
ver
> is not suitable to describe the device I have here for two reasons:
>=20
> First the driver can only make use of 2 gpio lines, while the device
> here has 4 lines,

How does the phase diagram of that device look like, on what edges is
the system supposed to trigger?

> so I have 16 sectors instead of only 4. And the

What's a 'sector'?

> second difference is that my encoder has a detend for each sector whi=
le
> the driver only supports "half-period" and "full-period" (default) mo=
de.
> These names really only make sense for the 2 line case and mean the
> encoder has detends in 2 or 1 sector respectively.
>=20
> So I'm thinking about how to generalize the description to allow to a=
dd
> support for "my" device.
>=20
> For the added gpio lines it's easy, that's just allowing more than tw=
o
> gpios for the "gpios" property.

Doesn't the number of GPIOs already give enough information to implemen=
t
proper support? Maybe there's no need for any other properties here.

> Currently there is a property "rotary-encoder,steps" that describes t=
he
> number of detends in a full turnaround. So if we stick to "steps" to
> describe detends, maybe something like "sectors-per-step" (with a
> default of 4) would be needed to describe what "half-period" is now.
> Does this make sense? Maybe someone has a better suggestion?

I'm not sure what a sector is supposed to refer to, but the number of
steps per 360=C2=B0 is something that can vary for both 2-line and 4-li=
ne
versions of a rotary encoder. So isn't that unrelated?


Thanks,
Daniel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
