From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5] media: platform: Renesas IMR driver
Date: Wed, 22 Mar 2017 10:34:16 +0100
Message-ID: <CAMuHMdV5-aMx4KuqShm47XtORJK8rMKzw6FUs2Hjsxia+jPfxg@mail.gmail.com>
References: <20170309200818.786255823@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170309200818.786255823@cogentembedded.com>
Sender: linux-media-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 9, 2017 at 9:08 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> --- /dev/null
> +++ media_tree/Documentation/devicetree/bindings/media/rcar_imr.txt
> @@ -0,0 +1,27 @@
> +Renesas R-Car Image Renderer (Distortion Correction Engine)
> +-----------------------------------------------------------
> +
> +The image renderer, or the distortion correction engine, is a drawing processor
> +with a simple instruction system capable of referencing video capture data or
> +data in an external memory as 2D texture data and performing texture mapping
> +and drawing with respect to any shape that is split into triangular objects.
> +
> +Required properties:
> +
> +- compatible: "renesas,<soctype>-imr-lx4", "renesas,imr-lx4" as a fallback for
> +  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3 SoCs,
> +  where the examples with <soctype> are:
> +  - "renesas,r8a7795-imr-lx4" for R-Car H3,
> +  - "renesas,r8a7796-imr-lx4" for R-Car M3-W.

Laurent: what do you think about the need for SoC-specific compatible
values for the various IM* blocks?

Gr{oetje,eeting}s,

                        Geert
