Return-Path: <SRS0=KIyI=FU=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: i2c: Add device tree bindings for
 GENI I2C Controller
References: <1515805547-22816-1-git-send-email-kramasub@codeaurora.org>
 <1515805547-22816-5-git-send-email-kramasub@codeaurora.org>
 <20180117063106.GC6620@minitux>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <4456ac2f-414e-9877-bb2d-0575405af573@codeaurora.org>
Date: Mon, 26 Feb 2018 14:28:25 -0700
MIME-Version: 1.0
In-Reply-To: <20180117063106.GC6620@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, Sagar Dharia <sdharia@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>



On 1/16/2018 11:31 PM, Bjorn Andersson wrote:
> On Fri 12 Jan 17:05 PST 2018, Karthikeyan Ramasubramanian wrote:
> 
>> Add device tree binding support for I2C Controller in GENI based
>> QUP Wrapper.
>>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> ---
>>   .../devicetree/bindings/i2c/i2c-qcom-geni.txt      | 35 ++++++++++++++++++++++
>>   .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 19 ++++++++++++
>>   2 files changed, 54 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-geni.txt
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-geni.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-geni.txt
>> new file mode 100644
>> index 0000000..ea84be7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-geni.txt
>> @@ -0,0 +1,35 @@
>> +Qualcomm Technologies Inc. GENI Serial Engine based I2C Controller
>> +
>> +Required properties:
>> + - compatible: Should be:
>> +   * "qcom,i2c-geni.
> 
> As this is a subset of geni it would look better with qcom,geni-i2c
> imho.
Ok.
> 
>> + - reg: Should contain QUP register address and length.
>> + - interrupts: Should contain I2C interrupt.
>> + - clock-names: Should contain "se-clk".
> 
> Omit "clk" from the clock names.
Ok.
> 
>> + - clocks: Serial engine core clock needed by the device.
>> + - pinctrl-names/pinctrl-0/1: The GPIOs assigned to this core. The names
>> +   should be "active" and "sleep" for the pin confuguration when core is active
>> +   or when entering sleep state.
> 
> No need to describe pinctrl properties - and your description here
> doesn't match the code.
Removed as it is called by the device core before probe.
> 
>> + - #address-cells: Should be <1> Address cells for i2c device address
>> + - #size-cells: Should be <0> as i2c addresses have no size component
>> +
>> +Optional property:
>> + - clock-frequency : Desired I2C bus clock frequency in Hz.
>> +   When missing default to 400000Hz.
>> +
>> +Child nodes should conform to i2c bus binding.
> 
> ..."as described in i2c.txt"
Ok.
> 
> Regards,
> Bjorn
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
