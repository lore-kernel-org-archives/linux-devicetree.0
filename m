From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Mon, 16 Jan 2017 11:36:41 +0100
Message-ID: <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
 <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com>
 <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
 <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
 <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com> <SG2PR06MB11659339E4A08373D3626BB28A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB11659339E4A08373D3626BB28A780-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

CC Woflram

On Fri, Jan 13, 2017 at 6:56 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> On Friday, January 13, 2017, Geert Uytterhoeven wrote:
>> > In sh_mobile_sdhi.c, can we change sh_mobile_sdhi_probe() so that if
>> > there are 2 clocks specified (in DT or platform data), it
>> > automatically enables the 2nd clock (forever) and just uses the 1st
>> clock as the on/off clock?
>>
>> Of course the driver can handle the second interrupt, if you update the
>> binding, and add support code for that...
>
> Of course my idea is that I would only have to update the bindings for
> RZ/A1...not any other device.
>
> My only question is, today sh_mobile_sdhi.c uses this:
>
>    priv->clk = devm_clk_get(&pdev->dev, NULL);
>
> to get the clock. But if there is a 2nd clock...how do I know the
> string id name to look to replace NULL with??

That should be specified in the bindings. "NULL" will get you the first clock.

> Or...for the RZ/A1 dtsi, should I just give the 2 clocks names:
>
>                 clocks = <&mstp12_clks R7S72100_CLK_SDHI00,
>                                 &mstp12_clks R7S72100_CLK_SDHI01>;
>                 clock-names = "core", "cd";

Something like that.
If devm_clk_get(&pdev->dev, "core") fails, you can assume a single clock
and retry with NULL.

> and then in the code do:
>
>         struct *cd_clk;
>         cd_clk = devm_clk_get(&pdev->dev, "cd");
>         if (cd_clk) {
>                 clk_prepare_enable(cd_clk);
>         }
>
>   (this simple 1-line fix patch is getting a lot more complicated)

Disclaimer: I don't know how/if the SDHI core manages clocks, and may
interfere. Adding Wolfram.

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
