From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] ARM: zynq: DT: Add CAN node
Date: Thu, 24 Jul 2014 08:55:21 -0700
Message-ID: <d973d7c8-30e7-458e-9d57-15da917cde04@BL2FFO11FD030.protection.gbl>
References: <52d799e17cd3539713625c6f6a6666620f52d692.1406120732.git.michal.simek@xilinx.com>
 <20140723160702.GA14564@xsjandreislx>
 <2fe3a869-d17c-4521-a5c1-7c347ae34726@BN1BFFO11FD060.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2fe3a869-d17c-4521-a5c1-7c347ae34726@BN1BFFO11FD060.protection.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, monstr@monstr.eu, Josh Cartwright <josh.cartwright@ni.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-07-24 at 08:44AM +0200, Michal Simek wrote:
> On 07/23/2014 06:07 PM, S=C3=B6ren Brinkmann wrote:
> > On Wed, 2014-07-23 at 03:05PM +0200, Michal Simek wrote:
> >> Add node describing Zynq's CAN controller.
> >>
> >> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> >> ---
> >>
> >>  arch/arm/boot/dts/zynq-7000.dtsi | 13 ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/=
zynq-7000.dtsi
> >> index 366ca6434f54..2287d9b4ed1a 100644
> >> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> >> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> >> @@ -71,7 +71,18 @@
> >>  			interrupts =3D <0 7 4>;
> >>  			interrupt-parent =3D <&intc>;
> >>  			clocks =3D <&clkc 12>;
> >> -		};
> >> +		};
> >> +
> >> +		can0: can@e0008000 {
> >> +			compatible =3D "xlnx,zynq-can-1.0";
> >> +			clocks =3D <&clkc 19>, <&clkc 36>;
> >> +			clock-names =3D "can_clk", "pclk";
> >> +			reg =3D <0xe0008000 0x1000>;
> >> +			interrupts =3D <0 28 4>;
> >> +			interrupt-parent =3D <&intc>;
> >> +			tx-fifo-depth =3D <0x40>;
> >> +			rx-fifo-depth =3D <0x40>;
> >> +		};
> >=20
> > What about the second CAN core? You also probably want to add
> > 'status =3D "disabled"' in the dtsi.
>=20
> Second can core - yes.
>=20
> I can add status =3D "disabled" but then question is if make
> sense to change status for any zynq dts file. Or just
> keep enable both.
>=20
> In our repo is enabled can0 on zc702.
>=20
> What do you think?

Well, it should be enabled on boards that have CAN pinned out. Does any
of our boards have that?

	S=C3=B6ren
