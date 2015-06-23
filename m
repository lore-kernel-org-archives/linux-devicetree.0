From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/3] clk: stm32: Add clock driver for STM32F4[23]xxx
 devices
Date: Tue, 23 Jun 2015 09:22:01 +0100
Message-ID: <55891729.7070809@linaro.org>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org> <1433966978-24422-1-git-send-email-daniel.thompson@linaro.org> <20150622224832.GI22132@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150622224832.GI22132-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/06/15 23:48, Stephen Boyd wrote:
> On 06/10, Daniel Thompson wrote:
>> This patchset implements a clock driver for STM32F42xxx and STM32F43xxx
>> series devices. It supports decoding the state configured by the
>> bootloader (PLL, clock select, bus dividers) and all the gates clocks.
>> It does not currently support the I2S and SAI PLLs.
>>
>> Relies on "Add support to STMicroeletronics STM32 family" v9 by Maxime
>> Coquelin: http://thread.gmane.org/gmane.linux.kernel/1961049 .
>>
>
> I applied 1 and 2. Looks like #3 should go through arm-soc at
> some later time?

Agreed (that is also the patch that must be correctly ordered w.r.t. 
Maxime's patches).


Thanks.

Daniel.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
