From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH v2 0/2] ARM: berlin: add GPIO support for the BG2Q
Date: Wed, 16 Apr 2014 17:11:12 +0800
Message-ID: <20140416171112.31757110@xhacker>
References: <1397634395-7456-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397634395-7456-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>
Cc: "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, Jimmy Xu <zmxu@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 16 Apr 2014 00:46:33 -0700
Antoine T=C3=A9nart <antoine.tenart@free-electrons.com> wrote:

> This series add the support for the GPIOs of the Berlin BG2Q. We use =
the
> newly integrated dwapb GPIO driver here.
>=20
> This applies on top of Alexandre's BG2Q symbol introduction[1] and th=
e dwapb
> gpio patch fixing IRQ initialization[2].
>=20
> [1] https://patchwork.kernel.org/patch/3876141/
> [2] https://lkml.org/lkml/2014/4/7/96
>=20
> Changes since v1:
> 	- s/gpio-controller@/gpio-port@/ in device tree
> 	- moved ARCH_REQUIRE_GPIOLIB to ARCH_BERLIN in Kconfig
>=20
> Antoine T=C3=A9nart (2):
>   ARM: berlin: add the LIBGPIO as a dependency for the BG2Q
>   ARM: dts: berlin: add GPIO nodes for the BG2Q
>=20
>  arch/arm/boot/dts/berlin2q.dtsi | 102
> ++++++++++++++++++++++++++++++++++++++++ arch/arm/mach-berlin/Kconfig
> |   1 + 2 files changed, 103 insertions(+)
>=20

All the two patches look good

Thanks very much
