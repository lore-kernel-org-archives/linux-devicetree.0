From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] dmaengine: qcom_bam_dma: Add support for v1.3.0
Date: Mon, 18 Aug 2014 07:23:35 +0100
Message-ID: <53F19BE7.6070300@linaro.org>
References: <1397684719-30065-1-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397684719-30065-1-git-send-email-agross@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>
Cc: devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andy,
Any plans to respin these patches with Stanimir's comments?

thanks,
srini


On 16/04/14 22:45, Andy Gross wrote:
> This set of patches adds support for the v1.3.0 version of the QCOM BAM
> dmaengine driver.  The older version of the BAM is present in the MSM8x64,
> APQ8064, and IPQ8064 processors.
>
> Due to register address space changes between versions, all of the register
> accesses have to be calculated using different offsets and multipliers that are
> specific to that version of the IP block.
>
> Andy Gross (2):
>    dmaengine: qcom_bam_dma: Add v1.3.0 driver support
>    dmaengine: qcom_bam_dma: Add binding for v1.3.0
>
>   .../devicetree/bindings/dma/qcom_bam_dma.txt       |    4 +-
>   drivers/dma/qcom_bam_dma.c                         |  177 +++++++++++++-------
>   2 files changed, 117 insertions(+), 64 deletions(-)
>
