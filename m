From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 18/20] dt-bindings: qcom_nandc: IPQ8074 QPIC NAND
 documentation
Date: Fri, 11 Aug 2017 14:32:05 +0530
Message-ID: <fa0864288be56f747b63396f46deb482@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
 <1501949998-29859-19-git-send-email-absahu@codeaurora.org>
 <20170810203009.sree54ddecbnymep@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810203009.sree54ddecbnymep@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-08-11 02:00, Rob Herring wrote:
> On Sat, Aug 05, 2017 at 09:49:56PM +0530, Abhishek Sahu wrote:
>> Qualcom IPQ8074 SoC uses QPIC NAND controller version 1.5.0
>> which uses BAM DMA Engine.
>> 
>> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt 
>> b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> index d93b952..8dfa543 100644
>> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> @@ -6,6 +6,8 @@ Required properties:
>>  			    SoC and it uses ADM DMA
>>      * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being 
>> used in
>>                              IPQ4019 SoC and it uses BAM DMA
>> +    * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being 
>> used in
>> +                            IPQ8074 SoC and it uses BAM DMA
>> 
>>  - reg:			MMIO address range
>>  - clocks:		must contain core clock and always on clock
>> @@ -97,7 +99,7 @@ nand-controller@1ac00000 {
>>  };
>> 
>>  nand-controller@79b0000 {
>> -	compatible = "qcom,ipq4019-nand";
>> +	compatible = "qcom,ipq4019-nand", "qcom,ipq8074-nand";
> 
> The order here should be reversed as 8074 is the newer one. And if 4019
> is the fallback compatible, that needs to be documented above.
> 

  Thanks Rob for review.

  This is not fallback compatible. I checked the other device tree
  binding examples and it seems, we don't have to add every
  similar compatible string in example. I will remove the
  qcom,ipq8074-nand from example which is causing confusion.

> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
