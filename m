Return-Path: <SRS0=ihK2=XI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:12312 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbfIMJuN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Sep 2019 05:50:13 -0400
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 6/6] ARM: dts: Configure rstctrl reset for SGX
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190814131408.57162-7-tony@atomide.com>
Date: Fri, 13 Sep 2019 11:49:56 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <92652315-A763-485F-A4FA-CB868016E045@goldelico.com>
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-7-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>, Adam Ford <aford173@gmail.com>, =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, moaz korena <moaz@korena.xyz>, Merlijn Wajer <merlijn@wizzup.org>, =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Philipp Rossak <embed3d@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Tony,

> Am 14.08.2019 um 15:14 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> The following can be tested via sysfs with the following to ensure the =
SGX
> module gets enabled and disabled properly:
>=20
> # echo on > =
/sys/bus/platform/devices/5600fe00.target-module/power/control
> # rwmem 0x5600fe00		# revision register
> 0x5600fe00 =3D 0x40000000
> # echo auto > =
/sys/bus/platform/devices/5600fe00.target-module/power/control
> # rwmem 0x5000fe00
> Bus error
>=20
> Note that this patch depends on the PRM rstctrl driver that has
> been recently posted.

Do you have a list of these patches or a git for pulling the complete =
set
of changes? Does it depend on mainline or linux-next?

I tried to find the correct patches but it does not seem to work for
me on beaglebone.

> If the child device driver(s) need to prevent
> rstctrl reset on PM runtime suspend, the drivers need to increase
> the usecount for the shared rstctrl reset that can be mapped also
> for the child device(s) or accessed via dev->parent.
>=20
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Filip Matijevi=C4=87 <filip.matijevic.pz@gmail.com>
> Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: moaz korena <moaz@korena.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Cc: Philipp Rossak <embed3d@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> arch/arm/boot/dts/am33xx.dtsi | 25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/am33xx.dtsi =
b/arch/arm/boot/dts/am33xx.dtsi
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -460,6 +460,31 @@
> 			       <&edma 5 0>;
> 			dma-names =3D "tx", "rx";
> 		};
> +
> +		target-module@56000000 {
> +			compatible =3D "ti,sysc-omap4", "ti,sysc";
> +			reg =3D <0x5600fe00 0x4>,
> +			      <0x5600fe10 0x4>;
> +			reg-names =3D "rev", "sysc";
> +			ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			clocks =3D <&gfx_l3_clkctrl =
AM3_GFX_L3_GFX_CLKCTRL 0>;
> +			clock-names =3D "fck";
> +			resets =3D <&prm_gfx 0>;
> +			reset-names =3D "rstctrl";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges =3D <0 0x56000000 0x1000000>;
> +
> +			/*
> +			 * Closed source PowerVR driver, no child device
> +			 * binding or driver in mainline
> +			 */
> +		};
> 	};
> };
>=20
> --=20
> 2.21.0


BR and thanks,
