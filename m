From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v3 10/14] ARM: dts: imx7: Add video mux,
 csi and mipi_csi and connections
Date: Wed, 09 May 2018 12:10:24 +0100
Message-ID: <m3a7t99ja7.fsf@linaro.org>
References: <20180507162152.2545-1-rui.silva@linaro.org>
 <20180507162152.2545-11-rui.silva@linaro.org>
 <1525856026.5888.4.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <1525856026.5888.4.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,
Thanks.

On Wed 09 May 2018 at 08:53, Philipp Zabel wrote:
> On Mon, 2018-05-07 at 17:21 +0100, Rui Miguel Silva wrote:
>> This patch adds the device tree nodes for csi, video 
>> multiplexer and mipi-csi
>> besides the graph connecting the necessary endpoints to make 
>> the media capture
>> entities to work in imx7 Warp board.
>> 
>> Also add the pin control related with the mipi_csi in that 
>> board.
>> 
>> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>> ---
>>  arch/arm/boot/dts/imx7s-warp.dts | 78 
>>  ++++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/imx7s.dtsi     | 28 ++++++++++++
>>  2 files changed, 106 insertions(+)
>> 
>> diff --git a/arch/arm/boot/dts/imx7s-warp.dts 
>> b/arch/arm/boot/dts/imx7s-warp.dts
>> index 8a30b148534d..ffd170ae925a 100644
>> --- a/arch/arm/boot/dts/imx7s-warp.dts
>> +++ b/arch/arm/boot/dts/imx7s-warp.dts
>> @@ -310,6 +310,77 @@
>>  	status = "okay";
>>  };
>>  
>> +&gpr {
>> +	csi_mux {
>> +		compatible = "video-mux";
>> +		mux-controls = <&mux 0>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		port@0 {
>> +			reg = <0>;
>> +
>> +			csi_mux_from_parallel_sensor: endpoint {
>> +			};
>> +		};
>> +
>> +		port@1 {
>> +			reg = <1>;
>> +
>> +			csi_mux_from_mipi_vc0: endpoint {
>> +				remote-endpoint = 
>> <&mipi_vc0_to_csi_mux>;
>> +			};
>> +		};
>> +
>> +		port@2 {
>> +			reg = <2>;
>> +
>> +			csi_mux_to_csi: endpoint {
>> +				remote-endpoint = 
>> <&csi_from_csi_mux>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&csi {
>> +	status = "okay";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	port@0 {
>> +		reg = <0>;
>
> Same comment as for the binding docs, since the CSI only has one 
> port,
> it doesn't have to be numbered.

ack.

>
>> +
>> +		csi_from_csi_mux: endpoint {
>> +			remote-endpoint = <&csi_mux_to_csi>;
>> +		};
>> +	};
>> +};
>> +
>> +&mipi_csi {
>> +	clock-frequency = <166000000>;
>> +	status = "okay";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	fsl,csis-hs-settle = <3>;
>> +
>> +	port@0 {
>> +		reg = <0>;
>> +
>> +		mipi_from_sensor: endpoint {
>> +			remote-endpoint = <&ov2680_to_mipi>;
>> +			data-lanes = <1>;
>> +		};
>> +	};
>> +
>> +	port@1 {
>> +		reg = <1>;
>> +
>> +		mipi_vc0_to_csi_mux: endpoint {
>> +			remote-endpoint = 
>> <&csi_mux_from_mipi_vc0>;
>> +		};
>> +	};
>> +};
>> +
>>  &wdog1 {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&pinctrl_wdog>;
>> @@ -357,6 +428,13 @@
>>  		>;
>>  	};
>>  
>> +	pinctrl_mipi_csi: mipi_csi {
>> +		fsl,pins = <
>> +			MX7D_PAD_LPSR_GPIO1_IO03__GPIO1_IO3 
>> 0x14
>
> This is the ov2680 reset GPIO? I think this belongs into patch 
> 12.

Yes, you are right.

>
>> +			MX7D_PAD_ENET1_RGMII_TD0__GPIO7_IO6 
>> 0x14
>
> What is this GPIO used for?

MKBUS_RESET and totally unrelated. I will remove it. Thanks for 
notice this.

---
Cheers,
	Rui
