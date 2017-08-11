From: Surender Polsani <surenderp-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm: boot: dts: artpec6: Remove unnecessary
 interrupt-parent property from sub-nodes
Date: Fri, 11 Aug 2017 13:26:05 +0530
Message-ID: <8475266d-de55-0760-7ae4-9fcafead36e4@techveda.org>
References: <1498565735-8208-1-git-send-email-surenderp@techveda.org>
 <d582c742-4bf9-c658-d105-572d180222a4@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d582c742-4bf9-c658-d105-572d180222a4-VrBV9hrLPhE@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>, jespern-VrBV9hrLPhE@public.gmane.org, larper-VrBV9hrLPhE@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sunil.m-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 27 June 2017 05:57 PM, Niklas Cassel wrote:
> Acked-by: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>

Hi Nik, This patch has been Acknowledged but is not getting added / 
applied to the
respective git source tree. Please let me know if there is any problem.

Thanks
Surender
>
> On 06/27/2017 02:15 PM, surenderp-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org wrote:
>> From: Surender Polsani <surenderp-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>
>>
>> "interrupt-parent" property is declared in root node, so it is global
>> to all nodes. This property is re-declared in few sub-nodes. To avoid
>> duplication this property is removed from following sub-nodes:
>> pmu, amba@0, amba@0/ethernet.
>>
>> Signed-off-by: Surender Polsani <surenderp-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/artpec6.dtsi | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
>> index 767cbe8..2ed1177 100644
>> --- a/arch/arm/boot/dts/artpec6.dtsi
>> +++ b/arch/arm/boot/dts/artpec6.dtsi
>> @@ -151,7 +151,6 @@
>>   		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>>   			<GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>>   		interrupt-affinity = <&cpu0>, <&cpu1>;
>> -		interrupt-parent = <&intc>;
>>   	};
>>   
>>   	pcie: pcie@f8050000 {
>> @@ -185,7 +184,6 @@
>>   		compatible = "simple-bus";
>>   		#address-cells = <0x1>;
>>   		#size-cells = <0x1>;
>> -		interrupt-parent = <&intc>;
>>   		ranges;
>>   		dma-ranges = <0x80000000 0x00000000 0x40000000>;
>>   		dma-coherent;
>> @@ -195,7 +193,6 @@
>>   			clocks = <&eth_phy_ref_clk>,
>>   				<&clkctrl ARTPEC6_CLK_ETH_ACLK>;
>>   			compatible = "snps,dwc-qos-ethernet-4.10";
>> -			interrupt-parent = <&intc>;
>>   			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>>   			reg = <0xf8010000 0x4000>;
>>   
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
