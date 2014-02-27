From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv12] video: backlight: gpio-backlight: Add DT support.
Date: Thu, 27 Feb 2014 15:22:29 +0000
Message-ID: <20140227152229.GB24910@lee--X1>
References: <1393511313-18756-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393511313-18756-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 27 Feb 2014, Denis Carikli wrote:

> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
> ChangeLog v11-resend->v12:
> - Moved the Cc from the commit message to the "email patch".
> - The documentation is now more clear.
> - The unnecessary default_on variable was removed.
> - gbl->fbdev was already NULL and didn't need to be re-assigned,
>   so the re-assignement was removed.
> - The of_device_id struct and .of_match_table are now guarded
>   against the driver beeing compiled without CONFIG_OF.
>=20
> ChangeLog v11->v11-resend:
> - Removed the Cc list because it's only one patch.
>=20
> ChangeLog v10->v11:
> - Shrinked the Cc list.
> - Fixed the of_match_table warning.
>=20
> ChangeLog v9->v10:
> - Only the respective maintainers, or people who responded to the pat=
ch
>   were kept in the Cc.
> - The unnecessary of_match_ptr in of_match_table was removed.
>=20
> ChangeLog v8->v9:
> - Added Shawn Guo in the Cc list.
> - The default-brightness-level is now a boolean default-on property,
>   the gpio is only touched if the gpio-backlight driver instance prob=
es.
> - The code and documentation was updated accordingly.
>=20
> ChangeLog v7->v8:
> - The default-state was renamed to default-brightness-level.
> - default-brightness-level is now mandatory, like for backlight-pwm,
>   That way we avoid having to handle the case where it's not set,
>   which means that we would need not to set the gpio, but still
>   report a brightness value for sysfs, when not all gpio controllers =
are
>   able to read the gpio value.
> - switched the default-brightness-level to boolean values (0 or 1) in=
stead
>   of using strings ("on", "off", "keep").
> - The documentation was updated accordingly.
> - The example in the documentation now uses the dts gpio defines.
> - The "backlight: gpio_backlight: Use a default state enum." patch wa=
s then
>   dropped, becuase it is not necessary anymore.
>=20
> ChangeLog v6->v7:
> - removed a compilation warning with the removal of the useless ret d=
eclaration.
>=20
> ChangeLog v5->v6:
> - The default state handling was reworked:
>   - it's now called default-state, and looks like the gpio-leds defau=
lt-state.
>   - it now has a "keep" option, like for the gpio-leds.
>   - that "keep" option is the default when the default-state property=
 is not set.
> - The documentation was updated accordingly.
>=20
> ChangeLog v4->v5:
> - The default-brightness property now defaults to 0 in the driver.
> - def_value int becomes a bool.
> - The check for the gpio validity has been reworked.
> ---
>  .../bindings/video/backlight/gpio-backlight.txt    |   16 ++++++
>  drivers/video/backlight/gpio_backlight.c           |   58 ++++++++++=
+++++++---
>  2 files changed, 67 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight=
/gpio-backlight.txt

Patch looks good to me now, I just want to see if Jingoo and/or Bryan
with to add anything. If they don't respond within the next couple of
days I'll apply the patch.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
