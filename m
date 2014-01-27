From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Fix uninitialized child warning in
 for_each_child_of_node() if !OF
Date: Mon, 27 Jan 2014 08:16:47 -0600
Message-ID: <CAL_JsqLq+3Ehns0QaPajzLQCYUL+k+vx3j2vHTCdKMt948h6-g@mail.gmail.com>
References: <1390731668-904-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390731668-904-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 26, 2014 at 4:21 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> If CONFIG_OF=3Dn:
>
> drivers/i2c/i2c-mux.c: In function =91i2c_add_mux_adapter=92:
> drivers/i2c/i2c-mux.c:158: warning: =91child=92 is used uninitialized=
 in this function
> drivers/leds/leds-lp55xx-common.c: In function =91lp55xx_of_populate_=
pdata=92:
> drivers/leds/leds-lp55xx-common.c:560: warning: =91child=92 is used u=
ninitialized in this function
> drivers/leds/leds-pwm.c: In function =91led_pwm_probe=92:
> drivers/leds/leds-pwm.c:89: warning: =91child=92 is used uninitialize=
d in this function
> drivers/mfd/stmpe.c: In function =91stmpe_of_probe=92:
> drivers/mfd/stmpe.c:1112: warning: =91child=92 is used uninitialized =
in this function
> drivers/mfd/tc3589x.c: In function =91tc3589x_probe=92:
> drivers/mfd/tc3589x.c:324: warning: =91child=92 is used uninitialized=
 in this function
> drivers/power/charger-manager.c: In function =91of_cm_parse_desc=92:
> drivers/power/charger-manager.c:1606: warning: =91child=92 is used un=
initialized in this function
>
> Introduced by commit 00b2c76a6abbe082bb5afb89ee49ec325e9cd4d2
> ("include/linux/of.h: make for_each_child_of_node() reference its arg=
s when
> CONFIG_OF=3Dn").
>
> Instead of dropping the "__of_use_dn(child)" again, explicitly set ch=
ild
> to NULL, to protect against code using child after the loop (child =3D=
=3D NULL
> is the loop termination condition if CONFIG_OF=3Dy).
>
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

Just got fixed in mainline:

commit 00b2c76a6abbe082bb5afb89ee49ec325e9cd4d2
Author: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Jan 23 15:54:02 2014 -0800

    include/linux/of.h: make for_each_child_of_node() reference its
args when CONFIG_OF=3Dn

    Make for_each_child_of_node() reference its args when CONFIG_OF=3Dn=
 to
    avoid warnings like:

        drivers/leds/leds-pwm.c:88:22: warning: unused variable 'node'
[-Wunused-variable]
          struct device_node *node =3D pdev->dev.of_node;
                              ^

    Signed-off-by: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
    Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
    Signed-off-by: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
    Signed-off-by: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>


> ---
>  include/linux/of.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 70c64ba17fa5..0bf44f2fe092 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -383,7 +383,7 @@ static inline void __of_use_dn(const struct devic=
e_node *np)
>  }
>
>  #define for_each_child_of_node(parent, child) \
> -       while (__of_use_dn(parent), __of_use_dn(child), 0)
> +       while (__of_use_dn(parent), child =3D NULL, 0)
>
>  #define for_each_available_child_of_node(parent, child) \
>         while (0)
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
