From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 0/2] Bypass BAM init if Remotely controlled
Date: Tue, 5 Apr 2016 16:21:20 -0500
Message-ID: <20160405212120.GA3873@hector.attlocal.net>
References: <1458640151-15150-1-git-send-email-gpramod@codeaurora.org>
 <56F116AC.2000704@mm-sol.com>
 <20160405181950.GD8930@vkoul-mobl.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160405181950.GD8930@vkoul-mobl.iind.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>, Pramod Gurav <gpramod@codeaurora.org>, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, dan.j.williams@intel.com, okaya@codeaurora.org, architt@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 05, 2016 at 11:19:50AM -0700, Vinod Koul wrote:
> On Tue, Mar 22, 2016 at 11:55:56AM +0200, Stanimir Varbanov wrote:
> > On 03/22/2016 11:49 AM, Pramod Gurav wrote:
> > > On some QOCM platforms(eg 8996) BAM control registers are managed remotely
> > > hence can not be accessed by application processor for writes. So skip the bam_init
> > > for any such platform if DT property is set.
> > > 
> > > Tested on 8996 (BAM Global control is through remote) and DB410C boards.
> > > Tested with i2c DMA on these targets which uses BAM as DMA controller.
> > 
> > I have similar patches at [1] already, could you check them first.
> 
> was there an update posted on these? I dont have this series or an update in
> my queue

No updates that I can see.  The original is here:

https://lkml.org/lkml/2015/12/1/113
