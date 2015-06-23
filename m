From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] clk: stm32: Add clock driver for STM32F4[23]xxx
 devices
Date: Tue, 23 Jun 2015 09:25:17 +0100
Message-ID: <558917ED.8080404@linaro.org>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org> <1433966978-24422-1-git-send-email-daniel.thompson@linaro.org> <1433966978-24422-3-git-send-email-daniel.thompson@linaro.org> <20150622232114.GK22132@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150622232114.GK22132-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/06/15 00:21, Stephen Boyd wrote:
> On 06/10, Daniel Thompson wrote:
>> The driver supports decoding and statically modelling PLL state (i.e.
>> we inherit state from bootloader) and provides support for all
>> peripherals that support simple one-bit gated clocks. The covers all
>> peripherals whose clocks come from the AHB, APB1 or APB2 buses.
>>
>> It has been tested on an STM32F429I-Discovery board. The clock counts
>> for TIM2, USART1 and SYSTICK are all set correctly and the wall clock
>> looks OK when checked with a stopwatch. I have also tested a prototype
>> driver for the RNG hardware. The RNG clock is correctly enabled by the
>> framework (also did inverse test and proved that by changing DT to
>> configure the wrong clock bit then we observe the RNG driver to fail).
>>
>> Signed-off-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> I also squashed in some sparse fixes. Please check.

That was extremely generous! Thanks.

The changes all eyeball OK but I'll double check things tonight just in 
case.


Daniel.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
