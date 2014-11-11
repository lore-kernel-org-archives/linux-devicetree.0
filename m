From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 7/7] dt-bindings: add document for dw-hdmi
Date: Tue, 11 Nov 2014 21:33:55 +0800
Message-ID: <54621043.7080103@rock-chips.com>
References: <1415707952-11415-1-git-send-email-andy.yan@rock-chips.com> <1415707952-11415-8-git-send-email-andy.yan@rock-chips.com> <20141111122418.GA24306@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141111122418.GA24306@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "airlied@linux.ie" <airlied@linux.ie>, "Zubair.Kakakhel@imgtec.com" <Zubair.Kakakhel@imgtec.com>, "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>, "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>, "heiko@sntech.de" <heiko@sntech.de>, "djkurtz@chromium.org" <djkurtz@chromium.org>, "ykk@rock-chips.com" <ykk@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Sorry, it seems that there is somethings wrong whit my network.
This version maybe sent twice.
On 2014=E5=B9=B411=E6=9C=8811=E6=97=A5 20:24, Mark Rutland wrote:
> On Tue, Nov 11, 2014 at 12:12:32PM +0000, Andy Yan wrote:
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
>>
>> Changes in v7: None
>> Changes in v6: None
>> Changes in v5: None
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2: None
>>
>>   .../devicetree/bindings/drm/bridge/dw-hdmi.txt     | 38 ++++++++++=
++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw=
-hdmi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.tx=
t b/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
>> new file mode 100644
>> index 0000000..aa7ed17
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
>> @@ -0,0 +1,38 @@
>> +DesignWare HDMI bridge bindings
>> +
>> +Required properities:
>> +- compatibel: platform specific such as "fsl,imx6q-hdmi","fsl,imx6d=
l-hdmi"
>> +	      "rockchip,rk3288-dw-hdmi"
> s/compatibel/compatible/
   thanks, I will correct it next version.
>
> This should include the _precise_ strings you expect. Please format t=
his
> as a list, e.g.
>
> - compatible: should contain one of:
>    * "fsl,imx6q-hdmi"
>    * "fsl,imx6dl-hdmi"
>    * "rockchip,rk3288-dw-hdmi"
>
   I will do as your suggestion in next version
>> +- reg: physical base address of the controller and length
>> +- ddc-i2c-bus: the ddc i2c bus
>> +- interrupts: The interrupt number to the cpu
> Does the device only have one interrupt? Just describe what this
> logically is, and don't mention the CPU. It'll be plumbed through an
> interrupt controller anyhow.
   this device only have on interrupt for hot plug and other things.
>> +
>> +Optional properties
>> +- reg-io-width: the width of the reg:1,4, default set to 1 if not p=
resent
> I don't understand this description. Could you elaborate on this?
     this property is platform specific , it is used to describe the=20
register width.
     on imx6, the hdmi register is one byte width, which means the firs=
t=20
register address
     is 0x0000, the second is 0x0001, but on rk3288, the register is 4=20
bytes width, the first
      register address is 0x0000, and the second is 0x0004
>
>> +
>> +Example:
>> +	hdmi: hdmi@0120000 {
>> +		compatible =3D "fsl,imx6q-hdmi";
>> +		reg =3D <0x00120000 0x9000>;
>> +		interrupts =3D <0 115 0x04>;
>> +		gpr =3D <&gpr>;
>> +		clocks =3D <&clks 123>, <&clks 124>;
>> +		clock-names =3D "iahb", "isfr";
> These three properties weren't mentioned in the binding.
    gpr,clocks, port are platform specific property, on
    rk3288, the grf have the similar function as gpr on imx.
    And the clock also have different name on the two platforms.
    the port also different, on imx, the port is ipuxxx, but on rk3288,
    the port is vopx,
    these properties will be mentioned in platform dt binding.
>
>> +		ddc-i2c-bus =3D <&i2c2>;
>> +
>> +		port@0 {
>> +			reg =3D <0>;
>> +
>> +			hdmi_mux_0: endpoint {
>> +				remote-endpoint =3D <&ipu1_di0_hdmi>;
>> +			};
>> +		};
> Please mention the graphics bindings that require graph info.
>
> THanks,
> Mark.
>
>> +
>> +		port@1 {
>> +			reg =3D <1>;
>> +
>> +			hdmi_mux_1: endpoint {
>> +				remote-endpoint =3D <&ipu1_di1_hdmi>;
>> +			};
>> +		};
>> +	};
>> --=20
>> 1.9.1
>>
>>
>
>
