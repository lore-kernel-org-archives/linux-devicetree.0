From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: dts: r7s72100: add rtc clock to
 device tree
Date: Fri, 17 Mar 2017 14:33:05 +0100
Message-ID: <CAMuHMdWm=4My_H-i-fNpXY9knSLpN+-zNarC5Xdq08kgvauM_w@mail.gmail.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-4-chris.brandt@renesas.com> <CAMuHMdXAvMoLu5azcBfX5pH_KYApcYSipBktpbfLybvnCG+bwg@mail.gmail.com>
 <SG2PR06MB1165ECF439A79E31978ACF228A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCQJP74GSUDRBEWLV7DAKGQE4BE3W3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: geert.uytterhoeven-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
In-Reply-To: <SG2PR06MB1165ECF439A79E31978ACF228A390-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, RTCLINUX <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Mar 17, 2017 at 2:20 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> On Friday, March 17, 2017, Geert Uytterhoeven wrote:
>> > --- a/arch/arm/boot/dts/r7s72100.dtsi
>> > +++ b/arch/arm/boot/dts/r7s72100.dtsi
>> > @@ -117,6 +117,15 @@
>> >                         clock-output-names = "ostm0", "ostm1";
>> >                 };
>> >
>> > +               mstp6_clks: mstp6_clks@fcfe042c {
>> > +                       #clock-cells = <1>;
>> > +                       compatible = "renesas,r7s72100-mstp-clocks",
>> "renesas,cpg-mstp-clocks";
>> > +                       reg = <0xfcfe042c 4>;
>> > +                       clocks = <&p0_clk>;
>> > +                       clock-indices = <R7S72100_CLK_RTC>;
>> > +                       clock-output-names = "rtc0";
>>
>> "rtc"? There's only one.
>
> The rtc-sh.c code wants to have a number at the end. So if I just put "rtc" as the clock name, it does not find it. Again, I didn't want to break any SH builds, so I just changed the DT to match the driver.

Hmm...

> [ from the rtc-sh.c code ]
>
>         clk_id = pdev->id;
>         /* With a single device, the clock id is still "rtc0" */
>         if (clk_id < 0)
>                 clk_id = 0;
>
>         snprintf(clk_name, sizeof(clk_name), "rtc%d", clk_id);
>
>         rtc->clk = devm_clk_get(&pdev->dev, clk_name);

So in the absence of an "rtc0" clock in the device node (you don't have
"clock-names" properties in the rtc devvice node yet), it will fall back to
clk_get_sys(), and will find the global "rtc0" clock. Unless you call it
"rtc"...

Most drivers using a single clock just pass NULL instead of a name, so it
will match the first clock found.

I think the simplest solution is to check if your device is instantiated
from DT (pdev->dev.of_node != NULL), and pass NULL (or "fck", when you add
multiple clocks to the DT bindings) to devm_clk_get() if that's the case.

>         if (IS_ERR(rtc->clk)) {
>                 /*
>                  * No error handling for rtc->clk intentionally, not all
>                  * platforms will have a unique clock for the RTC, and
>                  * the clk API can handle the struct clk pointer being
>                  * NULL.
>                  */
>                 rtc->clk = NULL;
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
