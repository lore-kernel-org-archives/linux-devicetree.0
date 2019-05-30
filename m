From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 0/7] ARM: dts: Broadcom: Fix W=1 DTC warnings
Date: Thu, 30 May 2019 12:12:42 +0200
Message-ID: <070047b5-a101-e7b3-9ef3-7afc765921d9@gmx.net>
References: <20190528230134.27007-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528230134.27007-1-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Florian,

Am 29.05.19 um 01:01 schrieb Florian Fainelli:
> Hi all,
>
> This patch series attempts to fix the most obvious W=3D1 DTC warnings fo=
r
> Broadcom SoCs DTS files. Stefan, if you could do the same for all
> bcm283* that would be fantastic.

we tried to fix as much as possible in the past. So there are only those
left, which i don't know how to fix it properly (and without breaking
things):

arch/arm/boot/dts/bcm283x.dtsi:54.6-651.4: Warning
(unit_address_vs_reg): /soc: node has a reg or ranges property, but no
unit name

This from the SoC specific dtsi files which add values for the ranges /
dma-ranges.

soc {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ranges =3D <0x7e000000 0x20000000 0x=
02000000>;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 dma-ranges =3D <0x40000000 0x0000000=
0 0x20000000>;
};

arch/arm/boot/dts/bcm283x.dtsi:648.12-650.5: Warning (simple_bus_reg):
/soc/gpu: missing or empty reg/ranges property

This comes from the following simple bus child node:

vc4: gpu {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 compatible =3D "b=
rcm,bcm2835-vc4";
};

This issue should also exists in bcm-cygnus.dtsi. From the hardware side
the GPU is part of the SoC, but maybe we should move this node out of
the SoC simple bus?

Stefan
