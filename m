From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 6/8] firmware: qcom: scm: Add memory allocation API
Date: Fri, 22 Apr 2016 16:23:31 -0700
Message-ID: <20160422232331.GG3202@tuxbot>
References: <1461363432-5730-1-git-send-email-andy.gross@linaro.org>
 <1461363432-5730-7-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461363432-5730-7-git-send-email-andy.gross@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, jilai wang <jilaiw@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri 22 Apr 15:17 PDT 2016, Andy Gross wrote:

> This patch adds APIs for the scm-32 and scm-64 to use for coherent memory
> allocation.
> 
> Signed-off-by: Andy Gross <andy.gross@linaro.org>

This patch must come before the ARM64 implementation.

> ---
>  drivers/firmware/qcom_scm.c | 17 +++++++++++++++++
>  drivers/firmware/qcom_scm.h |  4 ++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
[..]
> +
> +void qcom_scm_free_buffer(size_t size, void *cpu_addr,
> +				 dma_addr_t dma_addr)
> +{
> +	if (__scm)

This would be quite bad and the caller expects that the memory is
released when you return from here. This should also only happen if the
arch specific implementation is buggy, so just let it go BANG!

> +		dma_free_writecombine(__scm->dev, size, cpu_addr, dma_addr);
> +}
> +

Regards,
Bjorn
