From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dmaengine: add Qualcomm BAM dma driver
Date: Thu, 23 Jan 2014 16:50:13 -0600
Message-ID: <20140123225013.GA10036@qualcomm.com>
References: <1389380874-22753-1-git-send-email-agross@codeaurora.org>
 <201401172349.28229.arnd@arndb.de>
 <20140120225245.GA3530@qualcomm.com>
 <5548936.L46nLkuVIz@wuerfel>
 <20140121230103.GA3554@qualcomm.com>
 <9038342A-D629-479C-819B-EF5F4DB52B50@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9038342A-D629-479C-819B-EF5F4DB52B50@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vinod.koul@intel.com>, linux-arm-msm@vger.kernel.org, dmaengine <dmaengine@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 23, 2014 at 02:17:19PM -0600, Kumar Gala wrote:
[....]
> > 
> > 
> > Thanks for the clarification.  I think I'll probably do:
> > ARCH_MSM_DT || (COMPILE_TEST && ARM)
> 
> Didn?t you need it to be:
> 
> ARCH_MSM_DT || (COMPILE_TEST && OF && ARM)
> 
> - k

Yes.  That's the version I am going with.  I might be able to get away without the
OF if it compiles fine without it, provided it stubs out the OF stuff if the
config option is not present.

> 
> -- 
> Employee of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
