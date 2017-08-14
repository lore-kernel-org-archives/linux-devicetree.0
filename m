From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 00/06] clocksource: sh_cmt: DT binding rework V4
Date: Mon, 14 Aug 2017 22:07:21 +0200
Message-ID: <CAMuHMdXd5Ukb=RMsnpMirOTD-XDrvt8dYckjaKRA61xvVLSbvw@mail.gmail.com>
References: <20160314142342.17180.21352.sendpatchset@little-apple>
 <20161124105843.GA26737@verge.net.au> <20170711115646.GL4517@verge.net.au>
 <CAMuHMdX=+HZwOK097HBJ0vWGDpcLQ1dYWSNtb62DSecmvTVz=A@mail.gmail.com> <af57e696-be8d-f44b-0325-8950d2ae87d2@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <af57e696-be8d-f44b-0325-8950d2ae87d2-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel, Magnus,

On Thu, Aug 10, 2017 at 12:56 PM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 10/08/2017 11:01, Geert Uytterhoeven wrote:
>> On Tue, Jul 11, 2017 at 1:56 PM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
>>> On Thu, Nov 24, 2016 at 11:58:43AM +0100, Simon Horman wrote:
>>>> On Mon, Mar 14, 2016 at 11:23:42PM +0900, Magnus Damm wrote:
>>>>> clocksource: sh_cmt: DT binding rework V4
>>>>>
>>>>> [PATCH v4 01/06] devicetree: bindings: Remove sh7372 CMT binding
>>>>> [PATCH v4 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
>>>>> [PATCH v4 03/06] devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings
>>>>> [PATCH v4 04/06] devicetree: bindings: Deprecate property, update example
>>>>> [PATCH v4 05/06] devicetree: bindings: Remove unused 32-bit CMT bindings
>>>>> [PATCH v4 06/06] devicetree: bindings: Remove deprecated properties
>>>>>
>>>>> Here is the latest and hopefully final take on updating the CMT DT
>>>>> bindings for R-Car Gen2. In total there are 6 patches that have acks
>>>>> and are ready to be picked up and merged. Other earlier posted changes
>>>>> such as driver modification and SoC DTS bits depend on this series.
>>>>
>>>> I am wondering what the state of this work is.
>>>> I see only one minor review comment for this series.
>>>> It would be great to see it merged.
>>>
>>> Ping
>>
>> Recently, at +1800m, I realized that if we want to continue this work, we
>> better do it soon, so it can be included in the big R-Car Gen2 flag day
>> requiring APMU, CPG/MSSR, ICRAM, RST, and SYSC being described in DT.
>
> Applied.

Thank you.

Of course, before we can convert existing DT source files to the new bindings,
we need support for the new bindings in the sh_cmt driver.

Magnus: what is the status of that? Where can we find the latest code?

Thanks again!

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
