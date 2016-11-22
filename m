From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: da850: specify max width for display node
Date: Tue, 22 Nov 2016 11:30:16 +0100
Message-ID: <CAMpxmJXL6rdGOLJ59H9DtNL0-=zk2RQiBtmebdgYV6DrFX2jew@mail.gmail.com>
References: <1479807775-28283-1-git-send-email-bgolaszewski@baylibre.com> <77c993f3-1b5f-94cf-c4bc-8a30148e0a4d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <77c993f3-1b5f-94cf-c4bc-8a30148e0a4d-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-11-22 11:27 GMT+01:00 Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>:
> On 22/11/16 11:42, Bartosz Golaszewski wrote:
>> It has been determined that the highest resolution supported correctly
>> by LCDC rev1 is 800x600 on da850 due to memory bandwidth constraints.
>>
>> Set the max_width property in da850.dtsi to 800.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/da850.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>> index 36066fa..0876238 100644
>> --- a/arch/arm/boot/dts/da850.dtsi
>> +++ b/arch/arm/boot/dts/da850.dtsi
>> @@ -441,6 +441,7 @@
>>                       compatible = "ti,da850-tilcdc";
>>                       reg = <0x213000 0x1000>;
>>                       interrupts = <52>;
>> +                     max-width = <800>;
>>                       status = "disabled";
>>               };
>>       };
>>
>
> Does 1024x768@10 work?
>
> The max-width should be the hardware's maximum supported width, not used
> for bandwidth. tilcdc has max-bandwidth property for that.
>
>  Tomi
>

Eeek I misread Jyri's answer.

Will fix that in v2.

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
