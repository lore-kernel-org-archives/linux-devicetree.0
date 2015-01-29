From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH 2/3] clocksource: versatile: adapt for Versatile AB and
 PB boards
Date: Thu, 29 Jan 2015 10:28:59 +0000
Message-ID: <20150129102859.GR956@e106497-lin.cambridge.arm.com>
References: <1422467792-2065-1-git-send-email-robh@kernel.org>
 <1422467792-2065-3-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422467792-2065-3-git-send-email-robh@kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 28, 2015 at 05:56:31PM +0000, Rob Herring wrote:
> The same 24MHz counter is also present on Versatile AB and PB boards,=
 so
> add the compatible string for them.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/clocksource/versatile.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clocksource/versatile.c b/drivers/clocksource/ve=
rsatile.c
> index 2798e74..0a26d3d 100644
> --- a/drivers/clocksource/versatile.c
> +++ b/drivers/clocksource/versatile.c
> @@ -36,5 +36,7 @@ static void __init versatile_sched_clock_init(struc=
t device_node *node)
> =20
>  	sched_clock_register(versatile_sys_24mhz_read, 32, 24000000);
>  }
> -CLOCKSOURCE_OF_DECLARE(versatile, "arm,vexpress-sysreg",
> +CLOCKSOURCE_OF_DECLARE(vexpress, "arm,vexpress-sysreg",
> +		       versatile_sched_clock_init);
> +CLOCKSOURCE_OF_DECLARE(versatile, "arm,versatile-sysreg",
>  		       versatile_sched_clock_init);

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

> --=20
> 2.1.0
>=20
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
