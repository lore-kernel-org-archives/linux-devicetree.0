From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] dmaengine: add msm bam dma driver
Date: Wed, 13 Nov 2013 23:07:19 +0100
Message-ID: <3732966.zLLfiChgvH@flatron>
References: <1382732643-8184-1-git-send-email-agross@codeaurora.org> <20131029175603.GF21983@codeaurora.org> <20131030203105.GA14525@agross>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20131030203105.GA14525@agross>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, David Brown <davidb@codeaurora.org>, Bryan Huntsman <bryanh@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Wednesday 30 of October 2013 15:31:05 Andy Gross wrote:
> On Tue, Oct 29, 2013 at 10:56:03AM -0700, Stephen Boyd wrote:
> > On 10/25, Andy Gross wrote:
> > > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > > index f238cfd..a71b415 100644
> > > --- a/drivers/dma/Kconfig
> > > +++ b/drivers/dma/Kconfig
> > > @@ -364,4 +364,13 @@ config DMATEST
> > >  	  Simple DMA test client. Say N unless you're debugging a
> > >  	  DMA Device driver.
> > >  
> > > +
> > > +config MSM_BAM_DMA
> > > +	tristate "MSM BAM DMA support"
> > > +	depends on ARCH_MSM
> > 
> > It would be nice if we didn't have to rely on ARCH_MSM here so we
> > get more build coverage.
>  
> I can remove that.  There is nothing that forces this depend option.

Instead of removing, please add "|| COMPILE_TEST". This is the right way
to allow drivers not supposed to be run on given platform to build on it.

Best regards,
Tomasz
