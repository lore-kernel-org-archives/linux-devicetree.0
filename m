From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH V5 7/7] dt-bindings: add document for dw-hdmi
Date: Mon, 10 Nov 2014 17:44:22 +0800
Message-ID: <546088F6.4090505@rock-chips.com>
References: <1415424410-7364-1-git-send-email-andy.yan@rock-chips.com> <1415424767-7761-1-git-send-email-andy.yan@rock-chips.com> <546082A9.5050203@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <546082A9.5050203@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, Josh Boyer <jwboyer@redhat.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Lucas Stach <l.stach@pengutronix.de>, djkurtz@google.com, ykk@rock-chips.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, jay.xu@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi ZubairLK
On 2014=E5=B9=B411=E6=9C=8810=E6=97=A5 17:17, Zubair Lutfullah Kakakhel=
 wrote:
> Nice work.
>
> This patch should move the binding from
>
> Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt
> to the location instead of making a new file and leaving the old
> one in place.
>
> And use git format-patch -M to highlight any changes.
>
> Regards
> ZubairLK
    I add these bindings for dw-hdmi core, because
   properities like reg, interrupts, ddc-i2c-bus, reg-io-width are used
   by dw-hdmi core, but properities like compatible, gpr,clk, are platf=
orm
   specific , they are handled by the platform code like dw_hdmi-imx.c
   and described in platform specific dt binds like /imx-drm/hdmi.txt
> On 08/11/14 05:32, Andy Yan wrote:
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
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
>> +- reg: physical base address of the controller and length
>> +- ddc-i2c-bus: the ddc i2c bus
>> +- interrupts: The interrupt number to the cpu
>> +
>> +Optional properties
>> +- reg-io-width: the width of the reg:1,4, default set to 1 if not p=
resent
>> +
>> +Example:
>> +	hdmi: hdmi@0120000 {
>> +		compatible =3D "fsl,imx6q-hdmi";
>> +		reg =3D <0x00120000 0x9000>;
>> +		interrupts =3D <0 115 0x04>;
>> +		gpr =3D <&gpr>;
>> +		clocks =3D <&clks 123>, <&clks 124>;
>> +		clock-names =3D "iahb", "isfr";
>> +		ddc-i2c-bus =3D <&i2c2>;
>> +
>> +		port@0 {
>> +			reg =3D <0>;
>> +
>> +			hdmi_mux_0: endpoint {
>> +				remote-endpoint =3D <&ipu1_di0_hdmi>;
>> +			};
>> +		};
>> +
>> +		port@1 {
>> +			reg =3D <1>;
>> +
>> +			hdmi_mux_1: endpoint {
>> +				remote-endpoint =3D <&ipu1_di1_hdmi>;
>> +			};
>> +		};
>> +	};
>>
>
>
