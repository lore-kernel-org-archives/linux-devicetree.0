From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v3 6/6] dmaengine: qcom: bam_dma: rename
 BAM_MAX_DATA_SIZE define
Date: Tue, 12 Apr 2016 17:05:56 -0500
Message-ID: <20160412220556.GA24737@hector.attlocal.net>
References: <1460363923-16296-1-git-send-email-stanimir.varbanov@linaro.org>
 <1460363923-16296-7-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460363923-16296-7-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vinod.koul@intel.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Sinan Kaya <okaya@codeaurora.org>, Pramod Gurav <gpramod@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 11, 2016 at 11:38:43AM +0300, Stanimir Varbanov wrote:
> It seems that the define has not been with acurate name and
> makes confusion while reading the code. The more acurate
> name should be BAM_FIFO_SIZE.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Andy Gross <andy.gross@linaro.org>
