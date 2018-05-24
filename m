From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/5] gpio: syscon: Add gpio-syscon for rockchip
Date: Thu, 24 May 2018 10:28:44 +0200
Message-ID: <CACRpkdYCdNZ=ASw1uz4zKXC4AMd1EGbvG_G5K5cwSpH5eGPgKA@mail.gmail.com>
References: <1526614328-6869-1-git-send-email-djw@t-chip.com.cn>
 <6ffb43dc-55a5-14eb-eb18-3a731cdaf424@t-chip.com.cn> <CAL_Jsq+_QEBWdxW=J4oVGWeokc-+nMzxzX_pgCayaxg-ehivfQ@mail.gmail.com>
 <1685755.J6GI985WX3@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1685755.J6GI985WX3@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Levin Du <djw@t-chip.com.cn>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Wayne Chou <zxf@t-chip.com.cn>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 23, 2018 at 5:12 PM, Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:

> So the gpio controller should definitly also be a subnode.
>
> The gpio in question is called "mute", so I'd think the gpio-syscon drive=
r
> should just define a "rockchip,rk3328-gpio-mute" compatible and contain
> all the register voodoo in the driver itself and not define it in the dt.
>
> So it should probably look like
>
> grf: syscon at ff100000 {
>         compatible =3D "rockchip,rk3328-grf", "syscon", "simple-mfd";
>
>         [all the other syscon sub-devices]
>
>         gpio_mute: gpio-mute {
>                 compatible =3D "rockchip,rk3328-gpio-mute";
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>         };

I'm sceptic.

That doesn't sound like "general purpose input output" at all.

It sounds like special purpose, for a mute button.

Does it use IRQ? I would recommend implementing
drivers/input/keyboard/syscon-keys.c in the same vein
as drivers/leds/leds-syscon.c so you can avoid indirection
through GPIO for no good reason at all.

I already have other good uses for such a generic
input driver.

Yours,
Linus Walleij
