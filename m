From: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: rockchip: add document for rk3066
 hdmi
Date: Wed, 27 Feb 2019 19:04:41 +0100
Message-ID: <b183d099-dcb3-9c3f-7031-2bd54d7fe5bb@gmail.com>
References: <20181229133318.18128-1-jbx6244@gmail.com>
 <20190201123235.1693-1-jbx6244@gmail.com> <20190225165923.GA2578@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225165923.GA2578@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, airlied@linux.ie, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks for your advice.

On 2/25/19 5:59 PM, Rob Herring wrote:> On Fri, Feb 01, 2019 at
01:32:35PM +0100, Johan Jonker wrote:
>> This patch adds a binding that describes the HDMI controller for
>> rk3066.
>
> This is not using the DW block like other Rockchip SoCs (IIRC)?

As outsider it's a little bit difficult to comment on that.
Maybe an insider can give a better answer.
The rk3066 is there early model.
Reusing blocks like in the later improved models wasn't in the fashion
yet I think.
Also comparing the rk3066-hdmi driver to the inno driver gives too many
differences in registers, sound support and irqs.
If it was similar they would have combined it in there own kernel.
Given the age there won't come any other support for it.
This is what we have...

>
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>  .../display/rockchip/rk3066_hdmi-rockchip.txt      | 60
++++++++++++++++++++++
>
> Using the compatible string plus '.txt' is the preferred naming.

Will change that in V2.
rk3066-hdmi      -> rk3066-hdmi-rockchip.txt

How about the other documents?
rk3036-inno-hdmi -> inno_hdmi-rockchip.txt
rk3288-dw-hdmi   -> dw_hdmi-rockchip.txt
rk3288-dp        -> analogix_dp-rockchip.txt
etc.

>
>>  1 file changed, 60 insertions(+)
>>  create mode 100644
Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
>>
>> diff --git
a/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
b/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
>> new file mode 100644
>> index 000000000..6a8f3754f
>> --- /dev/null
>> +++
b/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
>> @@ -0,0 +1,60 @@
>> +Rockchip specific extensions for rk3066 HDMI
>> +============================================
>> +
>> +Required properties:
>> +- compatible:
>> +	"rockchip,rk3066-hdmi";
>> +- reg:
>> +	Physical base address and length of the controller's registers.
>> +- clocks, clock-names:
>> +	Phandle to HDMI controller clock, name should be "hclk".
>> +- interrupts:
>> +	HDMI interrupt number.
>> +- power-domains:
>> +	Phandle to the RK3066_PD_VIO power domain.
>> +- rockchip,grf:
>> +	This soc uses GRF regs to switch the HDMI TX input between vop0 and
vop1.
>> +- ports:

Should "ports" be replaced by: "hdmi_in: port"?
What is preferred?

There are two different methods in use:
-1
		hdmi_in: port {

-2
		ports {
			hdmi_in: port {

>> +	Contains one port node with two endpoints, numbered 0 and 1,
>> +	connected respectively to vop0 and vop1.
>
> You should have an output port to an hdmi-connector node (or bridge) as
> well.

Which hdmi-connector node?
Could you explane with an example?
The Rockchip hdmi nodes I'm aware off only use the port nodes as a way
to switch the hdmi input between the vop's.
The vop nodes can have multiple outputs.

>
>> +- pinctrl-0, pinctrl-name:
>> +	Switch the iomux for the HPD/I2C pins to HDMI function.
>> +
>> +Example:
>> +	hdmi: hdmi@10116000 {
>> +		compatible = "rockchip,rk3066-hdmi";
>> +		reg = <0x10116000 0x2000>;
>> +		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru HCLK_HDMI>;
>> +		clock-names = "hclk";
>> +		power-domains = <&power RK3066_PD_VIO>;
>> +		rockchip,grf = <&grf>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&hdmii2c_xfer>, <&hdmi_hpd>;
>> +		status = "disabled";
>
> Don't show status in examples.

Will change that in V2.

>
>> +
>> +		hdmi_in: port {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			hdmi_in_vop0: endpoint@0 {
>> +				reg = <0>;
>> +				remote-endpoint = <&vop0_out_hdmi>;
>> +			};
>> +			hdmi_in_vop1: endpoint@1 {
>> +				reg = <1>;
>> +				remote-endpoint = <&vop1_out_hdmi>;
>> +			};
>> +		};
>> +	};
>> +
>> +&pinctrl {
>> +		hdmi {
>> +			hdmi_hpd: hdmi-hpd {
>> +				rockchip,pins = <0 RK_PA0 1 &pcfg_pull_default>;
>> +			};
>> +			hdmii2c_xfer: hdmii2c-xfer {
>> +				rockchip,pins = <0 RK_PA1 1 &pcfg_pull_none>,
>> +						<0 RK_PA2 1 &pcfg_pull_none>;
>> +			};
>> +		};
>> +};
>> --
>> 2.11.0
>>
