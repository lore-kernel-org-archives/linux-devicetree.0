From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 04/19] clk: at91: add PMC macro file for dt definitions
Date: Mon, 07 Oct 2013 18:06:33 +0200
Message-ID: <5252DC09.6010207@overkiz.com>
References: <1375937608-3773-1-git-send-email-b.brezillon@overkiz.com> <1375938270-3965-1-git-send-email-b.brezillon@overkiz.com> <5252D0A5.60304@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5252D0A5.60304-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/10/2013 17:17, Nicolas Ferre wrote:
> On 08/08/2013 07:04, Boris BREZILLON :
>> This patch adds a new macro file for PMC macros.
>>
>> This macro file includes the definitions of SR (status register) bit
>> offsets and will be use to reference PMC irqs.
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   include/dt-bindings/clk/at91/common/pmc.h |   20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>   create mode 100644 include/dt-bindings/clk/at91/common/pmc.h
>>
>> diff --git a/include/dt-bindings/clk/at91/common/pmc.h 
>> b/include/dt-bindings/clk/at91/common/pmc.h
>> new file mode 100644
>> index 0000000..edc51d6
>> --- /dev/null
>> +++ b/include/dt-bindings/clk/at91/common/pmc.h
>> @@ -0,0 +1,20 @@
>> +/*
>> + * This header provides constants for AT91 pmc status.
>> + *
>> + * The constants defined in this header are being used in dts.
>
> It is better to add one line about license: for example:
>
>  * Licensed under GPLv2 or later.
>
>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_AT91_PMC_H
>> +#define _DT_BINDINGS_CLK_AT91_PMC_H
>> +
>> +#define AT91_PMC_MOSCS        0        /* MOSCS Flag */
>> +#define AT91_PMC_LOCKA        1        /* PLLA Lock */
>> +#define AT91_PMC_LOCKB        2        /* PLLB Lock */
>> +#define AT91_PMC_MCKRDY        3        /* Master Clock */
>> +#define AT91_PMC_LOCKU        6        /* UPLL Lock */
>> +#define AT91_PMC_PCKRDY(id)    (8 + id)    /* Programmable Clock */
>
> I prefer with parenthesis around "id" (8 + (id))

Absolutely, I'll fix it.
>
>> +#define AT91_PMC_MOSCSELS    16        /* Main Oscillator Selection */
>> +#define AT91_PMC_MOSCRCS    17        /* Main On-Chip RC */
>> +#define AT91_PMC_CFDEV        18        /* Clock Failure Detector 
>> Event */
>> +
>> +#endif
>>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
