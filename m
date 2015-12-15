From: Sergei Ianovich <ynvich@gmail.com>
Subject: Re: [PATCH v5 2/2] arm: pxa27x: support for ICP DAS LP-8x4x w/ DT
Date: Tue, 15 Dec 2015 19:42:07 +0300
Message-ID: <1450197727.21989.9.camel@gmail.com>
References: <1449700088-28076-3-git-send-email-ynvich@gmail.com>
	 <1450196875-6739-1-git-send-email-ynvich@gmail.com>
	 <7496839.vMjVcqPe8Q@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7496839.vMjVcqPe8Q@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Arnaud Ebalard <arno@natisbad.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-12-15 at 17:32 +0100, Arnd Bergmann wrote:
> On Tuesday 15 December 2015 19:27:50 Sergei Ianovich wrote:
> > =C2=A0.../devicetree/bindings/vendor-prefixes.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0arch/arm/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A03 +
> > =C2=A0arch/arm/boot/dts/pxa27x-lp8x4x-i105.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A050 ++++
> > =C2=A0arch/arm/boot/dts/pxa27x-lp8x4x.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =
259
> > +++++++++++++++++++++
> > =C2=A0arch/arm/configs/lp8x4x_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 176
> > ++++++++++++++
> >=20
>=20
> I had not noticed earlier that you are adding a new defconfig file.
> PXA is
> already the platform with the most defconfig files, and I'd rather
> like
> to see that reduced than increased.
>=20
> Is there a chance you could merge this one with some of the existing
> files
> into one configuration that handles them all?

There are several board-specific devices on LP8x4x: custom FPGA, custom
UART, custom IRQ on FPGA, custom parallel bus for industrial IO. The
defconfig file could alert potential users to this fact. If this is not
a sufficient reason to have a defconfig file, it can be dropped.

I use the full .config anyway :)
