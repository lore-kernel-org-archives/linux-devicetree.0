From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/12] dt: arm: shmobile: add H3ULCB board DT bindings
Date: Wed, 26 Oct 2016 13:33:54 +0200
Message-ID: <CAMuHMdVxfCMK53SLch=kvhRS0hTvpd0kGS=p4T=kU+XX=1GjVA@mail.gmail.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637741-14624-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWsxu0bBTFHZYh6+eowXkx=G-Uo06g7TOLE7Ek7vaHHYA@mail.gmail.com>
 <83a48012-888e-3f86-c9a0-8cddb05ee2fe@cogentembedded.com> <936e63bd-4f01-891f-24da-4c34caf94bcf@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <936e63bd-4f01-891f-24da-4c34caf94bcf@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Yusuke Goda <yusuke.goda.sx@renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Wed, Oct 26, 2016 at 12:27 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> I've got this message from Renesas:
> "
>
> Please use H3ULCB/M3ULCB in upstream.
> # I got an agreement among parties.
>
> Board name in community: ULCB (= development code name)
> Official name (product/brand name): Starter Kit Pro/Premier
> "
>
> Renaming  H3ULCB -> H3SK is not desired for Renesas.
>
> What do you think to append the product/brand name only? :
>
> -        H3ULCB (RTP0RC7795SKB00010S)
> +       H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKB00010S)
>          compatible = "renesas,h3ulcb", "renesas,r8a7795";

Looks good to me.

And then we can add

        M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKB00010S)
        compatible = "renesas,m3ulcb", "renesas,r8a7796";

later.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
