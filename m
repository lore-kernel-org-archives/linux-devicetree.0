From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: interconnect: qcs404: Introduce
 qcom,qos DT property
Date: Thu, 23 May 2019 18:58:47 +0300
Message-ID: <a507a79e-e4da-4129-f52b-8db9927dc2a4@linaro.org>
References: <20190415104357.5305-1-georgi.djakov@linaro.org>
 <20190415104357.5305-5-georgi.djakov@linaro.org>
 <20190418225150.GN27005@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418225150.GN27005@builder>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt@kernel.org
Cc: vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn and Rob,

On 4/19/19 01:51, Bjorn Andersson wrote:
> On Mon 15 Apr 03:43 PDT 2019, Georgi Djakov wrote:
> 
>> There are separate hardware blocks per each interconnect that allow QoS
>> configuration to be applied to each port (node). There are different kinds of
>> priorities that could be set on these ports. Each port supports also various
>> QoS modes such as "fixed", "limiter", "bypass" and "regulator". Depending on
>> the mode, there are a few additional knobs that could be configured.
>>
>> Introduce the qcom,qos property, so that we describe this relation in DT and
>> allow the interconnect provider drivers can make use of it.
>>
> 
> As the example shows we will end up with two nodes describing the same
> hardware with pretty much identical set of properties.

I am still split and hesitant about what would be the best way to represent this
in DT and it would be nice to reach some conclusion.

So the idea is that the QoS driver could be a standalone driver that does some
static QoS configuration. The clocks i have listed in the example below are not
the same, sorry. We should list there some of the interface clocks that need to
be enabled before configuring the port priorities instead. For example USB or
UFS axi clock and not the NoC clocks.

This makes the DT properties of the two nodes different. Оn one side we collect
bandwidth requests and send them to the remote processor (RPM) and each NoC is
represented in DT as child of RPM (like the rpm controlled regulators and
clocks). On the other side we also have the mmio registers for configuring port
priorities that may fit in DT under soc {} with their mmio registers and a list
of iface clocks.

> I really do think it's better to represent and implement the NoC
> controllers on the mmio/platform bus and have a small "proxy" as a child
> of the RPM.
>
> By doing this you avoid the duplication of the clock properties and you
> don't need the qcom,qos reference to pair up each "bus performance
> driver" to the "bus qos driver".

The clock properties would contain different set of clocks - NoC clocks for the
DT nodes in rpm {} and the iface clocks for the QoS DT nodes in soc {}.

> And you still maintain the idea that the entity you request bandwidth
> votes with are the NoC controller (which also will be the QoS
> controller).

I assume that the entities are the NoC controllers that we talk to through the RPM.

Thanks,
Georgi

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
>>
>> v2:
>> - New patch.
>>
>>  .../bindings/interconnect/qcom,qcs404.txt     | 31 +++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
>> index 9befcd14a5b5..b971e0ee2963 100644
>> --- a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
>> @@ -11,9 +11,37 @@ Required properties :
>>  Optional properties :
>>  clocks : list of phandles and specifiers to all interconnect bus clocks
>>  clock-names : clock names should include both "bus_clk" and "bus_a_clk"
>> +qcom,qos : phandle to the QoS device-tree node
>>  
>>  Example:
>>  
>> +soc {
>> +	...
>> +	bimc_qos: interconnect@400000 {
>> +		compatible = "qcom,qcs404-bimc-qos";
>> +		reg = <0x400000 0x80000>;
>> +		clock-names = "bus_clk", "bus_a_clk";
>> +		clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
>> +			<&rpmcc RPM_SMD_BIMC_A_CLK>;
>> +	};
>> +
>> +	pcnoc_qos: interconnect@500000 {
>> +		compatible = "qcom,qcs404-pcnoc-qos";
>> +		reg = <0x500000 0x15080>;
>> +		clock-names = "bus_clk", "bus_a_clk";
>> +		clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
>> +			<&rpmcc RPM_SMD_PNOC_A_CLK>;
>> +	};
>> +
>> +	snoc_qos: interconnect@580000 {
>> +		compatible = "qcom,qcs404-snoc-qos";
>> +		reg = <0x580000 0x14000>;
>> +		clock-names = "bus_clk", "bus_a_clk";
>> +		clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
>> +			<&rpmcc RPM_SMD_SNOC_A_CLK>;
>> +	};
>> +};
>> +
>>  rpm-glink {
>>  	...
>>  	rpm_requests: glink-channel {
>> @@ -24,6 +52,7 @@ rpm-glink {
>>  			clock-names = "bus_clk", "bus_a_clk";
>>  			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
>>  				<&rpmcc RPM_SMD_BIMC_A_CLK>;
>> +			qcom,qos = <&bimc_qos>;
>>  		};
>>  
>>  		pnoc: interconnect@1 {
>> @@ -32,6 +61,7 @@ rpm-glink {
>>  			clock-names = "bus_clk", "bus_a_clk";
>>  			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
>>  				<&rpmcc RPM_SMD_PNOC_A_CLK>;
>> +			qcom,qos = <&pcnoc_qos>;
>>  		};
>>  
>>  		snoc: interconnect@2 {
>> @@ -40,6 +70,7 @@ rpm-glink {
>>  			clock-names = "bus_clk", "bus_a_clk";
>>  			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
>>  				<&rpmcc RPM_SMD_SNOC_A_CLK>;
>> +			qcom,qos = <&snoc_qos>;
>>  		};
>>  	};
>>  };
