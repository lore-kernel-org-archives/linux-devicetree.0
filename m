From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 01/10] Documentation: DT: qcom_hidma: update binding for
 MSI
Date: Tue, 19 Jul 2016 11:37:55 +0100
Message-ID: <20160719103755.GC27022@leverpostej>
References: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
 <1468867177-15007-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468867177-15007-2-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 18, 2016 at 02:39:28PM -0400, Sinan Kaya wrote:
> Adding a new binding for qcom,hidma-1.1 to distinguish HW supporting
> MSI interrupts from the older revision.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> index fd5618b..45ce75b 100644
> --- a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> @@ -47,7 +47,8 @@ When the OS is not in control of the management interface (i.e. it's a guest),
>  the channel nodes appear on their own, not under a management node.
>  
>  Required properties:
> -- compatible: must contain "qcom,hidma-1.0"
> +- compatible: must contain "qcom,hidma-1.0" for initial HW or "qcom,hidma-1.1"
> +for MSI capable HW.

Don't we need properties to describe the MSI details (e.g. sideband data
like DeviceID)?

Thanks,
Mark.

>  - reg: Addresses for the transfer and event channel
>  - interrupts: Should contain the event interrupt
>  - desc-count: Number of asynchronous requests this channel can handle
> -- 
> 1.8.2.1
> 
