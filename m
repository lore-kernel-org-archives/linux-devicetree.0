From: Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH 3/3] ARM: dts: add rk3288 power-domain node
Date: Wed, 24 Sep 2014 21:13:43 +0800
Message-ID: <5422C387.9050005@rock-chips.com>
References: <1411440916-6830-1-git-send-email-jinkun.hong@rock-chips.com> <1411440916-6830-4-git-send-email-jinkun.hong@rock-chips.com> <2840362.2VhRfgMh5I@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2840362.2VhRfgMh5I@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>, "jinkun.hong" <jinkun.hong@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Wang Caesar <caesar.wang@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Jack Dai <jack.dai@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Heiko,

On 09/24/2014 01:52 AM, Heiko St=FCbner wrote:
> Am Montag, 22. September 2014, 19:55:16 schrieb jinkun.hong:
>> From: "jinkun.hong" <jinkun.hong@rock-chips.com>
>>
>> Signed-off-by: Jack Dai <jack.dai@rock-chips.com>
>> Signed-off-by: Wang Caesar <caesar.wang@rock-chips.com>
>> Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
>>
>> ---
>>
>>   arch/arm/boot/dts/rk3288.dtsi |   45
>> +++++++++++++++++++++++++++++++++++++++++ 1 file changed, 45 inserti=
ons(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk328=
8.dtsi
>> index 3bb5230..714b9d9 100644
>> --- a/arch/arm/boot/dts/rk3288.dtsi
>> +++ b/arch/arm/boot/dts/rk3288.dtsi
>> @@ -15,6 +15,7 @@
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/pinctrl/rockchip.h>
>>   #include <dt-bindings/clock/rk3288-cru.h>
>> +#include <dt-bindings/power-domain/rk3288.h>
>>   #include "skeleton.dtsi"
>>
>>   / {
>> @@ -467,6 +468,50 @@
>>   		compatible =3D "rockchip,rk3288-pmu", "syscon";
>>   		reg =3D <0xff730000 0x100>;
>>   	};
> missing blank line here
>
> Also please mind the ordering. We have the nodes without registers (l=
ike the
> pinctrl) at the bottom, so maybe add the power-controller alphabetica=
lly after
> the pinctrl node.
>
>> +	power: power-controller {
>> +		compatible =3D "rockchip,rk3288-power-controller";
>> +		#power-domain-cells =3D <1>;
>> +		rockchip,pmu =3D <&pmu>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		pd_gpu {
>> +			reg =3D <RK3288_PD_GPU>;
>> +			clocks =3D <&cru ACLK_GPU>;
>> +		};
>> +
>> +		pd_vio {
>> +			reg =3D <RK3288_PD_VIO>;
>> +			clocks =3D <&cru HCLK_RGA>, <&cru HCLK_VOP0>,
>> +				<&cru HCLK_VOP1>, <&cru HCLK_VIO_AHB_ARBI>,
>> +				<&cru HCLK_VIO_NIU>, <&cru HCLK_VIP>,
>> +				<&cru HCLK_IEP>, <&cru HCLK_ISP>,
>> +				<&cru HCLK_VIO2_H2P>, <&cru PCLK_MIPI_DSI0>,
>> +				<&cru PCLK_MIPI_DSI1>, <&cru PCLK_MIPI_CSI>,
>> +				<&cru PCLK_LVDS_PHY>, <&cru PCLK_EDP_CTRL>,
>> +				<&cru PCLK_HDMI_CTRL>, <&cru PCLK_VIO2_H2P>,
>> +				<&cru ACLK_VOP0>, <&cru ACLK_IEP>,
>> +				<&cru ACLK_VIO0_NIU>, <&cru ACLK_VIP>,
>> +				<&cru ACLK_VOP1>, <&cru ACLK_ISP>,
>> +				<&cru ACLK_VIO1_NIU>, <&cru ACLK_RGA>,
>> +				<&cru ACLK_RGA_NIU>,<&cru SCLK_RGA>,
>> +				<&cru DCLK_VOP0>, <&cru DCLK_VOP1>,
>> +				<&cru SCLK_EDP_24M>, <&cru SCLK_EDP>,
>> +				<&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>,
>> +				<&cru SCLK_HDMI_HDCP>, <&cru SCLK_HDMI_CEC>;
>> +		};
>> +
>> +		pd_video {
>> +			reg =3D <RK3288_PD_VIDEO>;
>> +			/* FIXME: add clocks */
> what is missing for these clocks? If it's just more clock ids, please
> corrdinate with Kever
The clock tree in PD_VIDEO is not complete, maybe because the
MUX which should be set from GRF_SOC_CON0[7].

I will handle this in my patch.

BR
-Kever
