From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v2 3/5] dmaengine: qcom: bam_dma: add controlled remotely
 dt property
Date: Wed, 6 Apr 2016 01:05:27 -0500
Message-ID: <20160406060527.GC3873@hector.attlocal.net>
References: <1459896982-30171-1-git-send-email-stanimir.varbanov@linaro.org>
 <1459896982-30171-4-git-send-email-stanimir.varbanov@linaro.org>
 <20160405234425.GD11586@vkoul-mobl.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160405234425.GD11586@vkoul-mobl.iind.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, Pramod Gurav <gpramod@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 05, 2016 at 04:44:25PM -0700, Vinod Koul wrote:
> On Wed, Apr 06, 2016 at 01:56:20AM +0300, Stanimir Varbanov wrote:
> >  Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 2 ++
> >  drivers/dma/qcom/bam_dma.c                             | 7 +++++++
> 
> The binding should be a separate patch..
> 
> >  
> > +	bdev->controlled_remotely = of_property_read_bool(pdev->dev.of_node,
> > +						"qcom,controlled-remotely");
> > +
> 
> we need some defaults here, how will this work with boards withe older DT.

By default the bam driver should assume that it can access the registers.  It is
only in specific cases where we have trustzone locking down these registers and
assigning them to other remote processors.
