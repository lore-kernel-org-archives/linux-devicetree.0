Return-Path: <SRS0=X49H=SK=amarulasolutions.com=jagan@kernel.org>
MIME-Version: 1.0
References: <20190405234514.6183-1-megous@megous.com> <CAJiuCcew10Q3PUOk4VPoiyFc7ZhXwJzxXHQHNeVBUvVAQ3BkbQ@mail.gmail.com>
 <20190407143237.2qyoef4r5e3qvbmh@core.my.home>
In-Reply-To: <20190407143237.2qyoef4r5e3qvbmh@core.my.home>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 8 Apr 2019 11:31:22 +0530
Message-ID: <CAMty3ZDpppM5zBvxCBx3NjdVsRm4S93yz5kqi5Z5a0rhC-+zPg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 00/12] Add support for Orange Pi 3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: megous@megous.com, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, Naveen Gupta <naveen.gupta@cypress.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, linux-gpio@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, Apr 7, 2019 at 8:02 PM 'Ond=C5=99ej Jirman' via linux-sunxi
<linux-sunxi@googlegroups.com> wrote:
>
> On Sun, Apr 07, 2019 at 03:36:21PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > On Sat, 6 Apr 2019 at 01:45, megous via linux-sunxi
> > <linux-sunxi@googlegroups.com> wrote:
> > >
> > > From: Ondrej Jirman <megous@megous.com>
> > >
> > > This series implements support for Xunlong Orange Pi 3 board.
> >
> > OrangePi 3 Lite2 and One Plus boards support has already been merged.
> > The support is not complete but you should rebase your patches on top
> > of sunxi/for-next
>
> Hi,
>
> OrangePi 3 is somewhat different from these two boards (mostly it has a d=
iffernt
> power tree). It doesn't use the AXP regulators that are defined in the
> sun50i-h6-orangepi.dtsi in the same way.
>
> For example:
>
> - bldo3 (is turned always on in sun50i-h6-orangepi.dtsi but unused for op=
i3)
> - cldo2 and cldo3 are unused on opi3 and have nothing to do with WiFi
> - aldo3 is not for dram
> - bldo1 on the other hand is for dram on opi3
> - some other regulators are used for different/more functions and thus
>   named differntly
> - USB id-det pin is differnt
> - ...

Based on my communication with OrangePI, OPI-3 has PCIE, 4 USB-3.0
ports and AV are the key differences and rest seems to be similar. but
if we have a diff or unused regulators may be we can't enable them in
dtsi (I never looked that close as of now)
