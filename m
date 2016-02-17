From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
Date: Wed, 17 Feb 2016 11:33:27 +0900
Message-ID: <CANqRtoQg--gnv+ZkopO3PR3Pt7i5quiKvaPDyeJVOnahJGgdmg@mail.gmail.com>
References: <20160216071722.25461.61862.sendpatchset@little-apple>
	<20160216071741.25461.54191.sendpatchset@little-apple>
	<CAMuHMdVEPeEd3cTWWd-a_6k7MgtcGiiHdyMLZ1yXoWQpsH_URg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVEPeEd3cTWWd-a_6k7MgtcGiiHdyMLZ1yXoWQpsH_URg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Tue, Feb 16, 2016 at 10:11 PM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> On Tue, Feb 16, 2016 at 8:17 AM, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
>>
>> Add documentation for new separate CMT0 and CMT1 DT compatible strings
>> for R-Car Gen2. These compat strings allow us to enable CMT1-specific
>> features in the driver. The old compat strings will be deprecated in
>> the not so distant future.
>>
>> Signed-off-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
>> Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>
>>  Changes since V2:
>>  - Added Acked-by from Rob
>>  - Removed Tested-by tag from DT binding patch - duh!
>>
>>  Changes since V1:
>>  - Added Acked-by and Tested-by from Geert
>>  - Added Acked-by from Laurent
>>
>>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> --- 0002/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt        2015-09-17 17:26:57.440513000 +0900
>> @@ -36,6 +36,9 @@ Required Properties:
>>                 (CMT1 on sh73a0 and r8a7740)
>>                 This is a fallback for the above renesas,cmt-48-* entries.
>>
>> +    - "renesas,cmt0-rcar-gen2" for 32-bit CMT0 devices included in R-Car Gen2.
>> +    - "renesas,cmt1-rcar-gen2" for 48-bit CMT1 devices included in R-Car Gen2.
>
> (advancing a few months always means more comments ;-)

Indeed!

> I'm wondering whether we should use e.g. "renesas,rcar-gen2-cmt0" instead?

I have no strong feelings one way or the other, but I agree that
aiming to make things more consistent must be good.

Your proposal makes the fallback match with what we do for a bunch
other devices on R-Car Gen2 like:
"rcar-gen2-cpg-clocks"
"rcar-gen2-scif"
But we also seem to have:
"pci-rcar-gen2"

On R-Car Gen3 we seem to have the following per-SoC compat strings:
"dmac-r8a7795"
"etheravb-r8a7795"
"gpio-r8a7795"
"scif-r8a7795"
But we also have:
"r8a7795-cpg-mssr"

My only feeling is that it looks a tad odd if we follow
"<vendor>,<family-generation>-<device>" for fallback strings but
"<vendor>,<device>-<part-number>" for the per-soc binding. Why not
using the same order? Maybe this is specified in some document
somewhere?

I guess your take with "r8a7795-cpg-mssr" above is to follow the same
order as for the fallback case? This seems sane to me, and if so then
perhaps the per-soc compat strings for the CMT should also be updated?
Same for other devices too then, like the recently added
"dmac-r8a7795"?

Cheers,

/ magnus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
