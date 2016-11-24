From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] dmaengine: allow sun6i-dma for more SoCs
Date: Thu, 24 Nov 2016 09:16:28 +0000
Message-ID: <34b5e50f-a091-9bd8-7a74-96e538a7351d@arm.com>
References: <1479950235-26821-1-git-send-email-andre.przywara@arm.com>
 <1479950235-26821-3-git-send-email-andre.przywara@arm.com>
 <CAGb2v67M8DrPaf8GzSPEjekgV6cLcXXzO3tVUc9kjUDcM3BE_w@mail.gmail.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBSG73LAQKGQE72W4MSA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67M8DrPaf8GzSPEjekgV6cLcXXzO3tVUc9kjUDcM3BE_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 24/11/16 04:16, Chen-Yu Tsai wrote:
> Hi,
> 
> On Thu, Nov 24, 2016 at 9:17 AM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
>> The sun6i DMA driver is used in the Allwinner A64 and H5 SoC, which
>> have arm64 capable cores. Add the generic sunxi config symbol to allow
>> the driver to be selected by arm64 Kconfigs, which don't feature
>> SoC specific MACH_xxxx configs.
>>
>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  drivers/dma/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
>> index af63a6b..003c284 100644
>> --- a/drivers/dma/Kconfig
>> +++ b/drivers/dma/Kconfig
>> @@ -157,7 +157,7 @@ config DMA_SUN4I
>>
>>  config DMA_SUN6I
>>         tristate "Allwinner A31 SoCs DMA support"
>> -       depends on MACH_SUN6I || MACH_SUN8I || COMPILE_TEST
>> +       depends on MACH_SUN6I || MACH_SUN8I || COMPILE_TEST || ARCH_SUNXI
> 
> AFAIK ARCH_SUNXI encompasses/supersedes MACH_SUN*I.
> (And I don't have to add MACH_SUN9I later :) )

Sure, admittedly it was just a quick hack to get things going.
Actually I don't know why we had a *depend* on those MACH_s before. I
think technically it does not depend on a certain SoC (having the
COMPILE_TEST in there hints on that). So what about:

	depends on ARCH_SUNXI || COMPILE_TEST

and maybe:

	default y if MACH_SUN6I || MACH_SUN8I

Though I see that both multi_v7_defconfig and sunxi_defconfig explicitly
set this, so this wouldn't be needed?

Cheers,
Andre.
