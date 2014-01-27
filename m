From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of: Fix uninitialized child warning in
 for_each_child_of_node() if !OF
Date: Mon, 27 Jan 2014 17:23:35 +0100
Message-ID: <CAMuHMdUn2VJP-LRMKLmiC7jMw3NXLx0fZsGzQJtwjPLY7+9B5g@mail.gmail.com>
References: <1390731668-904-1-git-send-email-geert@linux-m68k.org>
	<CAL_JsqLq+3Ehns0QaPajzLQCYUL+k+vx3j2vHTCdKMt948h6-g@mail.gmail.com>
	<CAMuHMdVNLYoWD=Q+utHUgEBJ1619Q5x=DsZEtmeEbogrQM2a0Q@mail.gmail.com>
	<CAL_JsqJyaMDkj6jE+qk6AuUNB0-TOLdqeYDBdjH+1YJFu2V0DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJyaMDkj6jE+qk6AuUNB0-TOLdqeYDBdjH+1YJFu2V0DQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 5:21 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On Mon, Jan 27, 2014 at 8:52 AM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Mon, Jan 27, 2014 at 3:16 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>>> On Sun, Jan 26, 2014 at 4:21 AM, Geert Uytterhoeven
>>> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>>>> If CONFIG_OF=3Dn:
>>>>
>>>> drivers/i2c/i2c-mux.c: In function =E2=80=98i2c_add_mux_adapter=E2=
=80=99:
>>>> drivers/i2c/i2c-mux.c:158: warning: =E2=80=98child=E2=80=99 is use=
d uninitialized in this function
>>>> drivers/leds/leds-lp55xx-common.c: In function =E2=80=98lp55xx_of_=
populate_pdata=E2=80=99:
>>>> drivers/leds/leds-lp55xx-common.c:560: warning: =E2=80=98child=E2=80=
=99 is used uninitialized in this function
>>>> drivers/leds/leds-pwm.c: In function =E2=80=98led_pwm_probe=E2=80=99=
:
>>>> drivers/leds/leds-pwm.c:89: warning: =E2=80=98child=E2=80=99 is us=
ed uninitialized in this function
>>>> drivers/mfd/stmpe.c: In function =E2=80=98stmpe_of_probe=E2=80=99:
>>>> drivers/mfd/stmpe.c:1112: warning: =E2=80=98child=E2=80=99 is used=
 uninitialized in this function
>>>> drivers/mfd/tc3589x.c: In function =E2=80=98tc3589x_probe=E2=80=99=
:
>>>> drivers/mfd/tc3589x.c:324: warning: =E2=80=98child=E2=80=99 is use=
d uninitialized in this function
>>>> drivers/power/charger-manager.c: In function =E2=80=98of_cm_parse_=
desc=E2=80=99:
>>>> drivers/power/charger-manager.c:1606: warning: =E2=80=98child=E2=80=
=99 is used uninitialized in this function
>>>>
>>>> Introduced by commit 00b2c76a6abbe082bb5afb89ee49ec325e9cd4d2
>>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> ("include/linux/of.h: make for_each_child_of_node() reference its =
args when
>>>> CONFIG_OF=3Dn").
>>>>
>>>> Instead of dropping the "__of_use_dn(child)" again, explicitly set=
 child
>>>> to NULL, to protect against code using child after the loop (child=
 =3D=3D NULL
>>>> is the loop termination condition if CONFIG_OF=3Dy).
>>>>
>>>> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>>>
>>> Just got fixed in mainline:
>>>
>>> commit 00b2c76a6abbe082bb5afb89ee49ec325e9cd4d2
>>
>> Nope, this is the one that introduced new warnings.
>
> Oh right, sorry. Read that too fast.
>
> Won't your change trigger warnings from -Wunused-but-set-variable in
> cases where child is not used? That would only be enabled for "W=3D1"
> though.
>
> I think the right fix here is all the for_each_X macros should not be
> conditional on CONFIG_OF and we should rely on the functions they cal=
l
> like of_get_next_child to do the right thing for !OF.

That's indeed an alternative fix. As long as of_get_next_child() and
friends return NULL, that'll work fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
