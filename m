From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/9] clocksource: dw_apb_timer: use the eoi callback to clear pending interrupts
Date: Sat, 6 Jul 2013 00:59:05 +0200
Message-ID: <201307060059.06053.heiko@sntech.de>
References: <201307060051.09716.heiko@sntech.de> <201307060053.36885.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201307060053.36885.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, Dinh Nguyen <dinguyen@altera.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Ulrich Prinz <ulrich.prinz@googlemail.com>
List-Id: devicetree@vger.kernel.org

this patch should have had a

=46rom: Ulrich Prinz <ulrich.prinz@googlemail.com>

sorry for the mistake

Am Samstag, 6. Juli 2013, 00:53:36 schrieb Heiko St=C3=BCbner:
> Some timer variants have different mechanisms to clear a pending time=
r
> interrupt. Therefore don't hardcode the reading of the eoi register t=
o
> clear them, but instead use the already existing eoi callback for thi=
s.
>=20
> Signed-off-by: Ulrich Prinz <ulrich.prinz@googlemail.com>
> ---
>  drivers/clocksource/dw_apb_timer.c |   11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clocksource/dw_apb_timer.c
> b/drivers/clocksource/dw_apb_timer.c index bd45351..5f80a30 100644
> --- a/drivers/clocksource/dw_apb_timer.c
> +++ b/drivers/clocksource/dw_apb_timer.c
> @@ -121,11 +121,14 @@ static irqreturn_t dw_apb_clockevent_irq(int ir=
q,
> void *data) return IRQ_HANDLED;
>  }
>=20
> -static void apbt_enable_int(struct dw_apb_timer *timer)
> +static void apbt_enable_int(struct dw_apb_clock_event_device *dw_ced=
)
>  {
> +	struct dw_apb_timer *timer =3D &dw_ced->timer;
>  	unsigned long ctrl =3D apbt_readl(timer, timer->reg_control);
> +
>  	/* clear pending intr */
> -	apbt_readl(timer, timer->reg_eoi);
> +	if (dw_ced->eoi)
> +		dw_ced->eoi(timer);
>  	ctrl &=3D ~APBTMR_CONTROL_INT;
>  	apbt_writel(timer, ctrl, timer->reg_control);
>  }
> @@ -200,7 +203,7 @@ static void apbt_set_mode(enum clock_event_mode m=
ode,
>  		break;
>=20
>  	case CLOCK_EVT_MODE_RESUME:
> -		apbt_enable_int(timer);
> +		apbt_enable_int(dw_ced);
>  		break;
>  	}
>  }
> @@ -325,7 +328,7 @@ void dw_apb_clockevent_register(struct
> dw_apb_clock_event_device *dw_ced)
>=20
>  	apbt_writel(timer, 0, timer->reg_control);
>  	clockevents_register_device(&dw_ced->ced);
> -	apbt_enable_int(timer);
> +	apbt_enable_int(dw_ced);
>  }
>=20
>  /**
