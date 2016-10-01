From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V4 04/10] dmaengine: qcom_hidma: configure DMA and MSI
 for OF
Date: Sat, 1 Oct 2016 11:47:11 +0530
Message-ID: <20161001061710.GF2467@localhost>
References: <1475115167-5898-1-git-send-email-okaya@codeaurora.org>
 <1475115167-5898-5-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475115167-5898-5-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2016 at 10:12:41PM -0400, Sinan Kaya wrote:
> Configure the DMA bindings for the device tree based firmware.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  drivers/dma/qcom/hidma_mgmt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
> index 82f36e4..e8f6b84 100644
> --- a/drivers/dma/qcom/hidma_mgmt.c
> +++ b/drivers/dma/qcom/hidma_mgmt.c
> @@ -375,8 +375,11 @@ static int __init hidma_mgmt_of_populate_channels(struct device_node *np)
>  			ret = PTR_ERR(new_pdev);
>  			goto out;
>  		}
> +		of_node_get(child);
> +		new_pdev->dev.of_node = child;
>  		of_dma_configure(&new_pdev->dev, child);
> -
> +		of_msi_configure(&new_pdev->dev, child);
> +		of_node_put(child);

should this be done unconditionally? Dont we needto call this only for
platforms with msi?

>  		kfree(res);
>  		res = NULL;
>  	}
> -- 
> 1.9.1
> 

-- 
~Vinod
