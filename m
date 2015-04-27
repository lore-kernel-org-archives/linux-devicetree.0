From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] RFC: let gpiod_get_optional et all return NULL when
 GPIOLIB is not enabled
Date: Mon, 27 Apr 2015 17:21:53 +0200
Message-ID: <20150427152153.GN19431@pengutronix.de>
References: <1423731809-4800-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdb6KcZx3WfTqUKemhQ0_OsqxBGQb_P5cXXZvgc3riakdA@mail.gmail.com>
 <20150306085957.GC10717@pengutronix.de>
 <CACRpkdYq70V8SG4XOPBCGWs__J4ehknZSucpO5OdXpMDj8GPKA@mail.gmail.com>
 <CAAVeFu+0bWSAUSaDGTUmPyj9JxEJn4yxF_hzab4CHp8YV1MuoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFu+0bWSAUSaDGTUmPyj9JxEJn4yxF_hzab4CHp8YV1MuoA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, Apr 09, 2015 at 11:20:55AM +0900, Alexandre Courbot wrote:
> I should have replied one month ago, but if gpiolib is disabled, how
> can we use gpiolib-like logic to check the existence of a GPIO?
>=20
> Having GPIO disabled means there is no GPIO support, including the
> ability to look for GPIOs. -ENOSYS is a well-documented error-code
> which meaning also applies to the gpio_*_optional functions (we don't
> have support for the operation you requested). If a driver or
> architecture really, really needs GPIO support they can require or
> depend on CONFIG_GPIOLIB, and the problem goes away. If they can work
> with and without gpiolib, then they should check for -ENOSYS when the=
y
> request GPIOs and behave accordingly.
What whould be the right behaviour in your eyes? I hope it's not

	if (ret !=3D -ENOSYS)
		return ret;

	/* continue and ignore error */

> Moving the interpretation of what the absence of gpiolib means down t=
o
> the GPIO functions themselves is actually what might lead consumers t=
o
> not know the result of their request. For this reason I would say tha=
t
> -ENOSYS is appropriate here.
Yeah, I fully agree.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
