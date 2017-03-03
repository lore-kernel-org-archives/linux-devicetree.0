From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] media: platform: Renesas IMR driver
Date: Fri, 3 Mar 2017 12:24:00 +0100
Message-ID: <CAMuHMdVg5N82bu8fxRS=3iqF2MQmqoR0idb_x0t2RNn8eoedQg@mail.gmail.com>
References: <20170302210104.646782352@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170302210104.646782352@cogentembedded.com>
Sender: linux-media-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, Mar 2, 2017 at 10:00 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> --- /dev/null
> +++ media_tree/Documentation/devicetree/bindings/media/rcar_imr.txt

> +- compatible: "renesas,imr-lx4-<soctype>", "renesas,imr-lx4" as a fallback for

"renesas,<soctype>-imr-lx4"

> +  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3 SoCs,
> +  where the examples with <soctype> are:
> +  - "renesas,imr-lx4-h3" for R-Car H3,

"renesas,r8a7795-imr-lx4"

> +  - "renesas,imr-lx4-m3-w" for R-Car M3-W,

"renesas,r8a7796-imr-lx4"

> +  - "renesas,imr-lx4-v3m" for R-Car V3M.

"renesas,-EPROBE_DEFER-imr-lx4"

Gr{oetje,eeting}s,

                        Geert
