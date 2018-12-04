From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 26/34] dt-bindings: arm: Convert Renesas board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 09:08:57 -0600
Message-ID: <CAL_JsqJX9eb58piavQayXM5j5GXxsGxmy93m5oRKtghMFvkhuA@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-27-robh@kernel.org>
 <20181204144822.uqonsto45u7ysdu5@verge.net.au> <CAMuHMdV5brJyAmP0Bj7Bp7wruLNM1tSWkj_AyN5HCx4vdg-nrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV5brJyAmP0Bj7Bp7wruLNM1tSWkj_AyN5HCx4vdg-nrg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Grant Likely <grant.likely@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 4, 2018 at 8:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Simon,
>
> On Tue, Dec 4, 2018 at 3:48 PM Simon Horman <horms@verge.net.au> wrote:
> > On Mon, Dec 03, 2018 at 03:32:15PM -0600, Rob Herring wrote:
> > > Convert Renesas SoC bindings to DT schema format using json-schema.
> > >
> > > Cc: Simon Horman <horms@verge.net.au>
> > > Cc: Magnus Damm <magnus.damm@gmail.com>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../devicetree/bindings/arm/shmobile.txt      | 151 ------------
> > >  .../devicetree/bindings/arm/shmobile.yaml     | 218 ++++++++++++++++++
> > >  2 files changed, 218 insertions(+), 151 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/shmobile.txt
> > >  create mode 100644 Documentation/devicetree/bindings/arm/shmobile.yaml
> >
> > Hi Rob,
> >
> > what is this based on? I get a conflict when applying the .txt change
> > and if I knew the base for this patch it would be rather easy to work
> > out what has changed.

4.20-rc2

> >
> > Also, should we do an s/shmobile.txt/shmobile.yaml/ in MAINTAINERS?

Yes. Though it was pointed out that get_maintainers.pl can pull emails
out of this file. We'd need to get that to work by default though.

> Probably even s/shmobile.yaml/renesas.yaml/, while at it?

Sure, if that's what you all want.

Rob
