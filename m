From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/6] extcon: arizona: Add device binding for second jack
 detect pin on GPIO5
Date: Fri, 25 Sep 2015 09:54:26 +0900
Message-ID: <56049B42.7030509@samsung.com>
References: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1442397404-7579-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1442397404-7579-5-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Charles,

I have one comment.
I think current extcon-arizona.c has the many platform data
so, extcon-arizona.c use the too much if statement to support each feat=
ure
for different wolfsonmicro codec. I think it cause the complicated code=
=2E

=46or example,
You may use 'struct of_device_id' as following. You used already this m=
ethod
on drivers/mfd/arizona-core.c. If you separate the function of each wmX=
XXX arizona,
it makes improved readability for extcon-arizona.c and some user will u=
se extcon-arizora
more easily.

struct arizona_extcon_data {
	void (*init)(...);
	void (*irq_handler)(...);
	...=09
};

struct arizona_extcon_data wm8994_data {
	.init =3D wm8994_extcon_init,
	.irq_handler =3D wm8994_extcon_irq_handler;
	...
};

static const struct of_device_id arizona_extcon_dt_match[] =3D {
	{
		.compatible =3D "wm8994-arizona-extcon",
		.data =3D (void *)wm8994_data;
	}, {
		.compatible =3D "wmXXXX-arizona-extcon",
		.data =3D (void *)wmXXXX_data;
	},=20
};

I expect that you will revise the arizona-extcon.c driver on next time.

Thanks,
Chanwoo Choi

On 2015=EB=85=84 09=EC=9B=94 16=EC=9D=BC 18:56, Charles Keepax wrote:
> Some Arizona devices have the option to use the GPIO5 pin as a second
> jack detection pin. This patch adds device bindings to specify to the
> driver that it should use this pin. Note that the second jack detecti=
on
> pin is hard wired in the chip so can only be enabled through the
> binding, rather than a pin being specified.
>=20
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/extcon/extcon-arizona.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-=
arizona.c
> index dc1910d..992f80e 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1235,6 +1235,11 @@ static int arizona_extcon_device_get_pdata(str=
uct arizona *arizona)
> =20
>  	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
> =20
> +	pdata->jd_gpio5 =3D device_property_read_bool(arizona->dev,
> +						    "wlf,use-jd-gpio");
> +	pdata->jd_gpio5_nopull =3D device_property_read_bool(arizona->dev,
> +						"wlf,use-jd-gpio-nopull");
> +
>  	return 0;
>  }
> =20
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
