From: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez_Rojas?= <noltari@gmail.com>
Subject: Re: [PATCH 2/3] MIPS: BMIPS: improve BCM6358 device tree
Date: Mon, 4 Apr 2016 10:13:07 +0200
Message-ID: <1BA9312E-2743-472E-B07E-BE69C54573DE@gmail.com>
References: <1459685585-11747-1-git-send-email-noltari@gmail.com> <1459685585-11747-2-git-send-email-noltari@gmail.com> <20160403231010.GA6518@linux-mips.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160403231010.GA6518@linux-mips.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, simon@fire.lp0.eu
List-Id: devicetree@vger.kernel.org

Done,

=C1lvaro.

> El 4 abr 2016, a las 1:10, Ralf Baechle <ralf@linux-mips.org> escribi=
=F3:
>=20
> On Sun, Apr 03, 2016 at 02:13:04PM +0200, =C1lvaro Fern=E1ndez Rojas =
wrote:
>=20
>> - Switch to bcm6345-l1-intc interrupt controller.
>> - Add ehci0 and ohci0 nodes.
>> - Use proper native-endian syscon property.
>>=20
>> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
>> ---
>> arch/mips/boot/dts/brcm/bcm6358.dtsi | 29 ++++++++++++++++++++++++--=
---
>=20
> Any reason Why didn't you fold this patch into the "[v3,2/2] bmips: a=
dd
> device tree example for BCM6358" patch of the other series?
>=20
>  Ralf
>=20
