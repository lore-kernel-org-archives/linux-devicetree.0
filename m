From: Tirupathi Reddy T <tirupath@codeaurora.org>
Subject: Re: [PATCH V3] clk: qcom: Add spmi_pmic clock divider support
Date: Mon, 18 Sep 2017 17:00:55 +0530
Message-ID: <b1a48f0e-7a96-079e-0e68-3d89368316ba@codeaurora.org>
References: <1504699207-9568-1-git-send-email-tirupath@codeaurora.org>
 <20170913174032.u33zzo64ipk22vgp@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170913174032.u33zzo64ipk22vgp@rob-hp-laptop>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/13/2017 11:10 PM, Rob Herring wrote:
> On Wed, Sep 06, 2017 at 05:30:07PM +0530, Tirupathi Reddy wrote:
>> Clkdiv module provides a clock output on the PMIC with CXO as
>> the source. This clock can be routed through PMIC GPIOs. Add
>> a device driver to configure this clkdiv module.
>>
>> Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
>> ---
>>   .../bindings/clock/clk-spmi-pmic-div.txt           |  51 +++
>>   drivers/clk/qcom/Kconfig                           |   9 +
>>   drivers/clk/qcom/Makefile                          |   1 +
>>   drivers/clk/qcom/clk-spmi-pmic-div.c               | 342 +++++++++++++++++++++
>>   4 files changed, 403 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>>   create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>> new file mode 100644
>> index 0000000..8b84b32
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>> @@ -0,0 +1,51 @@
>> +Qualcomm Technologies, Inc. SPMI PMIC clock divider (clkdiv)
>> +
>> +clkdiv configures the clock frequency of a set of outputs on the PMIC.
>> +These clocks are typically wired through alternate functions on
>> +gpio pins.
>> +
>> +=======================
>> +Properties
>> +=======================
>> +
>> +- compatible
>> +	Usage:      required
>> +	Value type: <string>
>> +	Definition: must be one of:
>> +		    "qcom,spmi-clkdiv"
> If this is not a fallback, drop it.
Here "qcom,spmi-clkdiv" is used as generic string for registering only 
one clk and
the pmic specific strings are used for registering more than one clk 
following
the given base address in "reg" property.
>
>> +		    "qcom,pm8998-clkdiv"
>> +
>> +- reg
>> +	Usage:      required
>> +	Value type: <prop-encoded-array>
>> +	Definition: Addresses and sizes for the memory of this CLKDIV
>> +		    peripheral.
>> +
>> +- clocks:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: reference to the xo clock.
>> +
>> +- clock-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "xo".
> Missing #clock-cells
Added in next patch set.
>
>> +
>> +=======
>> +Example
>> +=======
>> +
>> +pm8998_clk_divs: qcom,clkdiv@5b00 {
> clock@5b00
Addressed in next patch.
>
>> +	compatible = "qcom,pm8998-clkdiv";
>> +	reg = <0x5b00>;
>> +	#clock-cells = <1>;
>> +	clocks = <&xo_board>;
>> +	clock-names = "xo";
>> +
>> +	assigned-clocks = <&pm8998_clk_divs 1>,
>> +			  <&pm8998_clk_divs 2>,
>> +			  <&pm8998_clk_divs 3>;
>> +	assigned-clock-rates = <9600000>,
>> +			       <9600000>,
>> +			       <9600000>;
>> +};
