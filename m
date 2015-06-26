From: Jeremy Linton <jlinton-WMdfZNuR64nqlBn2x/YWAg@public.gmane.org>
Subject: Re: pSeries boot failure due to wrong interrupt controller
Date: Fri, 26 Jun 2015 12:54:09 -0500
Message-ID: <558D91C1.6030004@tributary.com>
References: <CAEFTgiyHkf8ooYdWW0nTLcdraJ_L9FpLSVZa4KS3CcdpGWJxew@mail.gmail.com> <CAL_JsqJqkUL8XyqR6yjg+-thj4YOQ6cUohGHHid71tdRFft7vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJqkUL8XyqR6yjg+-thj4YOQ6cUohGHHid71tdRFft7vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeremy Linton <lintonrjeremy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ping? Anyone?

I'm adding ppc-dev to see if anyone there is interested in picking up the patch..

Thanks,
	Jeremy


Ok so I messed up the formatting a little and was lazy and didn't checkpatch it
cause I mean, it was 1 line! If someone wants it resent I will do so.





On 6/23/2015 8:42 AM, Rob Herring wrote:
> +Grant
> 
> On Mon, Jun 22, 2015 at 2:44 PM, Jeremy Linton <lintonrjeremy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> The OF IRQ logic was refactored a while back, and it appears that it
>> broke the case where a device doesn't have an interrupt-map
>> (legacy/ISA platform peripherals). In particular on the older pSeries
>> platforms the console serial port (keyboard/etc) is attached via a
>> Winbond super I/O controller. With the refactored logic
>> of_irq_parse_raw() returns with the out_irq->np pointing at the bus,
>> rather than the interrupt controller. This results in the platform
>> logic getting confused about the appropriate interrupt host, and in
>> ics_rtas_host_match() it doesn't match "chrp,iic" and the xics takes
>> over and tries to use RTAS to map the interrupt. RTAS then crashes the
>> machine.
>>
>> This tweaks the "-> no map, getting parent" behavior to behave as
>> before, and the machine boots.
> 
> I think the real question is why doesn't of_irq_find_parent return the
> interrupt controller node instead of the bus node.
> 
> While I think this fix is correct, I think of_irq_parse_raw should be
> a nop in the case of no interrupt-map.
> 
> Rob
> 
>>
>> Thanks
>>
>> Signed-off-by: Jeremy Linton <lintonrjeremy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>>
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index 1a79806..78b4161b 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -252,7 +252,6 @@ int of_irq_parse_raw(const __be32 *addr, struct
>> of_phandle_args *out_irq)
>>                  * Successfully parsed an interrrupt-map translation; copy new
>>                  * interrupt specifier into the out_irq structure
>>                  */
>> -               out_irq->np = newpar;
>>
>>                 match_array = imap - newaddrsize - newintsize;
>>                 for (i = 0; i < newintsize; i++)
>> @@ -262,6 +261,7 @@ int of_irq_parse_raw(const __be32 *addr, struct
>> of_phandle_args *out_irq)
>>
>>         skiplevel:
>>                 /* Iterate again with new parent */
>> +               out_irq->np = newpar;
>>                 pr_debug(" -> new parent: %s\n", of_node_full_name(newpar));
>>                 of_node_put(ipar);
>>                 ipar = newpar;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
