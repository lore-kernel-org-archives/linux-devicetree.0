From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v12 3/3] ARM: dts: add rk3288 power-domain node
Date: Fri, 28 Nov 2014 10:01:41 +0100
Message-ID: <8696614.2RqPYf6MXp@diego>
References: <1416217842-4716-1-git-send-email-caesar.wang@rock-chips.com> <1416217842-4716-4-git-send-email-caesar.wang@rock-chips.com> <5063652.5fn5DLTjuV@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5063652.5fn5DLTjuV@diego>
Sender: linux-doc-owner@vger.kernel.org
To: Caesar Wang <caesar.wang@rock-chips.com>
Cc: khilman@kernel.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, fzf@rock-chips.com, cf@rock-chips.com, chris.zhong@rock-chips.com, xxm@rock-chips.com, chm@rock-chips.com, djkurtz@chromium.org, Jack Dai <jack.dai@rock-chips.com>, "jinkun.hong" <jinkun.hong@rock-chips.com>
List-Id: devicetree@vger.kernel.org

please ignore this and the previous mail - I accidentially hit a wrong =
button.

Sorry for the noise
Heiko

Am Freitag, 28. November 2014, 09:57:47 schrieb Heiko St=FCbner:
> Hi Caesar,
>=20
> Am Montag, 17. November 2014, 17:50:41 schrieb Caesar Wang:
> > This patch add the needed clocks into power-controller.
> >=20
> > why need we do so that?
> >=20
> > Firstly, we always be needed turn off clocks to save power when
> > the system enter suspend.So we need to enumerate the clocks are nee=
ded
> > to switch power doamin no and off.
> >=20
> > Secondly, Rk3288 reset circuit should be syncchronous reset and
> > then sync revoked.so we need to enable clocks of all devices.
> >=20
> > Signed-off-by: Jack Dai <jack.dai@rock-chips.com>
> > Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
> > Signed-off-by: Caesar Wang <caesar.wang@rock-chips.com>
> >=20
> > ---
> >=20
> > Changes in v12:
> >     - Remove essential clocks from rk3288 PD_VIO domain,
> >    =20
> >       Some clocks are essential for the system health and should no=
t be
> >       turned down. However there is no owner for them so if they li=
sted as
> >       belonging to power domain we'll try toggling them up and down=
 during
> >       power domain transition. As a result we either fail to suspen=
d or
> >=20
> > resume the system.
> >=20
> > Changes in v11: None
> >=20
> > Changes in v10:
> >     - fix missing the #include <dt-bindings/power-domain/rk3288.h>
> >     - remove the notes
> >=20
> > Changes in v9:
> >     - add decription for power-doamin node
> >=20
> > Changes in v8:
> >     - DTS go back to v2
> >=20
> > Changes in v7: None
> > Changes in v6: None
> > Changes in v5: None
> > Changes in v4: None
> >=20
> > Changes in v3:
> >     - Decomposition power-controller, changed to multiple controlle=
r
> >     (gpu-power-controller, hevc-power-controller)
> >=20
> > Changes in v2:
> >     - make pd_vio clocks all one entry per line and alphabetize.
> >     - power: power-controller move back to pinctrl: pinctrl.
> > =20
> >  arch/arm/boot/dts/rk3288.dtsi | 59
> >=20
> > +++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 59
> > insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk32=
88.dtsi
> > index cb18bb4..d9cd8c0 100644
> > --- a/arch/arm/boot/dts/rk3288.dtsi
> > +++ b/arch/arm/boot/dts/rk3288.dtsi
> > @@ -15,6 +15,7 @@
> >=20
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/pinctrl/rockchip.h>
> >  #include <dt-bindings/clock/rk3288-cru.h>
> >=20
> > +#include <dt-bindings/power-domain/rk3288.h>
> >=20
> >  #include "skeleton.dtsi"
> > =20
> >  / {
> >=20
> > @@ -989,4 +990,62 @@
> >=20
> >  			};
> >  	=09
> >  		};
> >  =09
> >  	};
> >=20
> > +
> > +	power: power-controller {
> > +		compatible =3D "rockchip,rk3288-power-controller";
> > +		#power-domain-cells =3D <1>;
> > +		rockchip,pmu =3D <&pmu>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		pd_gpu {
> > +			reg =3D <RK3288_PD_GPU>;
> > +			clocks =3D <&cru ACLK_GPU>;
> > +		};
> > +
> > +		pd_hevc {
> > +			reg =3D <RK3288_PD_HEVC>;
> > +			clocks =3D <&cru ACLK_HEVC>,
> > +				 <&cru SCLK_HEVC_CABAC>,
> > +				 <&cru SCLK_HEVC_CORE>,
> > +				 <&cru HCLK_HEVC>;
> > +		};
> > +
> > +		pd_vio {
> > +			reg =3D <RK3288_PD_VIO>;
> > +			clocks =3D <&cru ACLK_IEP>,
> > +				 <&cru ACLK_ISP>,
> > +				 <&cru ACLK_RGA>,
> > +				 <&cru ACLK_VIP>,
> > +				 <&cru ACLK_VOP0>,
> > +				 <&cru ACLK_VOP1>,
> > +				 <&cru DCLK_VOP0>,
> > +				 <&cru DCLK_VOP1>,
> > +				 <&cru HCLK_IEP>,
> > +				 <&cru HCLK_ISP>,
> > +				 <&cru HCLK_RGA>,
> > +				 <&cru HCLK_VIP>,
> > +				 <&cru HCLK_VOP0>,
> > +				 <&cru HCLK_VOP1>,
> > +				 <&cru PCLK_EDP_CTRL>,
> > +				 <&cru PCLK_HDMI_CTRL>,
> > +				 <&cru PCLK_LVDS_PHY>,
> > +				 <&cru PCLK_MIPI_CSI>,
> > +				 <&cru PCLK_MIPI_DSI0>,
> > +				 <&cru PCLK_MIPI_DSI1>,
> > +				 <&cru SCLK_EDP_24M>,
> > +				 <&cru SCLK_EDP>,
> > +				 <&cru SCLK_HDMI_CEC>,
> > +				 <&cru SCLK_HDMI_HDCP>,
> > +				 <&cru SCLK_ISP_JPE>,
> > +				 <&cru SCLK_ISP>,
> > +				 <&cru SCLK_RGA>;
> > +		};
> > +
> > +		pd_video {
> > +			reg =3D <RK3288_PD_VIDEO>;
> > +			clocks =3D <&cru ACLK_VCODEC>,
> > +				 <&cru HCLK_VCODEC>;
> > +		};
> > +	};
> >=20
> >  };

