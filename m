From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7794: add R8A7745 support
Date: Thu, 20 Apr 2017 13:14:48 +0200
Message-ID: <CAMuHMdVt2kMzwmEDOttxUxMSPtAzY+CWio_j__o5+Swmf0=WaQ@mail.gmail.com>
References: <20170413201932.890107963@cogentembedded.com> <20170419224646.wwjerpgnidvk4fkh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170419224646.wwjerpgnidvk4fkh@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Apr 20, 2017 at 12:46 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Apr 13, 2017 at 11:19:24PM +0300, Sergei Shtylyov wrote:
>> Renesas  RZ/G1E (R8A7745) is pin compatible with R-Car E2 (R8A7794),
>> however  it doesn't have several automotive specific peripherals.
>
> Is a single space between words really so hard for you? You've been told
> to write proper sentences multiple times.
>
> Yes, kernel developers suffer from OCD. Sorry.

No problem, my OCD corrects the spacing while applying...

>> Annotate all the items that only exist on the R-Car SoCs and only
>> supply the pin groups/functions existing on a given SoC (that required
>> splitting  of the AVB function)...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> ---
>> This patch is  against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
>> repo plus  R8A7794 PFC fix and R8A7743 PFC support patch...
>>
>> Changes in version 2:
>> - fixed indentation to use tabs instead of spaces;
>> - updated the PFC bindings.
>>
>>  Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1
>
> But given it's a one line DT change:

Which is always correct ;-)

> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks!

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
