From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH V2 1/2] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
Date: Mon, 15 Jul 2013 12:12:17 -0500
Message-ID: <1373908337.8183.301@snotra>
References: <1373005626-20726-1-git-send-email-hongbo.zhang@freescale.com>
	<1373005626-20726-2-git-send-email-hongbo.zhang@freescale.com>
	<6482CAC0-9C6A-4A1E-B158-28D2E1BB2CCE@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6482CAC0-9C6A-4A1E-B158-28D2E1BB2CCE@kernel.crashing.org>
	(from galak@kernel.crashing.org on Mon Jul 15 08:35:07 2013)
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: "<hongbo.zhang@freescale.com>" <hongbo.zhang@freescale.com>, vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, vakul@freescale.com
List-Id: devicetree@vger.kernel.org

On 07/15/2013 08:35:07 AM, Kumar Gala wrote:
> 
> On Jul 5, 2013, at 1:27 AM, <hongbo.zhang@freescale.com>  
> <hongbo.zhang@freescale.com> wrote:
> 
> > +dma0: dma@100300 {
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +	compatible = "fsl,elo3-dma";
> 
> why does this require a new compatible?

The binding has changed -- there is now a second reg entry.

-Scott
