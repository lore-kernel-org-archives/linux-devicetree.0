Return-Path: <SRS0=gq3n=FV=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: serial: Add bindings for GENI based
 UART Controller
References: <1515805547-22816-1-git-send-email-kramasub@codeaurora.org>
 <1515805547-22816-7-git-send-email-kramasub@codeaurora.org>
 <20180117063506.GD6620@minitux>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <3d2f323d-a447-81d0-c51d-0a935409a300@codeaurora.org>
Date: Tue, 27 Feb 2018 06:25:23 -0700
MIME-Version: 1.0
In-Reply-To: <20180117063506.GD6620@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>



On 1/16/2018 11:35 PM, Bjorn Andersson wrote:
> On Fri 12 Jan 17:05 PST 2018, Karthikeyan Ramasubramanian wrote:
> 
>> Add device tree binding support for GENI based UART Controller in the
>> QUP Wrapper.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>> ---
>>   .../devicetree/bindings/serial/qcom,geni-uart.txt  | 29 ++++++++++++++++++++++
>>   .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 13 ++++++++++
>>   2 files changed, 42 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/serial/qcom,geni-uart.txt
>>
>> diff --git a/Documentation/devicetree/bindings/serial/qcom,geni-uart.txt b/Documentation/devicetree/bindings/serial/qcom,geni-uart.txt
>> new file mode 100644
>> index 0000000..e7b9e24
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/serial/qcom,geni-uart.txt
>> @@ -0,0 +1,29 @@
>> +Qualcomm Technologies Inc. GENI Serial Engine based UART Controller
>> +
>> +The Generic Interface (GENI) Serial Engine based UART controller supports
>> +console use-cases and is supported only by GENI based Qualcomm Universal
>> +Peripheral (QUP) cores.
>> +
>> +Required properties:
>> +- compatible: should contain "qcom,geni-debug-uart".
> 
> Why is this uart a _debug_ uart? Is there a separate binding for the
> geni-uart?
Yes. It will be uploaded at a later point in time.
> 
> I like that your naming here matches my suggestion with qcom,geni-i2c.
> 
>> +- reg: Should contain UART register location and length.
>> +- reg-names: Should contain "se-phys".
> 
> No need to specify reg-names for a single reg.
Ok.
> 
>> +- interrupts: Should contain UART core interrupts.
>> +- clock-names: Should contain "se-clk".
> 
> Omit the "clk"
Ok.
> 
>> +- clocks: clocks needed for UART, includes the core clock.
> 
> Be more specific.
Ok.
> 
>> +- pinctrl-names/pinctrl-0/1: The GPIOs assigned to this core. The names
>> +  Should be "active" and "sleep" for the pin confuguration when core is active
>> +  or when entering sleep state.
> 
> Omit pinctrl information.
Ok.
> 
>> +
>> +Example:
>> +uart0: qcom,serial@a88000 {
> 
> Don't use qcom, in node name. This should be named "serial".
Ok.
> 
>> +	compatible = "qcom,geni-debug-uart";
>> +	reg = <0xa88000 0x7000>;
>> +	reg-names = "se-phys";
>> +	interrupts = <0 355 0>;
> 
> <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>
Ok.
> 
>> +	clock-names = "se-clk";
>> +	clocks = <&clock_gcc GCC_QUPV3_WRAP0_S0_CLK>;
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&qup_1_uart_3_active>;
>> +	pinctrl-1 = <&qup_1_uart_3_sleep>;
>> +};
> 
> Regards,
> Bjorn
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
