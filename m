From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [RFC 1/7] ARM: vf610: add low level debug support for !MMU
Date: Mon, 13 Oct 2014 11:26:17 +0200
Message-ID: <8beb1fbc7c495cf9deadb77416c884f1@agner.ch>
References: <cover.1413136383.git.stefan@agner.ch>
 <331b5f06d72890ac348adcd8cce616db576eb10e.1413136383.git.stefan@agner.ch>
 <2650196.D7500rgcAr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2650196.D7500rgcAr@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 2014-10-12 20:48, schrieb Arnd Bergmann:
> On Sunday 12 October 2014 20:13:55 Stefan Agner wrote:
>> Add support for !MMU low level debug required for the secondary
>> Cortex-M4 core in Vybrid.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>>  arch/arm/include/debug/vf.S | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/include/debug/vf.S b/arch/arm/include/debug/vf.S
>> index b889338..63c7ef7 100644
>> --- a/arch/arm/include/debug/vf.S
>> +++ b/arch/arm/include/debug/vf.S
>> @@ -17,12 +17,22 @@
>>
>>  #define VF_UART_VIRTUAL_BASE	0xfe000000
>>
>> +#ifdef CONFIG_MMU
>> +
>>  	.macro	addruart, rp, rv, tmp
>>  	ldr	\rp, =VF_UART_PHYSICAL_BASE 	@ physical
>>  	and	\rv, \rp, #0xffffff		@ offset within 16MB section
>>  	add	\rv, \rv, #VF_UART_VIRTUAL_BASE
>>  	.endm
>>
>> +#else /* !CONFIG_MMU */
>> +
>> +	.macro	addruart, rx, tmp
>> +	ldr	\rx, =(VF_UART_PHYSICAL_BASE)	@ physical
>> +	.endm
>> +
>> +#endif /* CONFIG_MMU */
>> +
>>  	.macro	senduart, rd, rx
>>  	strb	\rd, [\rx, #0x7]	@ Data Register
>>  	.endm
>>
> Hmm, I've previously needed to add this patch for randconfig testing:
> 
> index 78c91b5f97d4..ea9646cc2a0e 100644
> --- a/arch/arm/kernel/debug.S
> +++ b/arch/arm/kernel/debug.S
> @@ -35,7 +35,7 @@
>  
>  #else /* !CONFIG_MMU */
>                 .macro  addruart_current, rx, tmp1, tmp2
> -               addruart        \rx, \tmp1
> +               addruart        \rx, \tmp1, \tmp2
>                 .endm
>  
>  #endif /* CONFIG_MMU */
> 
> 
> 
> If we do this instead, could we avoid your patch?

Not completely, we then could just ifdef the base address, so it would
make it simpler. We could also pass a boolean in the third, currently
temporary argument to distinguish that during run time in order to get
rid of the compile time ifdef... 

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
