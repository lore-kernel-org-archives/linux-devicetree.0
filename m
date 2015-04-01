From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2 2/2] dmaengine: usb-dmac: Add Renesas USB DMA
 Controller (USB-DMAC) driver
Date: Wed, 1 Apr 2015 09:13:08 +0530
Message-ID: <20150401034308.GU7192@intel.com>
References: <1426052394-5556-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1426052394-5556-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20150318082215.GF32683@intel.com>
 <SIXPR06MB33355F6F0532539A23ED8A9D8010@SIXPR06MB333.apcprd06.prod.outlook.com>
 <20150319095927.GX32683@intel.com>
 <HKNPR06MB32208DCB73732603FF61234D80D0@HKNPR06MB322.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <HKNPR06MB32208DCB73732603FF61234D80D0@HKNPR06MB322.apcprd06.prod.outlook.com>
Sender: linux-sh-owner@vger.kernel.org
To: yoshihiro shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "horms@verge.net.au" <horms@verge.net.au>, kuninori morimoto <kuninori.morimoto.gx@renesas.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 23, 2015 at 02:32:07AM +0000, yoshihiro shimoda wrote:

> > > > > +static void usb_dmac_chan_remove(struct usb_dmac_chan *uchan)
> > > > > +{
> > > > > +	tasklet_kill(&uchan->task);
> > > > that part is good, but how about disabling irq? you can still get insterrupt
> > >
> > > Thank you for the point! I will add calling usb_dmac_chan_halt() to disable the interrupt.
> > On top of that you should free/disable the irq as well
> 
> Does this mean I should call free_irq() or something in this remove function?
Yes, that way irq can be be invoked

> Since this driver uses devm_request_irq(), I don't think the driver call such a function.
> (After this driver was removed, free_irq() was called by devm_irq_release())
Yes FW will call, but the issue is that isr can get triggered after you ahve
freed up stuff. So to prevent thsi it is recomendded that driver invoked
free_irq() explictly or disable the irq line

-- 
~Vinod

