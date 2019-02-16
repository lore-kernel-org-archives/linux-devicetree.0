From: Alexandru M Stan <amstan@chromium.org>
Subject: Re: [PATCH] ARM: dts: rockchip: add chosen node on veyron chromebooks
Date: Fri, 15 Feb 2019 17:13:25 -0800
Message-ID: <CAHNYxRzyVjLbT00ryBBkqK67JKFs7bvFR=G=rdvVa_o-q8zN9Q@mail.gmail.com>
References: <20190215115150.32299-1-enric.balletbo@collabora.com> <22158501.cNvkU8jGDh@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22158501.cNvkU8jGDh@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Doug Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 3:09 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Enric,
>
> Am Freitag, 15. Februar 2019, 12:51:50 CET schrieb Enric Balletbo i Serra=
:
> > In order to use earlycon, the stdout-path property needs to be set
> > in the chosen node.
> >
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> What's the reason for adding this only for the Chromebook variants?
> Uart2 is pretty much the standard output for all devices, so I'd assume
> at least all veyron boards should use uart2 as well, making this ideally
> live in the rk3288-veyron.dtsi instead?

Yep, all veyriants use uart 2, even when they're not chromebooks.
Feel free to put it in the other file instead.

Otherwise it'll make things like the Asus Chromebit (mickey), AOpen
Chromebox mini (fievel), and AOpen Chromebase (tiger) unhappy
while debugging.

The rk3288-veyron-chromebook.dtsi file is more for things that make
a chromebook portable. Ex: built in display, lid switch, cros-ec.

Note how we have no uart2 references either in our tree in the
chromebook specific dtsi:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-=
3.14/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi

Alexandru Stan (amstan)
