Return-Path: <SRS0=HxI5=F4=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: qcom: Add device tree binding
 for GENI SE
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-2-git-send-email-kramasub@codeaurora.org>
 <20180305235831.i7kxups7khus2g5c@rob-hp-laptop>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <af0d4155-c3bf-97cb-98b2-978093a30611@codeaurora.org>
Date: Mon, 5 Mar 2018 17:55:56 -0700
MIME-Version: 1.0
In-Reply-To: <20180305235831.i7kxups7khus2g5c@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>



On 3/5/2018 4:58 PM, Rob Herring wrote:
> On Tue, Feb 27, 2018 at 06:38:06PM -0700, Karthikeyan Ramasubramanian wrote:
>> Add device tree binding support for the QCOM GENI SE driver.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 89 ++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>> new file mode 100644
>> index 0000000..fe6a0c0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>> @@ -0,0 +1,89 @@
>> +Qualcomm Technologies, Inc. GENI Serial Engine QUP Wrapper Controller
>> +
>> +Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
>> +is a programmable module for supporting a wide range of serial interfaces
>> +like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8 Serial
>> +Interfaces, using its internal Serial Engines. The GENI Serial Engine QUP
>> +Wrapper controller is modeled as a node with zero or more child nodes each
>> +representing a serial engine.
>> +
>> +Required properties:
>> +- compatible:		Must be "qcom,geni-se-qup".
>> +- reg:			Must contain QUP register address and length.
>> +- clock-names:		Must contain "m-ahb" and "s-ahb".
>> +- clocks:		AHB clocks needed by the device.
>> +
>> +Required properties if child node exists:
>> +- #address-cells: 	Must be <1> for Serial Engine Address
>> +- #size-cells: 		Must be <1> for Serial Engine Address Size
>> +- ranges: 		Must be present
>> +
>> +Properties for children:
>> +
>> +A GENI based QUP wrapper controller node can contain 0 or more child nodes
>> +representing serial devices.  These serial devices can be a QCOM UART, I2C
>> +controller, spi controller, or some combination of aforementioned devices.
> 
> s/spi/SPI/
> 
> Where's the SPI binding?
Since the patch series introduces UART and I2C drivers, I added the 
bindings only for them. I thought about adding the SPI binding when the 
SPI controller driver is introduced. Please let me know if you want me 
to add the bindings for SPI in this patch series itself.
> 
>> +Please refer below the child node definitions for the supported serial
>> +interface protocols.
>> +
>> +Qualcomm Technologies Inc. GENI Serial Engine based I2C Controller
>> +
>> +Required properties:
>> +- compatible:		Must be "qcom,geni-i2c".
>> +- reg: 			Must contain QUP register address and length.
>> +- interrupts: 		Must contain I2C interrupt.
>> +- clock-names: 		Must contain "se".
>> +- clocks: 		Serial engine core clock needed by the device.
>> +- #address-cells:	Must be <1> for i2c device address.
>> +- #size-cells:		Must be <0> as i2c addresses have no size component.
>> +
>> +Optional property:
>> +- clock-frequency:	Desired I2C bus clock frequency in Hz.
>> +			When missing default to 400000Hz.
>> +
>> +Child nodes should conform to i2c bus binding as described in i2c.txt.
>> +
>> +Qualcomm Technologies Inc. GENI Serial Engine based UART Controller
>> +
>> +Required properties:
>> +- compatible:		Must be "qcom,geni-debug-uart".
>> +- reg: 			Must contain UART register location and length.
>> +- interrupts: 		Must contain UART core interrupts.
>> +- clock-names:		Must contain "se".
>> +- clocks:		Serial engine core clock needed by the device.
>> +
>> +Example:
>> +	geniqup@8c0000 {
>> +		compatible = "qcom,geni-se-qup";
>> +		reg = <0x8c0000 0x6000>;
>> +		clock-names = "m-ahb", "s-ahb";
>> +		clocks = <&clock_gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>> +			<&clock_gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		i2c0: i2c@a94000 {
>> +			compatible = "qcom,geni-i2c";
>> +			reg = <0xa94000 0x4000>;
>> +			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>> +			clock-names = "se";
>> +			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S5_CLK>;
>> +			pinctrl-names = "default", "sleep";
>> +			pinctrl-0 = <&qup_1_i2c_5_active>;
>> +			pinctrl-1 = <&qup_1_i2c_5_sleep>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>> +
>> +		uart0: serial@a88000 {
>> +			compatible = "qcom,geni-debug-uart";
>> +			reg = <0xa88000 0x7000>;
>> +			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>> +			clock-names = "se";
>> +			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S0_CLK>;
>> +			pinctrl-names = "default", "sleep";
>> +			pinctrl-0 = <&qup_1_uart_3_active>;
>> +			pinctrl-1 = <&qup_1_uart_3_sleep>;
>> +		};
>> +	}
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
