Return-Path: <SRS0=pysA=V5=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190801091337.27786-1-horms+renesas@verge.net.au>
In-Reply-To: <20190801091337.27786-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2019 11:18:36 +0200
Message-ID: <CAMuHMdXNbqmS4T50+1PXp1-o1NLwbYCKqV=6e1Vj_vuicUxMOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Content-Type: text/plain; charset="UTF-8"
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 1, 2019 at 11:13 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas,gen3.txt to renesas,usb3-peri.txt

from renesas,usb3.txt

> This refines a recent rename from renesas,gen3.txt to renesas-gen3.txt.

Actually it was renamed from renesas_usb3.txt to renesas,usb3.txt.

> The motivation is to to more accurately reflect the IP block documented in

double to

> this file.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
