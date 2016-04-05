From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2 2/5] dmaengine: qcom: bam_dma: clear BAM interrupt
 only if it is rised
Date: Tue, 5 Apr 2016 16:41:47 -0700
Message-ID: <20160405234141.GC11586@vkoul-mobl.iind.intel.com>
References: <1459896982-30171-1-git-send-email-stanimir.varbanov@linaro.org>
 <1459896982-30171-3-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459896982-30171-3-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, Pramod Gurav <gpramod@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 06, 2016 at 01:56:19AM +0300, Stanimir Varbanov wrote:

s/rised/raised ?

> Currently we write BAM_IRQ_CLR register with zero even when no
> BAM_IRQ occured. This write has some bad side effects when the
> BAM instance is for the crypto engine. In case of crypto engine
> some of the BAM registers are xPU protected and they cannot be
> controlled by the driver.

-- 
~Vinod
