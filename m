From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/14] dmaengine: dma-jz4780: Add support for the JZ4740
 SoC
Date: Mon, 16 Jul 2018 15:33:39 -0600
Message-ID: <20180716213339.GA19161@rob-hp-laptop>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-6-paul@crapouillou.net>
 <20180709171226.GK22377@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180709171226.GK22377@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 09, 2018 at 10:42:26PM +0530, Vinod wrote:
> On 03-07-18, 14:32, Paul Cercueil wrote:
> 
> >  enum jz_version {
> > +	ID_JZ4740,
> >  	ID_JZ4770,
> >  	ID_JZ4780,
> >  };
> > @@ -247,6 +248,7 @@ static void jz4780_dma_desc_free(struct virt_dma_desc *vdesc)
> >  }
> >  
> >  static const unsigned int jz4780_dma_ord_max[] = {
> > +	[ID_JZ4740] = 5,
> >  	[ID_JZ4770] = 6,
> >  	[ID_JZ4780] = 7,
> >  };
> > @@ -801,11 +803,13 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
> >  }
> >  
> >  static const unsigned int jz4780_dma_nb_channels[] = {
> > +	[ID_JZ4740] = 6,
> >  	[ID_JZ4770] = 6,
> >  	[ID_JZ4780] = 32,
> >  };
> 
> I feel these should be done away with if we describe hardware in DT

The compatible property can imply things like this.

But how this is structured is a bit strange. Normally you have a per 
compatible struct with these as elements and the compatible matching 
selects the struct.

> 
> >  
> >  static const struct of_device_id jz4780_dma_dt_match[] = {
> > +	{ .compatible = "ingenic,jz4740-dma", .data = (void *)ID_JZ4740 },
> 
> adding .compatible should be the only thing required, if at all for this
> addition :)
> 
> -- 
> ~Vinod
