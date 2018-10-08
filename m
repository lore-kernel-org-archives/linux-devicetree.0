Return-Path: <SRS0=+wl7=MU=pengutronix.de=ukl@kernel.org>
Date: Mon, 8 Oct 2018 15:08:13 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181008130813.6womjuvpl7bdcn27@pengutronix.de>
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181008101356.5672-1-uwe@kleine-koenig.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello,

On Mon, Oct 08, 2018 at 12:13:56PM +0200, Uwe Kleine-K�nig wrote:
> +				struct irq_domain *irqdomain;
> +				unsigned int irq;
> +
> +				irq_domain = ddata->port[1].gchip.irq.domain;
> +				irq = irq_find_mapping(irqdomain, offset);
> +
> +				generic_handle_irq(irq);

while wrapping long lines I introduced a bug here.
s/irq_domain/irqdomain/ to fix it.

I'll wait for some feedback before resending.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
