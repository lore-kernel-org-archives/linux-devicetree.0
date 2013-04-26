From: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] of: Set the DMA mask to 64 bits when dma_addr_t is
 64-bits
Date: Fri, 26 Apr 2013 13:14:49 -0700
Message-ID: <517AE039.8070804@codeaurora.org>
References: <1366999565-19498-1-git-send-email-lauraa@codeaurora.org>
 <517ADDA9.7020701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <517ADDA9.7020701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4/26/2013 1:03 PM, Rob Herring wrote:
> On 04/26/2013 01:06 PM, Laura Abbott wrote:
>> Currently, of_platform_device_create_pdata always sets the
>> coherent DMA mask to 32 bits. On ARM systems without CONFIG_ZONE_DMA,
>> arm_dma_limit gets set to ~0 or 0xFFFFFFFFFFFFFFFF on LPAE based
>> systems. Since arm_dma_limit represents the smallest dma_mask
>> on the system, the default of 32 bits prevents any dma_coherent
>> allocation from succeeding unless clients manually set the
>> dma mask first. Rather than make every client on an LPAE system set
>> the mask, set the mask to a 64 bit value on systems with 64-bit
>> dma addresses.
>>
>> Signed-off-by: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   drivers/of/platform.c |    4 ++++
>>   1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 0970505..c669ab4 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -214,7 +214,11 @@ struct platform_device *of_platform_device_create_pdata(
>>   #if defined(CONFIG_MICROBLAZE)
>>   	dev->archdata.dma_mask = 0xffffffffUL;
>>   #endif
>> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>> +	dev->dev.coherent_dma_mask = DMA_BIT_MASK(64);
>> +#else
>>   	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>> +#endif
>
> How about "DMA_BIT_MASK(sizeof(dma_addr_t) * 8))" and avoid the ifdef.
>

Sounds good.


> Rob
>

Thanks,
Laura

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
