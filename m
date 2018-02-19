Return-Path: <robherring2@gmail.com>
Date: Mon, 19 Feb 2018 08:35:11 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: dmaengine: bam_dma: add remote
 controlled bindings
Message-ID: <20180219143511.2aei6ohteto4kjru@rob-hp-laptop>
References: <20180215122511.13517-1-srinivas.kandagatla@linaro.org>
 <20180215122511.13517-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180215122511.13517-3-srinivas.kandagatla@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: vinod.koul@intel.com, andy.gross@linaro.org, dmaengine@vger.kernel.org, mark.rutland@arm.com, david.brown@linaro.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 15, 2018 at 12:25:08PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patch adds 2 new properties for remote controlled bam dt bindings.
> 1. num-channels to indicate number of dma channels.
> 2. qcom,num-ees to indicate number of Execution Environments.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
