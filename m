From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 0/3] Add Watchdog for H6
Date: Thu, 11 Apr 2019 17:39:53 +0200
Message-ID: <CAJiuCcevrDNcPiwjG7nciig64OHp0P2e-k+CTXo+7gGEfMm8oA@mail.gmail.com>
References: <20190411154534.25563-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411154534.25563-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@googlegroups.com, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 11 Apr 2019 at 17:34, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Hi,
>
> Allwinner H6 SoC has two watchdogs. The documented watchdog is identicaly
> the same reading the user manual as the one used in the A64.
>
> After investigation it seems that on some SoC the first watchdog doesn't
> make the board reboot.
> Some tests has been performed and it seems that first H6 version aren't
> affected only the latest one.
>
> Chen-Yu Tsai's boards:
> Pine H64 - H6 V200-AWIN H6448BA 7782 =3D> OK
> OrangePi Lite 2 - H6 V200-AWIN H8068BA 61C2 =3D> KO
>
> Cl=C3=A9ment P=C3=A9ron's board:
> Beelink GS1 - H6 V200-AWIN H7309BA 6842 =3D> KO
>
> I think it could good to add it with a comment anyway.
> In case a user want to activate it and isn't aware of this issue.
>
> The r_watchdog is still available and usable on all the H6 boards.

Changes since v1:
 - Use A64 compatible instead of H6
 - Remove dt-bindings patch
 - Change watchdog status to disabled
 - Add r_watchdog node patch
 - Add enable sunxi watchdog patch

>
> Thanks,
> Cl=C3=A9ment
>
> Cl=C3=A9ment P=C3=A9ron (3):
>   arm64: dts: allwinner: h6: add watchdog node
>   arm64: dts: allwinner: h6: add r_watchog node
>   arm64: defconfig: Enable Sunxi watchdog
>
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 16 ++++++++++++++++
>  arch/arm64/configs/defconfig                 |  1 +
>  2 files changed, 17 insertions(+)
>
> --
> 2.17.1
>
