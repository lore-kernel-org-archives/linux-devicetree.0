Return-Path: <SRS0=jIp7=MR=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com> <42fe460f-0c2e-ec8c-ecca-15ec5a5a4117@cogentembedded.com>
In-Reply-To: <42fe460f-0c2e-ec8c-ecca-15ec5a5a4117@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Oct 2018 08:53:41 +0200
Message-ID: <CAMuHMdVwe8rtZ1v3KUJDa7h9pwr=67kD6T1eNFuF2ObAYFJapQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-thermal: document R8A77970 bindings
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Linux PM list <linux-pm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Oct 4, 2018 at 11:02 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Document  the R-Car V3M (R8A77970) SoC in the Renesas R-Car gen2 thermal
> bindings. The hardware is the same as  in the R-Car D3 (R8A77995) plus an
> extra status register.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
