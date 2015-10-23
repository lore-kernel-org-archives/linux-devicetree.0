From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 1/5] [RFC] clk: shmobile: Add new Renesas CPG/MSSR DT bindings
Date: Fri, 23 Oct 2015 13:09:22 +0200
Message-ID: <CAMuHMdW=bNeoXWMbw74HVT4rZGYq=HekW9a=ZfvhS3wpuG1hZg@mail.gmail.com>
References: <1444999760-15750-1-git-send-email-geert+renesas@glider.be>
	<CAMuHMdVhBipbf13o0jb3H6qmcewh6CCtq3=Hj-9nvgar+AYdFg@mail.gmail.com>
	<CANqRtoS6QpWJY99aD8KyGHgySxqzzBPic-k_a-VcZE6LVFFRow@mail.gmail.com>
	<1832656.BCXoHFFChX@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1832656.BCXoHFFChX@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Fri, Oct 23, 2015 at 1:05 PM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> On Wednesday 21 October 2015 01:01:03 Magnus Damm wrote:
>> On Tue, Oct 20, 2015 at 9:16 PM, Geert Uytterhoeven wrote:
>> > On Fri, Oct 16, 2015 at 2:49 PM, Geert Uytterhoeven wrote:
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
>> >> @@ -0,0 +1,71 @@
>> >> +* Renesas Clock Pulse Generator / Module Standby and Software Reset
>> >> +
>> >> +On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse
>> >> Generator)
>> >> +and MSSR (Module Standby and Software Reset) blocks are intimately
>> >> connected,
>> >> +and share the same register block.
>> >> +
>> >> +They provide the following functionalities:
>> >> +  - The CPG block generates various core clocks,
>> >> +  - The MSSR block provides two functions:
>> >> +      1. Module Standby, providing a Clock Domain to control the clock
>> >> supply
>> >> +        to individual SoC devices,
>> >> +      2. Reset Control, to perform a software reset of individual SoC
>> >> devices.
>> >> +
>> >> +Required Properties:
>> >> +  - compatible: Must be one of:
>> >> +      - "renesas,r8a7791-cpg-mssr" for the r8a7791 SoC
>> >
>> > I'll drop the reference to "r8a7791", as we won't convert r8a7791 (yet).
>
> I'm fine with supporting r8a7795 only in the initial patch set, but when do we
> plan to convert r8a7791 ? I think it would be a good idea to validate these

That's a political question...

> bindings on r8a7791 before considering them as stable.

I did the validation on both r8a7795/salvator-x and r8a7791/koelsch.
Please try branch topic/cpg-mssr-v4 of renesas-drivers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
