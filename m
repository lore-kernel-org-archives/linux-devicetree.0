From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCHv0 2/3] rtc: rtc-isl12057: fix isil vs isl naming for
 intersil
Date: Fri, 7 Nov 2014 07:39:53 +0100
Message-ID: <20141107063953.GC10432@pengutronix.de>
References: <cover.1415222752.git.arno@natisbad.org>
 <2ac5b475fd757ea771296ea0731de75d963999ef.1415222752.git.arno@natisbad.org>
 <20141106053253.GK8509@sirena.org.uk>
 <874mucne0y.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <874mucne0y.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, Rob Landley <rob@landley.net>, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Peter Huewe <peter.huewe@infineon.com>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Hello Arnaud,

On Thu, Nov 06, 2014 at 11:46:21PM +0100, Arnaud Ebalard wrote:
> Mark Brown <broonie@kernel.org> writes:
> > On Wed, Nov 05, 2014 at 10:42:41PM +0100, Arnaud Ebalard wrote:
> >
> >> When Intersil ISL12057 driver was introduced by commit 70e123373c0=
5
> >> (rtc: Add support for Intersil ISL12057 I2C RTC chip), the vendor
> >> prefix 'isl' was used instead of the expected 'isil' (Intersil
> >> NASDAQ symbol). Recently, a patch from Philip Zabel (7a6540ca856a,
> >> ARM: mvebu: Change vendor prefix for Intersil Corporation to isil)
> >> fixed that prefix in ReadyNAS devices .dts files (AFAICT, the only
> >> kernel users at the moment).
> >
> > They may be the only in kernel users but someone with an out of tre=
e DT
> > may be using the existing prefix, we shouldn't break compatibility =
with
> > them so we should support both compatible strings even if we want t=
o
> > deprecate the isl, one.
>=20
> Updating the patch in the following way should make it possible to
> support out-of-tree users while avoiding additional uses of 'isl':=20
>=20
> - have two compatible entries in isl12057_dt_match struct instead of =
one
>   i.e.:
>=20
>     static const struct of_device_id isl12057_dt_match[] =3D {
>    	{ .compatible =3D "isl,isl12057" },
>    	{ .compatible =3D "isil,isl12057" },
>     	{ },
>     };
>=20
>   I think it matches the situation we have.
This should work. I suggest to add a comment to the obsolete one to
state not to use it for new boards.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
