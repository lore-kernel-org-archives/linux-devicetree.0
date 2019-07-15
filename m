From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: interconnect: Add Qualcomm QCS404 DT
 bindings
Date: Mon, 15 Jul 2019 16:56:03 +0300
Message-ID: <70982f11-792e-6c02-056d-47582708be4f@linaro.org>
References: <20190613151323.10850-1-georgi.djakov@linaro.org>
 <20190613151323.10850-2-georgi.djakov@linaro.org>
 <20190708192612.GE30636@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708192612.GE30636@minitux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh+dt@kernel.org, agross@kernel.org, vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 7/8/19 22:26, Bjorn Andersson wrote:
> On Thu 13 Jun 08:13 PDT 2019, Georgi Djakov wrote:
> 
>> The Qualcomm QCS404 platform has several buses that could be controlled
>> and tuned according to the bandwidth demand.
>>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
>>
>> v4:
>> - Add the DT header into this patch.
>> - Pick Bjorn's r-b.
>>
>> v3:
>> - Add a reg property and move the interconnect nodes under the "soc" node.
>>
>> v2:
>> - No changes.
>>
>>  .../bindings/interconnect/qcom,qcs404.txt     | 46 ++++++++++
>>  .../dt-bindings/interconnect/qcom,qcs404.h    | 88 +++++++++++++++++++
>>  2 files changed, 134 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
>>  create mode 100644 include/dt-bindings/interconnect/qcom,qcs404.h
>>
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
>> new file mode 100644
>> index 000000000000..14a827268dda
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
>> @@ -0,0 +1,46 @@
>> +Qualcomm QCS404 Network-On-Chip interconnect driver binding
>> +-----------------------------------------------------------
>> +
>> +Required properties :
>> +- compatible : shall contain only one of the following:
>> +			"qcom,qcs404-bimc"
>> +			"qcom,qcs404-pcnoc"
>> +			"qcom,qcs404-snoc"
>> +- #interconnect-cells : should contain 1
>> +
>> +Optional properties :
>> +reg : specifies the physical base address and size of registers
>> +clocks : list of phandles and specifiers to all interconnect bus clocks
>> +clock-names : clock names should include both "bus_clk" and "bus_a_clk"
> 
> Spoke to Rob about this patch, and I don't think these properties should
> not be described as optional.
> 
> The reg isn't used unless we're implementing support for QoS, but let's
> include them in the binding as required anyways.

Ok, will do it!

> 
> Iirc the two clocks are required with the current implementation, but
> shouldn't there be an iface clock as well, for accessing the QoS
> register space?

Actually i expect this to be a list of AXI clocks of the IP blocks, whose QoS
ports we configure. For this platform, according to downstream, it would be just
<&gcc GCC_SYS_NOC_USB3_CLK>. For other platforms i see these are a few usb/ufs
clocks that should be enabled while we set QoS for usb/ufs.

> 
> PS. As I read this again, please drop _clk from the two clocks names -
> we know they are clocks...

Sure, will do it!

Thanks,
Georgi

