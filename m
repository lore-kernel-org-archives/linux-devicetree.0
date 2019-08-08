Return-Path: <SRS0=oE1C=WE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190808010330.19515-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190808010330.19515-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Aug 2019 10:57:17 +0200
Message-ID: <CAMuHMdUC9tWWReH0HLMVAofR8A3phydqavejtZVK792j9g28Sg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Ulrich Hecht <uli+renesas@fpond.eu>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Niklas,

On Thu, Aug 8, 2019 at 3:04 AM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> pattern.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  .../media/{renesas,rcar-csi2.txt =3D> renesas,csi2.txt}         | 0
>  .../bindings/media/{rcar_vin.txt =3D> renesas,vin.txt}          | 0
>  MAINTAINERS                                                   | 4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt =
=3D> renesas,csi2.txt} (100%)
>  rename Documentation/devicetree/bindings/media/{rcar_vin.txt =3D> renesa=
s,vin.txt} (100%)
>
> ---
>
> Hi Geert,
>
> Would you be willing to take this patch in your renesas tree? There
> seems to be a lack of interest in it :-(

Thanks, queued in renesas-devel/renesas-dt-bindings-for-v5.4.

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
