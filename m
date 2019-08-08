From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v15 00/13] TCU patchset v15
Date: Thu, 8 Aug 2019 23:02:57 +0000
Message-ID: <MWHPR2201MB12771581FD6FBA4634D53566C1D70@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190724171615.20774-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724171615.20774-1-paul@crapouillou.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>linu
List-Id: devicetree@vger.kernel.org

Hello,

Paul Cercueil wrote:
> Hi,
>=20
> This is the V15 of my Ingenic TCU patchet.
>=20
> The big change since V14 is that the custom MFD driver
> (ex patch 04/13) was dropped in favor of a small patch to syscon
> and a "simple-mfd" compatible.
>=20
> The patchset was based on mips/mips-next, but all of them minus
> the last one will apply cleanly on v5.3-rc1.
>=20
> Changelog:
>=20
> * [02/13]: Remove info about MFD driver
> * [03/13]: Add "simple-mfd" compatible string
> * [04/13]: New patch
> * [05/13]: - Use CLK_OF_DECLARE_DRIVER since we use "simple-mfd"
>            - Use device_node_to_regmap()
> * [06/13]: Use device_node_to_regmap()
> * [07/13]: Use device_node_to_regmap()
> * [09/13]: Add "simple-mfd" compatible string
>=20
> Cheers,

Series applied to mips-next.

> dt-bindings: ingenic: Add DT bindings for TCU clocks
>   commit 4bc3c420246e
>   https://git.kernel.org/mips/c/4bc3c420246e
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Reviewed-by: Rob Herring <robh@kernel.org>
>   Acked-by: Stephen Boyd <sboyd@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> doc: Add doc for the Ingenic TCU hardware
>   commit 97689a1a3fda
>   https://git.kernel.org/mips/c/97689a1a3fda
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> dt-bindings: Add doc for the Ingenic TCU drivers
>   commit 2e8722a5255e
>   https://git.kernel.org/mips/c/2e8722a5255e
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Reviewed-by: Rob Herring <robh@kernel.org>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> mfd/syscon: Add device_node_to_regmap()
>   commit 39233b7c6112
>   https://git.kernel.org/mips/c/39233b7c6112
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Acked-by: Arnd Bergmann <arnd@arndb.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> clk: ingenic: Add driver for the TCU clocks
>   commit 4f89e4b8f121
>   https://git.kernel.org/mips/c/4f89e4b8f121
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Acked-by: Stephen Boyd <sboyd@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> irqchip: Add irq-ingenic-tcu driver
>   commit 9536eba03ec7
>   https://git.kernel.org/mips/c/9536eba03ec7
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>   Acked-by: Marc Zyngier <maz@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> clocksource: Add a new timer-ingenic driver
>   commit 34e9368301d5
>   https://git.kernel.org/mips/c/34e9368301d5
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> clk: jz4740: Add TCU clock
>   commit 73dd11dc1a88
>   https://git.kernel.org/mips/c/73dd11dc1a88
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Acked-by: Stephen Boyd <sboyd@kernel.org>
>   Acked-by: Rob Herring <robh@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: jz4740: Add DTS nodes for the TCU drivers
>   commit 36aafdbd5288
>   https://git.kernel.org/mips/c/36aafdbd5288
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: qi_lb60: Reduce system timer and clocksource to 750 kHz
>   commit a68d3b052b57
>   https://git.kernel.org/mips/c/a68d3b052b57
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: CI20: Reduce system timer and clocksource to 3 MHz
>   commit 157c887aff52
>   https://git.kernel.org/mips/c/157c887aff52
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: GCW0: Reduce system timer and clocksource to 750 kHz
>   commit 967a7100400a
>   https://git.kernel.org/mips/c/967a7100400a
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: jz4740: Drop obsolete code
>   commit abc552284f6b
>   https://git.kernel.org/mips/c/abc552284f6b
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
