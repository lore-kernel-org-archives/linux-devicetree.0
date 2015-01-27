From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v4 6/7] ARM: zynq: DT: Add pinctrl information
Date: Mon, 26 Jan 2015 18:05:23 -0800
Message-ID: <95fcb833572949c9aa2f406c0b147d1f@BL2FFO11FD060.protection.gbl>
References: <1420818231-13451-1-git-send-email-soren.brinkmann@xilinx.com>
 <1420818231-13451-7-git-send-email-soren.brinkmann@xilinx.com>
 <54C6D44C.4060106@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54C6D44C.4060106@suse.de>
Sender: linux-sh-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, linux-sh@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>, linux-rockchip@lists.infradead.org, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Alessandro Rubini <rubini@unipv.it>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-01-27 at 12:57AM +0100, Andreas F=C3=A4rber wrote:
> Am 09.01.2015 um 16:43 schrieb Soren Brinkmann:
> > Add pinctrl descriptions to the zc702 and zc706 device trees.
> >=20
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > Tested-by: Andreas F=C3=A4rber <afaerber@suse.de>
> > ---
> > Changes since v1:
> >  - remove 'pinctrl-' prefix for pinctrl sub-nodes
> >  - separate config and mux nodes
> >=20
> > Changes since RFC v2:
> >  - add pinconf properties to zc702 mdio node
> >  - remove arguments from bias-related props
> >=20
> > Changes since RFC v1:
> >  - separate DT changes into their own patch
> > ---
> >  arch/arm/boot/dts/zynq-7000.dtsi |   8 +-
> >  arch/arm/boot/dts/zynq-zc702.dts | 181 +++++++++++++++++++++++++++=
++++++++++++
> >  arch/arm/boot/dts/zynq-zc706.dts | 152 +++++++++++++++++++++++++++=
+++++
> >  3 files changed, 340 insertions(+), 1 deletion(-)
> [...]
> > diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/z=
ynq-zc702.dts
> > index 280f02dd4ddc..4995412f116f 100644
> > --- a/arch/arm/boot/dts/zynq-zc702.dts
> > +++ b/arch/arm/boot/dts/zynq-zc702.dts
> [...]
> > @@ -50,15 +52,24 @@
> >  	status =3D "okay";
> >  	phy-mode =3D "rgmii-id";
> >  	phy-handle =3D <&ethernet_phy>;
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_gem0_default>;
> > =20
> >  	ethernet_phy: ethernet-phy@7 {
> >  		reg =3D <7>;
> >  	};
> >  };
> > =20
> > +&gpio0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_gpio0_default>;
>=20
> On linux-next the equivalent no longer works for the Parallella, with
> gpio failing to probe.
>=20
> If I move these two properties to the leds node (for which I am
> configuring gpio 7) then I get a heartbeat as before.

I think for USB I have a fix (see other email with patch), but LEDs see=
m
to be broken too. On my zc702 I get:
   of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/ds2=
3[0]' - status (-517)

517 is probe deferral. Looks like the LED driver needs to learn to defe=
r
probing when the GPIO driver isn't available yet.

	S=C3=B6ren
