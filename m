From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v4 6/6] ARM: zynq: DT: Add OCM controller node
Date: Sun, 16 Nov 2014 11:32:23 -0800
Message-ID: <c52187589f5c4cc6b908d899c2b9f7a6@BN1BFFO11FD036.protection.gbl>
References: <cover.1415962281.git.michal.simek@xilinx.com>
 <0a88d52b5e71fb220ca619180ec9ca746edad2b1.1415962281.git.michal.simek@xilinx.com>
 <546881CA.2020801@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <546881CA.2020801@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, monstr@monstr.eu, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Sun, 2014-11-16 at 11:51AM +0100, Andreas F=C3=A4rber wrote:
> Hi Michal,
>=20
> Am 14.11.2014 um 11:52 schrieb Michal Simek:
> > diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/z=
ynq-7000.dtsi
> > index ce2ef5bec4f2..e217fb1c1169 100644
> > --- a/arch/arm/boot/dts/zynq-7000.dtsi
> > +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> > @@ -150,6 +150,13 @@
> >  			reg =3D <0xf8006000 0x1000>;
> >  		};
> >=20
> > +		ocmc: memory-controller@f800c000 {
> > +			compatible =3D "xlnx,zynq-ocmc-1.0";
> > +			interrupt-parent =3D <&intc>;
> > +			interrupts =3D <0 3 4>;
> > +			reg =3D <0xf800c000 0x1000>;
> > +		};
> > +
> >  		uart0: serial@e0000000 {
> >  			compatible =3D "xlnx,xuartps", "cdns,uart-r1p8";
> >  			status =3D "disabled";
>=20
> Not directly related to this patch: As one can see here, the node ord=
er
> is quite a mess... According to Olof, nodes should be ordered by unit
> address, whereas here some but not all seem ordered by node name. Wou=
ld
> you welcome a cleanup patch, or can you fix that yourself?

I wouldn't say it's a mess, just a different property to sort the nodes
by. For humans reading the DT, searching for nodes, alphabetical order
helps finding the right node, IMHO. What advantage would sorting by
address have?

	Thanks,
	S=C3=B6ren
