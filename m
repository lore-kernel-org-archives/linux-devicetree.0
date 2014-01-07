From: jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Subject: Re: charger-manager: Modify the way of checking battery's temperature
Date: Tue, 07 Jan 2014 17:05:42 +0900
Message-ID: <52CBB556.2090302@samsung.com>
References: <20140107073951.GA17969@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140107073951.GA17969-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
On 2014=EB=85=84 01=EC=9B=94 07=EC=9D=BC 16:39, Dan Carpenter wrote:

> Hello Jonghwa Lee,
>=20
> The patch 5c49a6256bed: "charger-manager: Modify the way of checking
> battery's temperature" from Dec 18, 2013, leads to the following
> static checker warning:
>=20
> 	drivers/power/charger-manager.c:563 cm_get_battery_temperature()
> 	warn: passing casted pointer 'temp' to 'thermal_zone_get_temp()' 32 =
vs 64.
>=20
> drivers/power/charger-manager.c
>    554  static int cm_get_battery_temperature(struct charger_manager =
*cm,
>    555                                          int *temp)
>    556  {
>    557          int ret;
>    558 =20
>    559          if (!cm->desc->measure_battery_temp)
>    560                  return -ENODEV;
>    561 =20
>    562  #ifdef CONFIG_THERMAL
>    563          ret =3D thermal_zone_get_temp(cm->tzd_batt, (unsigned=
 long *)temp);
>                                                           ^^^^^^^^^^^=
^^^^^^^^^^^
> This will corrupt memory on 64 bit systems.
>=20
>    564          if (!ret)
>    565                  /* Calibrate temperature unit */
>    566                  *temp /=3D 100;
>    567  #else
>    568          ret =3D cm->fuel_gauge->get_property(cm->fuel_gauge,
>    569                                  POWER_SUPPLY_PROP_TEMP,
>    570                                  (union power_supply_propval *=
)temp);
>                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
> This will corrupt memory as well.  Some of the callers pass an actual
> 32 bit integer and not a 64 bit union.
>=20
>    571  #endif
>    572          return ret;
>    573  }
>=20


Sorry, I carelessly used typecasting. I'll clean these up.
Thanks for advice.

Thanks,
Jonghwa


> regards,
> dan carpenter
>=20
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
