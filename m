From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible
 strings for JZ4740 and JZ4725B
Date: Wed, 13 Mar 2019 14:09:43 +0100
Message-ID: <20190313140943.01afcbdc@collabora.com>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190304104554.09be4cd4@xps13>
        <1551723742.4932.2@crapouillou.net>
        <20190304195149.7cca9c64@xps13>
        <1552481734.2412.1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552481734.2412.1@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 13 Mar 2019 09:55:34 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi,
> 
> Le lun. 4 mars 2019 à 15:51, Miquel Raynal <miquel.raynal@bootlin.com> 
> a écrit :
> > Hi Paul,
> >   
> >>  >>  ---   
> >> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt  
> >>  >>  +++   
> >> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt  
> >>  >>  @@ -6,7 +6,10 @@ memory-controllers/ingenic,jz4780-nemc.txt),   
> >> and >> thus NAND device nodes must  
> >>  >>   be children of the NEMC node.  
> >>  >> >>   Required NAND controller device properties:  
> >>  >>  -- compatible: Should be set to "ingenic,jz4780-nand".
> >>  >>  +- compatible: Should be one of:
> >>  >>  +  * ingenic,jz4740-nand
> >>  >>  +  * ingenic,jz4725b-nand
> >>  >>  +  * ingenic,jz4780-nand  
> >>  >
> >>  > Wouldn't "-nand-controller" suffix be better? Of course in the   
> >> driver  
> >>  > you should still check for jz4780-nand.  
> >> 
> >>  So I would be compatible with:
> >>  * ingenic,jz4740-nand-controller
> >>  * ingenic,jz4725b-nand-controller
> >>  * ingenic,jz4780-nand
> >>  ?  
> > 
> > From a driver POV I would even prefer ingenic,jz4780-nand-controller. 
> > I
> > don't know what's best here. Maybe Boris or Rob can help?

Let's keep it consistent and have all compatibles follow the old
naming scheme (ingenic,<soc>-nand). But yes, for new drivers, I agree
that -nand-controller is better than just -nand.
