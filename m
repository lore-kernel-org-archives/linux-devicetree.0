From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/6] ARM: shmobile: r8a73a4: sort dtsi file by address
Date: Fri, 12 Sep 2014 11:01:52 +0200
Message-ID: <CAMuHMdWQarDGAJOfWc9frJQoJytBO2FEmBstsZASu21UV2jvUQ@mail.gmail.com>
References: <1410511876-9235-1-git-send-email-ulrich.hecht+renesas@gmail.com>
	<1410511876-9235-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1410511876-9235-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Simon Horman <horms@verge.net.au>, Olof Johansson <olof@lixom.net>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Ulrich,

I know this is not your fault, but...

On Fri, Sep 12, 2014 at 10:51 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> +       dmac: dma-multiplexer@0 {

As there is no "reg" property, the "@0" must not be present.

> +               compatible = "renesas,shdma-mux";
> +               #dma-cells = <1>;
> +               dma-channels = <20>;
> +               dma-requests = <256>;
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
