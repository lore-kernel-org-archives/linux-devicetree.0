From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 26/34] dt-bindings: arm: Convert Renesas board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 15:57:31 +0100
Message-ID: <CAMuHMdV5brJyAmP0Bj7Bp7wruLNM1tSWkj_AyN5HCx4vdg-nrg@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-27-robh@kernel.org>
 <20181204144822.uqonsto45u7ysdu5@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204144822.uqonsto45u7ysdu5@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, darknighte@darknighte.com, Frank Rowand <frowand.list@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Grant Likely <grant.likely@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Tue, Dec 4, 2018 at 3:48 PM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Dec 03, 2018 at 03:32:15PM -0600, Rob Herring wrote:
> > Convert Renesas SoC bindings to DT schema format using json-schema.
> >
> > Cc: Simon Horman <horms@verge.net.au>
> > Cc: Magnus Damm <magnus.damm@gmail.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/shmobile.txt      | 151 ------------
> >  .../devicetree/bindings/arm/shmobile.yaml     | 218 ++++++++++++++++++
> >  2 files changed, 218 insertions(+), 151 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/shmobile.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/shmobile.yaml
>
> Hi Rob,
>
> what is this based on? I get a conflict when applying the .txt change
> and if I knew the base for this patch it would be rather easy to work
> out what has changed.
>
> Also, should we do an s/shmobile.txt/shmobile.yaml/ in MAINTAINERS?

Probably even s/shmobile.yaml/renesas.yaml/, while at it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
