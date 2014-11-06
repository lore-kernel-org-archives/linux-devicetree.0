From: Caesar Wang <caesar.wang@rock-chips.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: add rk3288 power-domain node
Date: Thu, 06 Nov 2014 21:19:56 +0800
Message-ID: <545B757C.2060307@rock-chips.com>
References: <1415254961-5746-1-git-send-email-caesar.wang@rock-chips.com> <1415254961-5746-4-git-send-email-caesar.wang@rock-chips.com> <545B3518.2090409@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <545B3518.2090409@rock-chips.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kever Yang <kever.yang@rock-chips.com>, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "jinkun.hong" <jinkun.hong@rock-chips.com>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, fzf@rock-chips.com, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, cf@rock-chips.com, Jack Dai <jack.dai@rock-chips.com>
List-Id: devicetree@vger.kernel.org


=E5=9C=A8 2014=E5=B9=B411=E6=9C=8806=E6=97=A5 16:45, Kever Yang =E5=86=99=
=E9=81=93:
> Hi Caesar,
>
> On 11/06/2014 02:22 PM, Caesar Wang wrote:
>> Signed-off-by: Jack Dai <jack.dai@rock-chips.com>
>> Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
>> Signed-off-by: Caesar Wang <caesar.wang@rock-chips.com>
> pls detail the reason why you need to add all the clocks into=20
> power-controller node.

OK, I will fix in next patch v9 if there is no other problems in 1-2 da=
ys.

>> ---
>>
>> Changes in v8:
>>      - DTS go back to v2
>>
>> Changes in v7: None
>> Changes in v6: None
>> Changes in v5: None
>> Changes in v4: None
>> Changes in v3:
>>      - Decomposition power-controller, changed to multiple controlle=
r
>>      (gpu-power-controller, hevc-power-controller)
>>
>> Changes in v2:
>>      - make pd_vio clocks all one entry per line and alphabetize.
>>      - power: power-controller move back to pinctrl: pinctrl.
>>
>>   arch/arm/boot/dts/rk3288.dtsi | 66=20
>> +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288.dtsi=20
>> b/arch/arm/boot/dts/rk3288.dtsi
>> index cb18bb4..9cd269a 100644
>> --- a/arch/arm/boot/dts/rk3288.dtsi
>> +++ b/arch/arm/boot/dts/rk3288.dtsi
>> @@ -989,4 +989,70 @@
>>               };
>>           };
>>       };
>> +
>> +    power: power-controller {
>> +        compatible =3D "rockchip,rk3288-power-controller";
>> +        #power-domain-cells =3D <1>;
>> +        rockchip,pmu =3D <&pmu>;
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +
>> +        pd_gpu {
>> +            reg =3D <RK3288_PD_GPU>;
>> +            clocks =3D <&cru ACLK_GPU>;
>> +        };
>> +
>> +        pd_hevc {
>> +            reg =3D <RK3288_PD_HEVC>;
>> +            clocks =3D <&cru ACLK_HEVC>,
>> +                 <&cru SCLK_HEVC_CABAC>,
>> +                 <&cru SCLK_HEVC_CORE>,
>> +                 <&cru HCLK_HEVC>;
>> +        };
>> +
>> +        pd_vio {
>> +            reg =3D <RK3288_PD_VIO>;
>> +            clocks =3D <&cru ACLK_IEP>,
>> +                 <&cru ACLK_ISP>,
>> +                 <&cru ACLK_RGA_NIU>,
>> +                 <&cru ACLK_RGA>,
>> +                 <&cru ACLK_VIO0_NIU>,
>> +                 <&cru ACLK_VIO1_NIU>,
>> +                 <&cru ACLK_VIP>,
>> +                 <&cru ACLK_VOP0>,
>> +                 <&cru ACLK_VOP1>,
>> +                 <&cru DCLK_VOP0>,
>> +                 <&cru DCLK_VOP1>,
>> +                 <&cru HCLK_IEP>,
>> +                 <&cru HCLK_ISP>,
>> +                 <&cru HCLK_RGA>,
>> +                 <&cru HCLK_VIO_AHB_ARBI>,
>> +                 <&cru HCLK_VIO_NIU>,
>> +                 <&cru HCLK_VIO2_H2P>,
>> +                 <&cru HCLK_VIP>,
>> +                 <&cru HCLK_VOP0>,
>> +                 <&cru HCLK_VOP1>,
>> +                 <&cru PCLK_EDP_CTRL>,
>> +                 <&cru PCLK_HDMI_CTRL>,
>> +                 <&cru PCLK_LVDS_PHY>,
>> +                 <&cru PCLK_MIPI_CSI>,
>> +                 <&cru PCLK_MIPI_DSI0>,
>> +                 <&cru PCLK_MIPI_DSI1>,
>> +                 <&cru PCLK_VIO2_H2P>,
>> +                 <&cru SCLK_EDP_24M>,
>> +                 <&cru SCLK_EDP>,
>> +                 <&cru SCLK_HDMI_CEC>,
>> +                 <&cru SCLK_HDMI_HDCP>,
>> +                 <&cru SCLK_ISP_JPE>,
>> +                 <&cru SCLK_ISP>,
>> +                 <&cru SCLK_RGA>;
>> +        };
>> +
>> +        pd_video {
>> +            reg =3D <RK3288_PD_VIDEO>;
>> +            /* FIXME: add clocks */
> remove the 'FIXME'.

=46ixed.

>> +            clocks =3D <&cru ACLK_VCODEC>,
>> +                 <&cru HCLK_VCODEC>;
>> +        };
>> +    };
>>   };
>
>
>
>

--=20
Best regards,
Caesar


