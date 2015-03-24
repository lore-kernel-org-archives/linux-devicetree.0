From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/3] powerpc/mpc85xx: Add FMan clock nodes
Date: Tue, 24 Mar 2015 03:26:52 -0500
Message-ID: <55111FCC.2000806@Freescale.com>
References: <1424964417-13760-1-git-send-email-Emilian.Medve@Freescale.com>
 <1427153449.22867.19.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427153449.22867.19.camel-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afleming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Igal Liberman <Igal.Liberman-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Scott,


On 03/23/2015 06:30 PM, Scott Wood wrote:
> On Thu, 2015-02-26 at 09:26 -0600, Emil Medve wrote:
>> From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>
>> Signed-off-by: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>>  arch/powerpc/boot/dts/fsl/b4si-post.dtsi    | 11 +++++++++++
>>  arch/powerpc/boot/dts/fsl/p2041si-post.dtsi |  8 ++++++++
>>  arch/powerpc/boot/dts/fsl/p3041si-post.dtsi |  8 ++++++++
>>  arch/powerpc/boot/dts/fsl/p4080si-post.dtsi | 16 ++++++++++++++++
>>  arch/powerpc/boot/dts/fsl/p5020si-post.dtsi | 13 +++++++++++++
>>  arch/powerpc/boot/dts/fsl/p5040si-post.dtsi | 26 ++++++++++++++++++++++++++
>>  arch/powerpc/boot/dts/fsl/t1040si-post.dtsi |  8 ++++++++
>>  arch/powerpc/boot/dts/fsl/t2081si-post.dtsi | 11 +++++++++++
>>  arch/powerpc/boot/dts/fsl/t4240si-post.dtsi | 20 ++++++++++++++++++++
>>  9 files changed, 121 insertions(+)
>>
>> diff --git a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
>> index f8c325e..38621ef 100644
>> --- a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
>> +++ b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
>> @@ -395,6 +395,17 @@
>>  		reg = <0xe0000 0xe00>;
>>  		fsl,has-rstcr;
>>  		fsl,liodn-bits = <12>;
>> +
>> +		fm0clk: fm0-clk-mux {
>> +			#clock-cells = <0>;
>> +			compatible = "fsl,fman-clk-mux";
>> +			clocks = <&pll0 0>, <&pll0 1>, <&pll0 2>, <&pll0 3>,
>> +				 <&platform_pll 0>, <&pll1 1>, <&pll1 2>;
>> +			clock-names = "pll0", "pll0-div2", "pll0-div3",
>> +				      "pll0-div4", "platform-pll", "pll1-div2",
>> +				      "pll1-div3";
>> +			clock-output-names = "fm0-clk";
>> +		};
> 
> Where's the binding for fsl,fman-clk-mux?
> 

Igal will follow-up with the binding document


Cheers,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
