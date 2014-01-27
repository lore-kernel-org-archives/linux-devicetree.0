From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: Fix uninitialized child warning in
 for_each_child_of_node() if !OF
Date: Mon, 27 Jan 2014 15:52:42 +0100
Message-ID: <CAMuHMdVNLYoWD=Q+utHUgEBJ1619Q5x=DsZEtmeEbogrQM2a0Q@mail.gmail.com>
References: <1390731668-904-1-git-send-email-geert@linux-m68k.org>
	<CAL_JsqLq+3Ehns0QaPajzLQCYUL+k+vx3j2vHTCdKMt948h6-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLq+3Ehns0QaPajzLQCYUL+k+vx3j2vHTCdKMt948h6-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, David Howells <dhowells@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 3:16 PM, Rob Herring <robherring2@gmail.com> wr=
ote:
> On Sun, Jan 26, 2014 at 4:21 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> If CONFIG_OF=3Dn:
>>
>> drivers/i2c/i2c-mux.c: In function =E2=80=98i2c_add_mux_adapter=E2=80=
=99:
>> drivers/i2c/i2c-mux.c:158: warning: =E2=80=98child=E2=80=99 is used =
uninitialized in this function
>> drivers/leds/leds-lp55xx-common.c: In function =E2=80=98lp55xx_of_po=
pulate_pdata=E2=80=99:
>> drivers/leds/leds-lp55xx-common.c:560: warning: =E2=80=98child=E2=80=
=99 is used uninitialized in this function
>> drivers/leds/leds-pwm.c: In function =E2=80=98led_pwm_probe=E2=80=99=
:
>> drivers/leds/leds-pwm.c:89: warning: =E2=80=98child=E2=80=99 is used=
 uninitialized in this function
>> drivers/mfd/stmpe.c: In function =E2=80=98stmpe_of_probe=E2=80=99:
>> drivers/mfd/stmpe.c:1112: warning: =E2=80=98child=E2=80=99 is used u=
ninitialized in this function
>> drivers/mfd/tc3589x.c: In function =E2=80=98tc3589x_probe=E2=80=99:
>> drivers/mfd/tc3589x.c:324: warning: =E2=80=98child=E2=80=99 is used =
uninitialized in this function
>> drivers/power/charger-manager.c: In function =E2=80=98of_cm_parse_de=
sc=E2=80=99:
>> drivers/power/charger-manager.c:1606: warning: =E2=80=98child=E2=80=99=
 is used uninitialized in this function
>>
>> Introduced by commit 00b2c76a6abbe082bb5afb89ee49ec325e9cd4d2
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> ("include/linux/of.h: make for_each_child_of_node() reference its ar=
gs when
>> CONFIG_OF=3Dn").
>>
>> Instead of dropping the "__of_use_dn(child)" again, explicitly set c=
hild
>> to NULL, to protect against code using child after the loop (child =3D=
=3D NULL
>> is the loop termination condition if CONFIG_OF=3Dy).
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Just got fixed in mainline:
>
> commit 00b2c76a6abbe082bb5afb89ee49ec325e9cd4d2

Nope, this is the one that introduced new warnings.

> Author: David Howells <dhowells@redhat.com>
> Date:   Thu Jan 23 15:54:02 2014 -0800
>
>     include/linux/of.h: make for_each_child_of_node() reference its
> args when CONFIG_OF=3Dn
>
>     Make for_each_child_of_node() reference its args when CONFIG_OF=3D=
n to
>     avoid warnings like:
>
>         drivers/leds/leds-pwm.c:88:22: warning: unused variable 'node=
'
> [-Wunused-variable]
>           struct device_node *node =3D pdev->dev.of_node;
>                               ^
>
>     Signed-off-by: David Howells <dhowells@redhat.com>
>     Cc: Grant Likely <grant.likely@linaro.org>
>     Cc: Rob Herring <robh+dt@kernel.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>




--=20
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
