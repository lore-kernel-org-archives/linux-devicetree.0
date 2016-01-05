From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] of/platform: export of_default_bus_match_table
Date: Tue, 5 Jan 2016 19:50:31 +0900
Message-ID: <CAK7LNAR3yxRoQ-qLCASAaCwzCZaSiXMbRjasfWf=X1O9P49fgw@mail.gmail.com>
References: <1451960273-19934-1-git-send-email-yamada.masahiro@socionext.com>
	<2748326.r4zEhnPneC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2748326.r4zEhnPneC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

2016-01-05 19:13 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Tuesday 05 January 2016 11:17:53 Masahiro Yamada wrote:
>> Currently, drivers/bus/uniphier-system-bus.c is kept from being a
>> module due to the unresolved reference to of_default_bus_match_table.
>>
>> Refer to commit 326ea45aa827 ("bus: uniphier: allow only built-in
>> driver").
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>>
>>  drivers/of/platform.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index af98343..8d103e4 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -31,6 +31,7 @@ const struct of_device_id of_default_bus_match_table[] = {
>>  #endif /* CONFIG_ARM_AMBA */
>>         {} /* Empty terminated list */
>>  };
>> +EXPORT_SYMBOL(of_default_bus_match_table);
>
> I wonder if the uniphier bus should actually use the default
> match table at all. Sorry for not having thought of that when
> I did my patch.
>
> What kinds of devices do you see below this bus? Do you have multiple
> levels of devices? Are they all platform devices or could they
> be AMBA?


This bus is used to connect external (on-board) devices with the SoC.

So, no possibility for AMBA, but
I want "simple-bus" for grouping some device nodes.
Also, "simple-mfd" would be useful because an external device could be an MFD.


Please see arch/arm/boot/dts/uniphier-support-card.dtsi

It describes an add-on card (expansion board)
which has ETHER, UART, etc. on it.

I implemented it as "simple-bus".

This card is connected to the chip select 1
of the UniPhier System Bus.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
