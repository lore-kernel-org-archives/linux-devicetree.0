From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 12/19] clk: at91: add peripheral clk macros for peripheral
 clk dt bindings
Date: Tue, 8 Oct 2013 18:15:17 +0200
Message-ID: <52542F95.5050603@atmel.com>
References: <1375937608-3773-1-git-send-email-b.brezillon@overkiz.com> <1375945839-9573-1-git-send-email-b.brezillon@overkiz.com> <52542878.5050503@atmel.com> <52542C4C.5080409@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52542C4C.5080409-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/10/2013 18:01, boris brezillon :
> On 08/10/2013 17:44, Nicolas Ferre wrote:
>> On 08/08/2013 09:10, Boris BREZILLON :
>>> This patch adds the peripheral divisors macros (for sam9x5 compatible
>>> IPs)
>>> which will be used by peripheral clk dt definitions.
>>
>> I am in favor for these definitions. So let's keep them (with raw
>> numbers toguether with these macros in documentation).
>
> I guess we should move them elsewhere if these are the only macros we keep.
>
> What about "include/dt-bindings/clk/at91sam9x5-periph.h" ?

Well, what about a more generic clk binding file for all at91-related 
definitions (if more come). We can still differentiate among devices 
into the file itself...

What do you think about:
include/dt-bindings/clk/at91.h
is it too generic?

BTW, I see the clk and clock directories. What is the difference?


>>> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>    .../clk/at91/at91sam9x5/clk-peripheral.h           |   15
>>> +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>    create mode 100644
>>> include/dt-bindings/clk/at91/at91sam9x5/clk-peripheral.h
>>>
>>> diff --git a/include/dt-bindings/clk/at91/at91sam9x5/clk-peripheral.h
>>> b/include/dt-bindings/clk/at91/at91sam9x5/clk-peripheral.h
>>> new file mode 100644
>>> index 0000000..a6dd506
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clk/at91/at91sam9x5/clk-peripheral.h
>>> @@ -0,0 +1,15 @@
>>> +/*
>>> + * This header provides constants for AT91 peripheral clks.
>>> + *
>>> + * The constants defined in this header are being used in dts.
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLK_AT91SAM9X5_PERIPH_H
>>> +#define _DT_BINDINGS_CLK_AT91SAM9X5_PERIPH_H
>>> +
>>> +#define AT91SAM9X5_PERIPH_CLK_DIV1    0
>>> +#define AT91SAM9X5_PERIPH_CLK_DIV2    1
>>> +#define AT91SAM9X5_PERIPH_CLK_DIV4    2
>>> +#define AT91SAM9X5_PERIPH_CLK_DIV8    3
>>> +
>>> +#endif
>>>
>>
>>
>
>
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
