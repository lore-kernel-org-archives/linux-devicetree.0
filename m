From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: brcmnand: Make
 nand-ecc-strength and nand-ecc-step-size optional
Date: Tue, 21 May 2019 11:32:14 +0200
Message-ID: <20190521113214.35e1edd0@xps13>
References: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
        <5986da5d-2a61-b98d-9d44-d972a19ab732@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5986da5d-2a61-b98d-9d44-d972a19ab732@kontron.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org


Schrempf Frieder <frieder.schrempf@kontron.de> wrote on Tue, 21 May
2019 09:31:04 +0000:

> Hi Kamal,
> 
> On 20.05.19 21:05, Kamal Dasu wrote:
> > nand-ecc-strength and nand-ecc-step-size can be made optional as
> > brcmnand driver can support using raw NAND layer detected values.
> > 
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> > ---
> >   Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> > index bcda1df..29feaba 100644
> > --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> > @@ -101,10 +101,10 @@ Required properties:
> >                                 number (e.g., 0, 1, 2, etc.)
> >   - #address-cells            : see partition.txt
> >   - #size-cells               : see partition.txt
> > -- nand-ecc-strength         : see nand.txt
> > -- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
> >   
> >   Optional properties:
> > +- nand-ecc-strength         : see nand.txt
> > +- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
> >   - nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
> >                                 chip-select. See nand.txt
> >   - brcm,nand-oob-sector-size : integer, to denote the spare area sector size  
> 
> I think you also need to change all references to nand.txt. This file 
> was recently moved to nand-controller.yaml.
> 

Oops, completely forgot about that *again*. Thanks for pointing it
Frieder!

Miquèl
