From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/5] [RFC] clk: shmobile: Add new Renesas CPG/MSSR DT bindings
Date: Wed, 21 Oct 2015 01:01:03 +0900
Message-ID: <CANqRtoS6QpWJY99aD8KyGHgySxqzzBPic-k_a-VcZE6LVFFRow@mail.gmail.com>
References: <1444999760-15750-1-git-send-email-geert+renesas@glider.be>
	<1444999760-15750-2-git-send-email-geert+renesas@glider.be>
	<CAMuHMdVhBipbf13o0jb3H6qmcewh6CCtq3=Hj-9nvgar+AYdFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVhBipbf13o0jb3H6qmcewh6CCtq3=Hj-9nvgar+AYdFg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Tue, Oct 20, 2015 at 9:16 PM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> On Fri, Oct 16, 2015 at 2:49 PM, Geert Uytterhoeven
> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
>> @@ -0,0 +1,71 @@
>> +* Renesas Clock Pulse Generator / Module Standby and Software Reset
>> +
>> +On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse Generator)
>> +and MSSR (Module Standby and Software Reset) blocks are intimately connected,
>> +and share the same register block.
>> +
>> +They provide the following functionalities:
>> +  - The CPG block generates various core clocks,
>> +  - The MSSR block provides two functions:
>> +      1. Module Standby, providing a Clock Domain to control the clock supply
>> +        to individual SoC devices,
>> +      2. Reset Control, to perform a software reset of individual SoC devices.
>> +
>> +Required Properties:
>> +  - compatible: Must be one of:
>> +      - "renesas,r8a7791-cpg-mssr" for the r8a7791 SoC
>
> I'll drop the reference to "r8a7791", as we won't convert r8a7791 (yet).
>
>> +      - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC
>> +
>> +  - reg: Base address and length of the memory resource used by the CPG/MSSR
>> +    block
>> +
>> +  - clocks: References to external parent clocks, one entry for each entry in
>> +    clock-names
>> +  - clock-names: List of external parent clock names. Valid names are:
>> +      - "extal" (r8a7791, r8a7795)
>> +      - "extalr" (r8a7795)
>> +      - "usb_extal" (r8a7791)
>
> Likewise.

Yeah, dropping r8a7791 from the initial version of this DT binding
seems like a good idea to me as well.

All looks good to me. Thanks for preparing this nicely written DT
binding document!

Reviewed-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>

Cheers,

/ magnus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
