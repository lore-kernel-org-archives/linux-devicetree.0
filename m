From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: Document the STM32F4 clock bindings
Date: Mon, 01 Jun 2015 08:46:59 +0100
Message-ID: <556C0DF3.7050603@linaro.org>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org> <1432972448-10332-1-git-send-email-daniel.thompson@linaro.org> <1432972448-10332-3-git-send-email-daniel.thompson@linaro.org> <55698104.2070205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55698104.2070205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30/05/15 10:21, Maxime Coquelin wrote:
> HI Daniel,
>
> On 05/30/2015 09:54 AM, Daniel Thompson wrote:
>> This adds documentation of device tree bindings for the clock related
>> portions of the STM32 RCC block.
>>
>> Signed-off-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   .../devicetree/bindings/clock/st,stm32-rcc.txt     | 65
>> ++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>> <snip>
>> +Example:
>> +
>> +    /* Gated clock, AHB1 bit 0 (GPIOA) */
>> +    ... {
>> +        clocks = <&rcc 0 0>
>> +    };
>> +
>> +    /* Gated clock, AHB2 bit 4 (GPIOA) */
> s/GPIOA/CRYP/

Oops! Will fix.


>> +    ... {
>> +        clocks = <&rcc 0 36>
>> +    };
>> +
>> +Specifying other clocks
>> +=======================
>> +
>> +The primary index must be set to 1.
>> +
>> +The secondary index is bound with the following magic numbers:
>> +
>> +    0    SYSTICK
>> +    1    FCLK
> How do you plan to handle the SAI & I2S clocks?
> By adding index 3?

Pretty much. Tentatively I'm thinking of:

	2	I2S clocks
	3	SAI1_A clock
	4	SAI1_B clock
	5	LCD-TFT clock

Note: Sort order is based on the vertical ordering in the clock tree 
diagram in the data sheet.

Only reason not to include these in the bindings immediately is that I 
wanted to check how/if these clocks are gated. The clock tree diagram 
shows them having individual clock gates so before proposing them using 
magic numbers I wanted to double check if these values can be identified 
at gates clocks.


Daniel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
