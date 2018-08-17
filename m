From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add CSI2/VIN support
Date: Fri, 17 Aug 2018 14:13:55 +0300
Message-ID: <ea1ae505-d03a-6993-73f1-0ee2ad935c44@cogentembedded.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <758a8c87-272c-e861-4aab-01309cff2f84@cogentembedded.com>
 <20180809130854.65nvmnuuz6gffjjr@verge.net.au>
 <6032159b-ad2b-9a19-77f1-fc7a0ce3c5b0@cogentembedded.com>
 <20180817085109.ekvnhcuei5aexpx4@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180817085109.ekvnhcuei5aexpx4@verge.net.au>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/17/2018 11:51 AM, Simon Horman wrote:

>>>> Describe the CSI2 and VIN (and their interconnections) in the R8A77980
>>>> device tree.
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> ---
>>>> This patch is against the 'renesas-devel-20180802v2-v4.18-rc7' branch of
>>>> Simon Horman's 'renesas.git' repo.
>>>>
>>>> The R8A77980 CSI2/VIN DT binding updates have been posted earlier today...
>>>>
>>>>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |  374 ++++++++++++++++++++++++++++++
>>>>  1 file changed, 374 insertions(+)
>>>>
>>>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>>>> ===================================================================
>>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
[...]
>>>> +		csi41: csi2@feab0000 {
>>>> +			compatible = "renesas,r8a77980-csi2";
>>>> +			reg = <0 0xfeab0000 0 0x10000>;
>>>> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
>>>
>>> The use of GIC_SPI 246 for both csi40 and csi41 seems suspicious.
>>> Is this intentional?
>>
>>     No, must be copy/paste artefact... Sorry about that, it should be 241 instead.
>>
>>>> +			clocks = <&cpg CPG_MOD 716>;
>>>
>>> Should this clock be 715 rather than 716?
>>
>>    Yes, sure.
>>
>>    I'm seeing this patch merged despite your remarks. Please either fix it up or
>> pull it out!
> 
> Oops, that was not intended.
> 
> I have fixed up the patch as you suggested.
> The result is as follows:

   Still buggy... :-)

> From c703c196b847c654b392f027d3fa995e378792ac Mon Sep 17 00:00:00 2001
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Date: Mon, 6 Aug 2018 22:55:00 +0300
> Subject: [PATCH] arm64: dts: renesas: r8a77980: add CSI2/VIN support
> 
> Describe the CSI2 and VIN (and their interconnections) in the R8A77980
> device tree.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 374 ++++++++++++++++++++++++++++++
>  1 file changed, 374 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> index 4bc99d6763ce..71636fd1a819 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
[...]
> @@ -769,6 +1065,84 @@
>  			resets = <&cpg 603>;
>  		};
>  
> +		csi40: csi2@feaa0000 {
> +			compatible = "renesas,r8a77980-csi2";
> +			reg = <0 0xfeaa0000 0 0x10000>;
> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 716>;
> +			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> +			resets = <&cpg 716>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					reg = <1>;
> +
> +					csi40vin0: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&vin0csi40>;
> +					};
> +					csi40vin1: endpoint@1 {
> +						reg = <1>;
> +						remote-endpoint = <&vin1csi40>;
> +					};
> +					csi40vin2: endpoint@2 {
> +						reg = <2>;
> +						remote-endpoint = <&vin2csi40>;
> +					};
> +					csi40vin3: endpoint@3 {
> +						reg = <3>;
> +						remote-endpoint = <&vin3csi40>;
> +					};
> +				};
> +			};
> +		};
> +
> +		csi41: csi2@feab0000 {
> +			compatible = "renesas,r8a77980-csi2";
> +			reg = <0 0xfeab0000 0 0x10000>;
> +			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 715>;
> +			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> +			resets = <&cpg 716>;

   You forgot to fix up this prop...

[...]

MBR, Sergei
