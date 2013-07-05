From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 3/9] clocksource: dw_apb_timer: quirk for variants with
 64bit counter
Date: Sat, 6 Jul 2013 01:45:09 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1307060129340.32106@ionos.tec.linutronix.de>
References: <201307060051.09716.heiko@sntech.de>
 <201307060053.10182.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2090385007-1373067910=:32106"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201307060053.10182.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2090385007-1373067910=:32106
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 6 Jul 2013, Heiko St=C3=BCbner wrote:

> This adds a quirk for IP variants containing two load_count and value
> registers that are used to provide 64bit accuracy on 32bit systems.
>=20
> The added accuracy is currently not used, the driver is only adapted to
> handle the different register layout and make it work on affected devic=
es.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  drivers/clocksource/dw_apb_timer.c |   27 +++++++++++++++++++++++++++
>  include/linux/dw_apb_timer.h       |    6 ++++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/drivers/clocksource/dw_apb_timer.c b/drivers/clocksource/d=
w_apb_timer.c
> index f5e7be8..bd45351 100644
> --- a/drivers/clocksource/dw_apb_timer.c
> +++ b/drivers/clocksource/dw_apb_timer.c
> @@ -56,6 +56,17 @@ static void apbt_init_regs(struct dw_apb_timer *time=
r, int quirks)
>  	timer->reg_control =3D APBTMR_N_CONTROL;
>  	timer->reg_eoi =3D APBTMR_N_EOI;
>  	timer->reg_int_status =3D APBTMR_N_INT_STATUS;
> +
> +	/*
> +	 * On variants with 64bit counters some registers are
> +	 * moved further down.
> +	 */
> +	if (quirks & APBTMR_QUIRK_64BIT_COUNTER) {
> +		timer->reg_current_value +=3D 0x4;
> +		timer->reg_control +=3D 0x8;
> +		timer->reg_eoi +=3D 0x8;
> +		timer->reg_int_status +=3D 0x8;
> +	}
>  }

Oh, no. this is not how we handle these things.

1) We want proper constants for this 64bit IP block=20

2) This is not a quirk, it's a property of that particular IP block

You already made the register offsets a part of the timer structure,
so why don't you supply a proper structure filled with that values to
the init function?

That's what we do all over the place. Either we instantiate those
structs at compile time or runtime fed by device tree or any other
configuration mechanism.
 =20
>  static unsigned long apbt_readl(struct dw_apb_timer *timer, unsigned l=
ong offs)
> @@ -145,6 +156,10 @@ static void apbt_set_mode(enum clock_event_mode mo=
de,
>  		udelay(1);
>  		pr_debug("Setting clock period %lu for HZ %d\n", period, HZ);
>  		apbt_writel(timer, period, timer->reg_load_count);
> +
> +		if (timer->quirks & APBTMR_QUIRK_64BIT_COUNTER)
> +			apbt_writel(timer, 0, timer->reg_load_count + 0x4);
> +

No. We are not adding such conditional constructs when we can deal
with them just by providing a proper set of function pointers. And
definitely not with hardcoded magic 0x4 constants involved.

     timer->load_count(timer, value);

Provide a 32 bit and a 64 bit version of that function and be done
with it.

>  		ctrl |=3D APBTMR_CONTROL_ENABLE;
>  		apbt_writel(timer, ctrl, timer->reg_control);
>  		break;
> @@ -168,6 +183,10 @@ static void apbt_set_mode(enum clock_event_mode mo=
de,
>  		 * running mode.
>  		 */
>  		apbt_writel(timer, ~0, timer->reg_load_count);
> +
> +		if (timer->quirks & APBTMR_QUIRK_64BIT_COUNTER)
> +			apbt_writel(timer, 0, timer->reg_load_count + 0x4);
> +

Makes this copy go away.

>  		ctrl &=3D ~APBTMR_CONTROL_INT;
>  		ctrl |=3D APBTMR_CONTROL_ENABLE;
>  		apbt_writel(timer, ctrl, timer->reg_control);
> @@ -199,6 +218,10 @@ static int apbt_next_event(unsigned long delta,
>  	apbt_writel(timer, ctrl, timer->reg_control);
>  	/* write new count */
>  	apbt_writel(timer, delta, timer->reg_load_count);
> +
> +	if (timer->quirks & APBTMR_QUIRK_64BIT_COUNTER)
> +		apbt_writel(timer, 0, timer->reg_load_count + 0x4);
> +

And this one as well.

>  	ctrl |=3D APBTMR_CONTROL_ENABLE;
>  	apbt_writel(timer, ctrl, timer->reg_control);
> =20
> @@ -325,6 +348,10 @@ void dw_apb_clocksource_start(struct dw_apb_clocks=
ource *dw_cs)
>  	ctrl &=3D ~APBTMR_CONTROL_ENABLE;
>  	apbt_writel(timer, ctrl, timer->reg_control);
>  	apbt_writel(timer, ~0, timer->reg_load_count);
> +
> +	if (timer->quirks & APBTMR_QUIRK_64BIT_COUNTER)
> +		apbt_writel(timer, 0, timer->reg_load_count + 0x4);
> +

Copy and paste is a conveniant thing, right? It just should have a pop
up window assigned which asks at the second instance of copying the
same thing whether you really thought about it.

Thanks,

	tglx
--8323329-2090385007-1373067910=:32106
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--8323329-2090385007-1373067910=:32106--
