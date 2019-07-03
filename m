Return-Path: <SRS0=MmL7=VA=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190703083514.32385-1-horms+renesas@verge.net.au> <20190703083514.32385-3-horms+renesas@verge.net.au>
In-Reply-To: <20190703083514.32385-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jul 2019 14:28:51 +0200
Message-ID: <CAMuHMdVgx9N0yeeei5qcg1yz2WEdDf0gQ6GcwUOAz7u09S_D4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Wed, Jul 3, 2019 at 10:35 AM Simon Horman <horms+renesas@verge.net.au> w=
rote:
> For consistency with the naming of (most) other documentation files for D=
T
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas-gen3.txt to renesas,usb3-peri.txt
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
>
> ---
> v2
> * Accumulate review tags
> * Use renesas,usb3-peri.txt as new filename as suggested by Shimoda-san

Unfortunately the previous version has already made it into usb-next
23c46801d14cb647 dt-bindings: usb: renesas_gen3: Rename bindings
documentation file

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
