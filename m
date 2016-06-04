From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [Patch v6 05/10] firmware: qcom: scm: Convert to streaming DMA
 APIS
Date: Fri, 3 Jun 2016 17:04:52 -0700
Message-ID: <20160604000452.GY28218@codeaurora.org>
References: <1464996330-16952-1-git-send-email-andy.gross@linaro.org>
 <1464996330-16952-6-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464996330-16952-6-git-send-email-andy.gross@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, jilai wang <jilaiw@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 06/03, Andy Gross wrote:
> This patch converts the Qualcomm SCM driver to use the streaming DMA APIs
> for communication buffers.  This is being done so that the
> secure_flush_area call can be removed.  Using the DMA APIs will also make
> the SCM32 symmetric to the coming SCM64 code.
> 
> Signed-off-by: Andy Gross <andy.gross@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
