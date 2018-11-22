From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: clock: Introduce QCOM LPASS clock
 bindings
Date: Thu, 22 Nov 2018 13:22:44 +0530
Message-ID: <a341cbcd-b5e1-35f2-6f80-1de3ccc66d72@codeaurora.org>
References: <1541814256-23254-1-git-send-email-tdas@codeaurora.org>
 <1541814256-23254-2-git-send-email-tdas@codeaurora.org>
 <20181113001952.GA2556@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113001952.GA2556@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 11/13/2018 5:49 AM, Rob Herring wrote:
> On Sat, Nov 10, 2018 at 07:14:15AM +0530, Taniya Das wrote:
>> Add device tree bindings for Low Power Audio subsystem clock controller for
>> Qualcomm Technology Inc's SDM845 SoCs.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,gcc.txt         | 16 +++++++++++++
> 
> Seems like a separate change?
> 

Sure, would spilt it in the next patch.

>>   .../devicetree/bindings/clock/qcom,lpasscc.txt     | 26 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,gcc-sdm845.h        |  2 ++
>>   include/dt-bindings/clock/qcom,lpass-sdm845.h      | 16 +++++++++++++
>>   4 files changed, 60 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
>>   create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> index 52d9345..8661c3c 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> @@ -35,6 +35,8 @@ be part of GCC and hence the TSENS properties can also be
>>   part of the GCC/clock-controller node.
>>   For more details on the TSENS properties please refer
>>   Documentation/devicetree/bindings/thermal/qcom-tsens.txt
>> +- protected-clocks : Protected clock specifier list as per common clock
>> + binding.
>>
>>   Example:
>>   	clock-controller@900000 {
>> @@ -55,3 +57,17 @@ Example of GCC with TSENS properties:
>>   		#reset-cells = <1>;
>>   		#thermal-sensor-cells = <1>;
>>   	};
>> +
>> +Example of GCC with protected-clocks properties:
>> +	clock-controller@100000 {
>> +		compatible = "qcom,gcc-sdm845";
>> +		reg = <0x100000 0x1f0000>;
>> +		#clock-cells = <1>;
>> +		#reset-cells = <1>;
>> +		#power-domain-cells = <1>;
>> +		protected-clocks = <GCC_QSPI_CORE_CLK>,
>> +				   <GCC_QSPI_CORE_CLK_SRC>,
>> +				   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>> +				   <GCC_LPASS_Q6_AXI_CLK>,
>> +				   <GCC_LPASS_SWAY_CLK>;
>> +	};
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
>> new file mode 100644
>> index 0000000..b9e9787
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
>> @@ -0,0 +1,26 @@
>> +Qualcomm LPASS Clock Controller Binding
>> +-----------------------------------------------
>> +
>> +Required properties :
>> +- compatible		: shall contain "qcom,sdm845-lpasscc"
>> +- #clock-cells		: from common clock binding, shall contain 1.
>> +- reg			: shall contain base register address and size,
>> +			  in the order
>> +			Index-0 maps to LPASS_CC register region
>> +			Index-1 maps to LPASS_QDSP6SS register region
> 
> No input clocks?
> 

There are no input clocks required.

>> +
>> +Optional properties :
>> +- reg-names	: register names of LPASS domain
>> +		 "cc", "qdsp6ss".
>> +
>> +Example:
>> +
>> +The below node has to be defined in the cases where the LPASS peripheral loader
>> +would bring the subsystem out of reset.
>> +
>> +	lpasscc: clock-controller@17014000 {
>> +		compatible = "qcom,sdm845-lpasscc";
>> +		reg = <0x17014000 0x1f004>, <0x17300000 0x200>;
>> +		reg-names = "cc", "qdsp6ss";
>> +		#clock-cells = <1>;
>> +	};
>> diff --git a/include/dt-bindings/clock/qcom,gcc-sdm845.h b/include/dt-bindings/clock/qcom,gcc-sdm845.h
>> index b8eae5a..968fa65 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-sdm845.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-sdm845.h
>> @@ -197,6 +197,8 @@
>>   #define GCC_QSPI_CORE_CLK_SRC					187
>>   #define GCC_QSPI_CORE_CLK					188
>>   #define GCC_QSPI_CNOC_PERIPH_AHB_CLK				189
>> +#define GCC_LPASS_Q6_AXI_CLK					190
>> +#define GCC_LPASS_SWAY_CLK					191
>>
>>   /* GCC Resets */
>>   #define GCC_MMSS_BCR						0
>> diff --git a/include/dt-bindings/clock/qcom,lpass-sdm845.h b/include/dt-bindings/clock/qcom,lpass-sdm845.h
>> new file mode 100644
>> index 0000000..015968e
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,lpass-sdm845.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
>> +#define _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
>> +
>> +#define LPASS_AUDIO_WRAPPER_AON_CLK			0
>> +#define LPASS_Q6SS_AHBM_AON_CLK				1
>> +#define LPASS_Q6SS_AHBS_AON_CLK				2
>> +#define LPASS_QDSP6SS_XO_CLK				3
>> +#define LPASS_QDSP6SS_SLEEP_CLK				4
>> +#define LPASS_QDSP6SS_CORE_CLK				5
>> +
>> +#endif
>> --
>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>> of the Code Aurora Forum, hosted by the  Linux Foundation.
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
