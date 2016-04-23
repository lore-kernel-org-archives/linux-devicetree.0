From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 6/8] firmware: qcom: scm: Add memory allocation API
Date: Fri, 22 Apr 2016 23:45:59 -0500
Message-ID: <20160423044559.GB6968@hector.attlocal.net>
References: <1461363432-5730-1-git-send-email-andy.gross@linaro.org>
 <1461363432-5730-7-git-send-email-andy.gross@linaro.org>
 <20160422232331.GG3202@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160422232331.GG3202@tuxbot>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, jilai wang <jilaiw@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 22, 2016 at 04:23:31PM -0700, Bjorn Andersson wrote:
> On Fri 22 Apr 15:17 PDT 2016, Andy Gross wrote:
> 
> > This patch adds APIs for the scm-32 and scm-64 to use for coherent memory
> > allocation.
> > 
> > Signed-off-by: Andy Gross <andy.gross@linaro.org>
> 
> This patch must come before the ARM64 implementation.

Oops I got my order a little mixed up.  I can shift it around or just redo the
commit message.  I am going to switch the scm-32 to use this as well.

> 
> > ---
> >  drivers/firmware/qcom_scm.c | 17 +++++++++++++++++
> >  drivers/firmware/qcom_scm.h |  4 ++++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> [..]
> > +
> > +void qcom_scm_free_buffer(size_t size, void *cpu_addr,
> > +				 dma_addr_t dma_addr)
> > +{
> > +	if (__scm)
> 
> This would be quite bad and the caller expects that the memory is
> released when you return from here. This should also only happen if the
> arch specific implementation is buggy, so just let it go BANG!

Agreed.

> 
> > +		dma_free_writecombine(__scm->dev, size, cpu_addr, dma_addr);
> > +}
> > +

Thanks for the review