> 
> Regards,
> Bjorn
> 
>> +
>> +Example:
>> +
>> +soc {
>> +	...
>> +	bimc: interconnect@400000 {
>> +		reg = <0x00400000 0x80000>;
>> +		compatible = "qcom,qcs404-bimc";
>> +		#interconnect-cells = <1>;
>> +		clock-names = "bus_clk", "bus_a_clk";
>> +		clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
>> +			<&rpmcc RPM_SMD_BIMC_A_CLK>;
>> +	};
>> +
>> +	pnoc: interconnect@500000 {
>> +		reg = <0x00500000 0x15080>;
>> +		compatible = "qcom,qcs404-pcnoc";
>> +		#interconnect-cells = <1>;
>> +		clock-names = "bus_clk", "bus_a_clk";
>> +		clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
>> +			<&rpmcc RPM_SMD_PNOC_A_CLK>;
>> +	};
>> +
>> +	snoc: interconnect@580000 {
>> +		reg = <0x00580000 0x23080>;
>> +		compatible = "qcom,qcs404-snoc";
>> +		#interconnect-cells = <1>;
>> +		clock-names = "bus_clk", "bus_a_clk";
>> +		clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
>> +			<&rpmcc RPM_SMD_SNOC_A_CLK>;
>> +	};
>> +};
>> diff --git a/include/dt-bindings/interconnect/qcom,qcs404.h b/include/dt-bindings/interconnect/qcom,qcs404.h
>> new file mode 100644
>> index 000000000000..960f6e39c5f2
>> --- /dev/null
>> +++ b/include/dt-bindings/interconnect/qcom,qcs404.h
>> @@ -0,0 +1,88 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Qualcomm interconnect IDs
>> + *
>> + * Copyright (c) 2019, Linaro Ltd.
>> + * Author: Georgi Djakov <georgi.djakov@linaro.org>
>> + */
>> +
>> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_QCS404_H
>> +#define __DT_BINDINGS_INTERCONNECT_QCOM_QCS404_H
>> +
>> +#define MASTER_AMPSS_M0			0
>> +#define MASTER_OXILI			1
>> +#define MASTER_MDP_PORT0		2
>> +#define MASTER_SNOC_BIMC_1		3
>> +#define MASTER_TCU_0			4
>> +#define SLAVE_EBI_CH0			5
>> +#define SLAVE_BIMC_SNOC			6
>> +
>> +#define MASTER_SPDM			0
>> +#define MASTER_BLSP_1			1
>> +#define MASTER_BLSP_2			2
>> +#define MASTER_XI_USB_HS1		3
>> +#define MASTER_CRYPT0			4
>> +#define MASTER_SDCC_1			5
>> +#define MASTER_SDCC_2			6
>> +#define MASTER_SNOC_PCNOC		7
>> +#define MASTER_QPIC			8
>> +#define PCNOC_INT_0			9
>> +#define PCNOC_INT_2			10
>> +#define PCNOC_INT_3			11
>> +#define PCNOC_S_0			12
>> +#define PCNOC_S_1			13
>> +#define PCNOC_S_2			14
>> +#define PCNOC_S_3			15
>> +#define PCNOC_S_4			16
>> +#define PCNOC_S_6			17
>> +#define PCNOC_S_7			18
>> +#define PCNOC_S_8			19
>> +#define PCNOC_S_9			20
>> +#define PCNOC_S_10			21
>> +#define PCNOC_S_11			22
>> +#define SLAVE_SPDM			23
>> +#define SLAVE_PDM			24
>> +#define SLAVE_PRNG			25
>> +#define SLAVE_TCSR			26
>> +#define SLAVE_SNOC_CFG			27
>> +#define SLAVE_MESSAGE_RAM		28
>> +#define SLAVE_DISP_SS_CFG		29
>> +#define SLAVE_GPU_CFG			30
>> +#define SLAVE_BLSP_1			31
>> +#define SLAVE_BLSP_2			32
>> +#define SLAVE_TLMM_NORTH		33
>> +#define SLAVE_PCIE			34
>> +#define SLAVE_ETHERNET			35
>> +#define SLAVE_TLMM_EAST			36
>> +#define SLAVE_TCU			37
>> +#define SLAVE_PMIC_ARB			38
>> +#define SLAVE_SDCC_1			39
>> +#define SLAVE_SDCC_2			40
>> +#define SLAVE_TLMM_SOUTH		41
>> +#define SLAVE_USB_HS			42
>> +#define SLAVE_USB3			43
>> +#define SLAVE_CRYPTO_0_CFG		44
>> +#define SLAVE_PCNOC_SNOC		45
>> +
>> +#define MASTER_QDSS_BAM			0
>> +#define MASTER_BIMC_SNOC		1
>> +#define MASTER_PCNOC_SNOC		2
>> +#define MASTER_QDSS_ETR			3
>> +#define MASTER_EMAC			4
>> +#define MASTER_PCIE			5
>> +#define MASTER_USB3			6
>> +#define QDSS_INT			7
>> +#define SNOC_INT_0			8
>> +#define SNOC_INT_1			9
>> +#define SNOC_INT_2			10
>> +#define SLAVE_KPSS_AHB			11
>> +#define SLAVE_WCSS			12
>> +#define SLAVE_SNOC_BIMC_1		13
>> +#define SLAVE_IMEM			14
>> +#define SLAVE_SNOC_PCNOC		15
>> +#define SLAVE_QDSS_STM			16
>> +#define SLAVE_CATS_0			17
>> +#define SLAVE_CATS_1			18
>> +#define SLAVE_LPASS			19
>> +
>> +#endif
