From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dmaengine: qcom_bam_dma: Bypass BAM init if not
 managed locally
Date: Wed, 23 Mar 2016 10:09:10 -0500
Message-ID: <20160323150910.GA16272@rob-hp-laptop>
References: <1458640151-15150-1-git-send-email-gpramod@codeaurora.org>
 <1458640151-15150-3-git-send-email-gpramod@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458640151-15150-3-git-send-email-gpramod@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Gurav <gpramod@codeaurora.org>
Cc: andy.gross@linaro.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, dan.j.williams@intel.com, vinod.koul@intel.com, okaya@codeaurora.org, architt@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 22, 2016 at 03:19:11PM +0530, Pramod Gurav wrote:
> On some QOCM platforms BAM control registers are managed remotely

s/QOCM/QCOM/

> hence can not be accessed by application processor for writes. Pass
> a DT property qcom,bam_ctrl_remote to declare the same to skip bam_init.

Is this a property of specific SOCs or a configuration option? If the 
former, use the SOC specific compatible string to determine this option.
 
> Move the pipe number initialisation from bam_init to probe functiom
> as it should be done for all platforms.
> 
> Signed-off-by: Pramod Gurav <gpramod@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_bam_dma.txt |  3 +++
>  drivers/dma/qcom/bam_dma.c                             | 18 +++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> index 1c9d48e..46e33ae 100644
> --- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> @@ -13,6 +13,8 @@ Required properties:
>  - clock-names: must contain "bam_clk" entry
>  - qcom,ee : indicates the active Execution Environment identifier (0-7) used in
>    the secure world.
> +- qcom,bam_ctrl_remote: Use when BAM global device control is managed remotely

Don't use '_' in property names.

> +  and not locally by the application processor.
>  
>  Example:
>  
> @@ -24,6 +26,7 @@ Example:
>  		clock-names = "bam_clk";
>  		#dma-cells = <1>;
>  		qcom,ee = <0>;
> +		qcom,bam_ctrl_remote;
>  	};
>  
>  DMA clients must use the format described in the dma.txt file, using a two cell
