From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RFC v5 2/2] clk: Add handling of clk parent and rate
 assigned from DT
Date: Fri, 13 Jun 2014 17:06:37 +0200
Message-ID: <539B137D.4060408@samsung.com>
References: <1397042790-10636-1-git-send-email-s.nawrocki@samsung.com>
 <1397042790-10636-3-git-send-email-s.nawrocki@samsung.com>
 <CAL_JsqKDJ_yFxFYnrTtmzMPoxO2rmypiujybwbhUh35y1LS-Mw@mail.gmail.com>
 <5347DF4D.5000005@samsung.com> <20140523013406.9521.82891@quantum>
 <537EECC7.2030605@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <537EECC7.2030605-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23/05/14 08:37, Tero Kristo wrote:
> On 05/23/2014 04:34 AM, Mike Turquette wrote:
[...]
>> It looks like this idea was dropped for v6. Can we revisit it? Take a
>> look at Tero's example implementation for OMAP using this binding:
>>
>> http://www.spinics.net/lists/linux-omap/msg104705.html
>>
>> There is a bogus "default-clocks" node made solely for storing this info
>> within the OMAP PRCM clock provider node. This is basically faking a
>> clock consumer. I think with the proposed solution above Tero could have
>> avoided that node entirely and done the following:
>>
>> diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
>> index 649b5cd..e3ff1a7 100644
>> --- a/arch/arm/boot/dts/omap4.dtsi
>> +++ b/arch/arm/boot/dts/omap4.dtsi
>> @@ -145,6 +145,11 @@
>>   			cm2_clocks: clocks {
>>   				#address-cells = <1>;
>>   				#size-cells = <0>;
>> +
>> +				assigned-clocks = <&abe_dpll_refclk_mux_ck>,
>> +					<&dpll_usb_ck>, <&dpll_abe_ck>;
>> +				assigned-clock-parents = <&sys_32k_ck>;
>> +				assigned-clock-rates = <0>, <960000000>, <98304000>;
>>   			};
>>
>>   			cm2_clockdomains: clockdomains {
>>
>>
>> Tero, what do you think?
> 
> Yeah, if we can avoid having a dummy node someplace, it is always 
> better. Only issue might be the initialization order, this was the 
> reason I created the dummy node if I recall right. But I guess we can 
> just scan the clock provider nodes second time at a later phase of boot 
> (or just store the default info for later use.)

One issue I'm a bit concerned about with an initcall-like approach is
it may not work well for clock providers in kernel modules which can be
loaded at any time.  So doing the configuration upon the clock provider
registration might have worked better.  Then we could disallow (defer)
a clock provider registration if any of its dependencies (as specified
through assigned-clock* properties) are not satisfied.  Do you think
that could work ?

--
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
