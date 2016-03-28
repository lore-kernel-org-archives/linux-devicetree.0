From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 2/4] dt-bindings: add bindings for rk3399 clock controller
Date: Mon, 28 Mar 2016 02:07:30 +0200
Message-ID: <3689505.b0IKY6iWOt@phil>
References: <1458974276-10325-1-git-send-email-zhengxing@rock-chips.com> <1458974276-10325-3-git-send-email-zhengxing@rock-chips.com> <1507551.YPleCY5ZQt@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507551.YPleCY5ZQt@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Xing,

Am Montag, 28. M=E4rz 2016, 01:52:12 schrieb Heiko St=FCbner:
> Am Samstag, 26. M=E4rz 2016, 14:37:54 schrieb Xing Zheng:
> > Add devicetree bindings for Rockchip cru which found on
> > Rockchip SoCs.
> >=20
> > Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >=20
> > Changes in v5: None
> > Changes in v3: None
> > Changes in v2: None
> >=20
> >  .../bindings/clock/rockchip,rk3399-cru.txt         |   83
> >=20
> > ++++++++++++++++++++ 1 file changed, 83 insertions(+)
> >=20
> >  create mode 100644
> >=20
> > Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk339=
9-
>=20
> cru.txt
>=20
> > b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt n=
ew
> > file mode 100644
> > index 0000000..9427caa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.t=
xt
> > @@ -0,0 +1,83 @@
> > +* Rockchip RK3399 Clock and Reset Unit
> > +
> > +The RK3399 clock controller generates and supplies clock to variou=
s
> > +controllers within the SoC and also implements a reset controller =
for
> > SoC +peripherals.
> > +
> > +Required Properties:
> > +
> > +- compatible: PMU for CRU should be "rockchip,rk3399-pmucru"
> > +- compatible: CRU should be "rockchip,rk3399-cru"
> > +- reg: physical base address of the controller and length of memor=
y
>=20
> mapped
>=20
> > +  region.
> > +- #clock-cells: should be 1.
> > +- #reset-cells: should be 1.
> > +
> > +Optional Properties:
> > +
> > +- rockchip,grf: phandle to the syscon managing the "general regist=
er
>=20
> files"
>=20
> > +  If missing, pll rates are not changeable, due to the missing pll=
 lock
> > status. +
>=20
> the rk3399 doesn't need the GRF, so we should drop this block for now

actually, I just saw that the GRF is needed for the static settings dur=
ing=20
init. So the rockchip,grf should stay but also move up to required=20
properties?

Same for the grf-comment in the examples-section.


Heiko


>=20
> > +Each clock is assigned an identifier and client nodes can use this
> > identifier +to specify the clock which they consume. All available
> > clocks
> > are defined as +preprocessor macros in the
> > dt-bindings/clock/rk3399-cru.h
> > headers and can be +used in device tree sources. Similar macros exi=
st
> > for
> > the reset sources in +these files.
> > +
> > +External clocks:
> > +
> > +There are several clocks that are generated outside the SoC. It is
>=20
> expected
>=20
> > +that they are defined using standard clock bindings with following
> > +clock-output-names:
> > + - "xin24m" - crystal input - required,
> > + - "xin32k" - rtc clock - optional,
> > + - "ext_i2s" - external I2S clock - optional,
> > + - "ext_gmac" - external GMAC clock - optional
> > + - "ext_hsadc" - external HSADC clock - optional,
> > + - "ext_isp" - external ISP clock - optional,
> > + - "ext_jtag" - external JTAG clock - optional
> > + - "ext_vip" - external VIP clock - optional,
> > + - "usbotg_out" - output clock of the pll in the otg phy
>=20
> external clock listing needs adjusting, something like
>=20
> - clkin_i2s
> - clkin_gmac
> --> remove ext_hsadc
> - clkin_cif
> --> remove ext_jtag
> --> remove ext_vip
> - clk_usbphy0_480m
> - clk_usbphy0_480m
>=20
> maybe?
>=20
> > +
> > +Example: General Register Files
> > +
> > +	pmugrf: syscon@ff320000 {
> > +		compatible =3D "rockchip,rk3399-pmugrf", "syscon";
> > +		reg =3D <0x0 0xff320000 0x0 0x1000>;
> > +	};
> > +
> > +	grf: syscon@ff770000 {
> > +		compatible =3D "rockchip,rk3399-grf", "syscon";
> > +		reg =3D <0x0 0xff770000 0x0 0x10000>;
> > +	};
> > +
> > +Example: Clock controller node:
> > +
> > +	pmucru: pmu-clock-controller@ff750000 {
> > +		compatible =3D "rockchip,rk3399-pmucru";
> > +		reg =3D <0x0 0xff750000 0x0 0x1000>;
> > +		rockchip,grf =3D <&pmugrf>;
> > +		#clock-cells =3D <1>;
> > +		#reset-cells =3D <1>;
> > +	};
> > +
> > +	cru: clock-controller@ff760000 {
> > +		compatible =3D "rockchip,rk3399-cru";
> > +		reg =3D <0x0 0xff760000 0x0 0x1000>;
> > +		rockchip,grf =3D <&grf>;
> > +		#clock-cells =3D <1>;
> > +		#reset-cells =3D <1>;
> > +	};
>=20
> also here drop grf nodes and rockchip,grf properties?
>=20
> > +
> > +Example: UART controller node that consumes the clock generated by=
 the
> > clock +  controller:
> > +
> > +	uart0: serial@ff1a0000 {
> > +		compatible =3D "rockchip,rk3399-uart", "snps,dw-apb-uart";
> > +		reg =3D <0x0 0xff180000 0x0 0x100>;
> > +		clocks =3D <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> > +		clock-names =3D "baudclk", "apb_pclk";
> > +		interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> > +		reg-shift =3D <2>;
> > +		reg-io-width =3D <4>;
> > +	};
