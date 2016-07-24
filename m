From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 04/10] dmaending: qcom_hidma: configure DMA and MSI for OF
Date: Sun, 24 Jul 2016 12:03:12 +0530
Message-ID: <20160724063312.GZ9681@localhost>
References: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
 <1468867177-15007-5-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468867177-15007-5-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "timur@codeaurora.org" <timur@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cov@codeaurora.org" <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, "eric.auger@linaro.org" <eric.auger@linaro.org>, "agross@codeaurora.org" <agross@codeaurora.org>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Williams, Dan J" <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2016 at 12:09:31AM +0530, Sinan Kaya wrote:
> Configure the DMA bindings for the device tree based firmware.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  drivers/dma/qcom/hidma_mgmt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
> index c0e3653..fb30730 100644
> --- a/drivers/dma/qcom/hidma_mgmt.c
> +++ b/drivers/dma/qcom/hidma_mgmt.c
> @@ -375,8 +375,10 @@ static int __init hidma_mgmt_of_populate_channels(struct device_node *np)
>                         ret = -ENODEV;
>                         goto out;
>                 }
> +               of_node_get(child);
> +               new_pdev->dev.of_node = child;
>                 of_dma_configure(&new_pdev->dev, child);
> -
> +               of_msi_configure(&new_pdev->dev, child);

How would this work on non MSI platforms?

-- 
~Vinod
