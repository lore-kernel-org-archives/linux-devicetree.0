From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCHv0 3/3] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Fri, 7 Nov 2014 08:58:43 +0100
Message-ID: <20141107075843.GD10432@pengutronix.de>
References: <cover.1415222752.git.arno@natisbad.org>
 <148403c0ab1d556cbb99d9242c65f714a77843e5.1415222752.git.arno@natisbad.org>
 <20141106055017.GL8509@sirena.org.uk>
 <87ppcznbyv.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87ppcznbyv.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, devicetree@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Peter Huewe <peter.huewe@infineon.com>, Thierry Reding <treding@nvidia.com>, Guenter Roeck <linux@roeck-us.net>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Nov 07, 2014 at 12:30:48AM +0100, Arnaud Ebalard wrote:
> Mark Brown <broonie@kernel.org> writes:
> > On Wed, Nov 05, 2014 at 10:42:52PM +0100, Arnaud Ebalard wrote:
>=20
> >> +	ret =3D rtc_tm_to_time(&rtc_tm, &rtc_secs);
> >> +	if (ret)
> >> +		goto err_unlock;
> >> +
> >> +	ret =3D rtc_tm_to_time(alarm_tm, &alarm_secs);
> >> +	if (ret)
> >> +		goto err_unlock;
> >> +
> >> +	/* If alarm time is before current time, disable the alarm */
> >> +	if (!alarm->enabled || alarm_secs <=3D rtc_secs) {
> >> +		enable =3D 0;
> >
> > Shouldn't there be some margin for time rolling forwards when check=
ing
> > for alarm times in the past (or just refuse to set them, I've not
> > checked if this is following existing practice for RTC drivers)?
>=20
> No strong feeling on that point. ISL12008 on which this driver is bas=
ed
> has a similar logic.
Some time ago I already had the feeling that there is much "rank growth=
"
in the rtc drivers. I guess this is because maintenance of the rtc
subsystem isn't optimal and there are no guidelines (at least I'm not
aware of any) about detail questions.

> >> +	if (client->irq > 0) {
> >> +		ret =3D devm_request_threaded_irq(&client->dev, client->irq, NU=
LL,
> >> +						isl12057_rtc_interrupt,
> >> +						IRQF_SHARED|IRQF_ONESHOT,
> >> +						DRV_NAME, client);
> >> +		if (!ret) {
> >> +			device_init_wakeup(&client->dev, true);
> >> +		} else {
> >> +			dev_err(dev, "irq %d unavailable, no alarm support\n",
> >> +				client->irq);
> >> +			client->irq =3D 0;
> >> +		}
> >> +	}
> >> +
> >
> > None of the alarm functionality checks to see if there's actually a=
n IRQ
> > - is that OK? I'd at least expect the alarm interrupt enable call t=
o
> > check if the interrupt is wired up.
>=20
> I can add those check BUT I would like some directions in order to
> support the following use case too.
>=20
> Current three in-tree users of ISL12057 are NAS devices (Netgear
> ReadyNAS 102, 104 and 2120). All of them *do not have* the interrupt =
pin
I assume you don't have schematics of the devices, right? If so, do you
think it might be worth to try to get them from Netgear? Just to make
sure that there really is no pin connected to the SoC.

> of the RTC chip connected to an interrupt line of the SoC. Nonetheles=
s,
> the IRQ line of the chip being connected to a PMIC on the board (TI
> TPS65251 [1] on ReadyNAS 102 and 104, I do not know for ReadyNAS
Looking over the manual it seems there is no way to let the PMIC forwar=
d
the irq either.

> 2120). When the device is off and the alarm rings, the device gets
> powered on. AFAICT, the IRQ coming on the TPS65251 is not replicated =
on
> any line of the SoC.
>=20
> I think it's possible w/ some soldering to get somewhere where the RT=
C
> framework wants me to be and finish the alarm part to have it merged
> upstream but that's of limited interest if in-tree user cannot use it=
 to
> fit their need, i.e. configure an alarm value and enable the associat=
ed
> interrupt which is routed externally, i.e. not visible by the SoC.
Do you need to enable the irq somewhere else (apart from in the RTC
device)? I guess not.

> FWIW, we had a similar discussion a while ago, during driver inclusio=
n:
>=20
>   http://marc.info/?l=3Ddevicetree&m=3D138109313118504&w=3D2
>=20
> Uwe, any idea?
What is the problem of a not-wired-up irq line? Does the rtc framework
need to change to allow setting an alarm without the irq line being
hooked up? Is it "only" that the alarm is missed? Irq polling probably
isn't sensible?

I assume it's not that unusual that an rtc irq doesn't trigger a system
irq, so having that supported nicely would be great.

Looking through the rtc's datasheet, the device is a tad more
complicated than the current driver handles. There are two irq lines an=
d
three functions that can be routed through these (alarm1, alarm2 and
clkout; not all combinations are possible).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
