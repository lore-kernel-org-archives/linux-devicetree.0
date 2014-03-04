From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv12] video: backlight: gpio-backlight: Add DT support.
Date: Tue, 04 Mar 2014 18:55:13 +0900
Message-ID: <000001cf378f$d6cbb880$84632980$%han@samsung.com>
References: <1393511313-18756-1-git-send-email-denis@eukrea.com>
 <20140227152229.GB24910@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140227152229.GB24910@lee--X1>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Lee Jones' <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Denis Carikli' <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: 'Bryan Wu' <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?Q?'Eric_B=C3=A9nard'?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, February 28, 2014 12:22 AM, Lee Jones wrote:
> On Thu, 27 Feb 2014, Denis Carikli wrote:
>=20
> > Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > ---
> > ChangeLog v11-resend->v12:
> > - Moved the Cc from the commit message to the "email patch".
> > - The documentation is now more clear.
> > - The unnecessary default_on variable was removed.
> > - gbl->fbdev was already NULL and didn't need to be re-assigned,
> >   so the re-assignement was removed.
> > - The of_device_id struct and .of_match_table are now guarded
> >   against the driver beeing compiled without CONFIG_OF.
> >
> > ChangeLog v11->v11-resend:
> > - Removed the Cc list because it's only one patch.
> >
> > ChangeLog v10->v11:
> > - Shrinked the Cc list.
> > - Fixed the of_match_table warning.
> >
> > ChangeLog v9->v10:
> > - Only the respective maintainers, or people who responded to the p=
atch
> >   were kept in the Cc.
> > - The unnecessary of_match_ptr in of_match_table was removed.
> >
> > ChangeLog v8->v9:
> > - Added Shawn Guo in the Cc list.
> > - The default-brightness-level is now a boolean default-on property=
,
> >   the gpio is only touched if the gpio-backlight driver instance pr=
obes.
> > - The code and documentation was updated accordingly.
> >
> > ChangeLog v7->v8:
> > - The default-state was renamed to default-brightness-level.
> > - default-brightness-level is now mandatory, like for backlight-pwm=
,
> >   That way we avoid having to handle the case where it's not set,
> >   which means that we would need not to set the gpio, but still
> >   report a brightness value for sysfs, when not all gpio controller=
s are
> >   able to read the gpio value.
> > - switched the default-brightness-level to boolean values (0 or 1) =
instead
> >   of using strings ("on", "off", "keep").
> > - The documentation was updated accordingly.
> > - The example in the documentation now uses the dts gpio defines.
> > - The "backlight: gpio_backlight: Use a default state enum." patch =
was then
> >   dropped, becuase it is not necessary anymore.
> >
> > ChangeLog v6->v7:
> > - removed a compilation warning with the removal of the useless ret=
 declaration.
> >
> > ChangeLog v5->v6:
> > - The default state handling was reworked:
> >   - it's now called default-state, and looks like the gpio-leds def=
ault-state.
> >   - it now has a "keep" option, like for the gpio-leds.
> >   - that "keep" option is the default when the default-state proper=
ty is not set.
> > - The documentation was updated accordingly.
> >
> > ChangeLog v4->v5:
> > - The default-brightness property now defaults to 0 in the driver.
> > - def_value int becomes a bool.
> > - The check for the gpio validity has been reworked.
> > ---
> >  .../bindings/video/backlight/gpio-backlight.txt    |   16 ++++++
> >  drivers/video/backlight/gpio_backlight.c           |   58 ++++++++=
+++++++++---
> >  2 files changed, 67 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/video/backlig=
ht/gpio-backlight.txt
>=20
> Patch looks good to me now, I just want to see if Jingoo and/or Bryan
> with to add anything. If they don't respond within the next couple of
> days I'll apply the patch.
>=20
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Jingoo Han

>=20
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
