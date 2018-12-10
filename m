From: Faiz Abbas <faiz_abbas@ti.com>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am654: Add Support for MMC/SD
Date: Mon, 10 Dec 2018 19:00:34 +0530
Message-ID: <044fa725-9b6d-e331-ee10-664e59128e64@ti.com>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
 <20181207084233.13700-2-faiz_abbas@ti.com>
 <a6aacd53-e1c4-fce0-7712-f276c80bbffc@ti.com>
 <20181208154526.ivbvwvcx6otg7lvh@akan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181208154526.ivbvwvcx6otg7lvh@akan>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Vignesh R <vigneshr@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, adrian.hunter@intel.com, t-kristo@ti.com, robh+dt@kernel.org, kishon@ti.com, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Nishanth,

On 08/12/18 9:15 PM, Nishanth Menon wrote:
> On 10:56-20181208, Vignesh R wrote:
>>
>>
>> On 07/12/18 2:12 PM, Faiz Abbas wrote:
>>> There are two MMC host controller instances present on the TI's
>>> Am654 SOCs. Add device tree nodes for the same.
>>>
>>> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
>>> ---
>>>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 28 ++++++++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>>> index 916434839603..d07212f16a81 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>>> @@ -129,4 +129,32 @@
>>>  		clocks = <&k3_clks 113 1>;
>>>  		power-domains = <&k3_pds 113>;
>>>  	};
>>> +
>>> +	sdhci0: sdhci@4f80000 {
>>> +		compatible = "ti,am654-sdhci-5.1";
>>> +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
>>> +		power-domains = <&k3_pds 47>;
>>> +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
>>> +		clock-names = "clk_ahb", "clk_xin";
>>> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
>>> +		sdhci-caps-mask = <0x80000007 0x0>;
>>> +		mmc-ddr-1_8v;
>>> +		ti,otap-del-sel = <0x2>;
>>> +		ti,trm-icp = <0x8>;
>>> +		status = "disabled";
>>> +	};
>>
>> Please drop "status=disabled" from dtsi. Can be disabled as required in
>> the board dts.
> 
> 
> yes - the standard in k3 is to disable the nodes that are'nt needed in
> board.dtsi.
> 
> This is different from "disabled by default" approach in DRA7 or OMAP4
> for example.
> 

Ok. Will fix in v2.

Thanks,
Faiz
