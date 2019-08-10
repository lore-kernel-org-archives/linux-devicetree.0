Return-Path: <SRS0=/AEK=WG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46880 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfHJGk2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 10 Aug 2019 02:40:28 -0400
MIME-Version: 1.0
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
In-Reply-To: <20190809213710.31783-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 10 Aug 2019 08:40:15 +0200
Message-ID: <CAMuHMdUHK7Fq3m4y1rjVFxnSXH3tZyTjOzFMfVMtRtPcdKjNCw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Fri, Aug 9, 2019 at 11:37 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
>
> This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.

s/renesas-usb3.txt/renesas,usb3.txt/

> The motivation is to more accurately reflect the IP block documented in
> this file.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Based on v5.3-rc1
>
> v2
> * Add review tag
> * Correct changelog

I feel sorry for you...

> ---
>  .../devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt}   | 0

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
