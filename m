From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCH v2 net-next 04/10] net: eth: altera: add optional function
 to start tx dma
Date: Tue, 18 Dec 2018 09:34:20 -0600
Message-ID: <be74aff5-94a4-bc83-e2c2-c5a77dfd4cd1@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
 <20181213175252.21143-5-dalon.westergreen@linux.intel.com>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181213175252.21143-5-dalon.westergreen@linux.intel.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: dwesterg@gmail.com, netdev@vger.kernel.org, dinguyen@kernel.org, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, "mark.rutland@arm.commark.rutland"@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@intel.com>
List-Id: devicetree@vger.kernel.org

On 12/13/18 11:52 AM, dwesterg@gmail.com wrote:
> From: Dalon Westergreen <dalon.westergreen@intel.com>
> 
> Allow for optional start up of tx dma if the start_txdma
> function is defined in altera_dmaops.
> 
> Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
> ---
>   drivers/net/ethernet/altera/altera_tse.h      | 1 +
>   drivers/net/ethernet/altera/altera_tse_main.c | 5 +++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/altera/altera_tse.h b/drivers/net/ethernet/altera/altera_tse.h
> index d5b97e02e6d6..7f246040135d 100644
> --- a/drivers/net/ethernet/altera/altera_tse.h
> +++ b/drivers/net/ethernet/altera/altera_tse.h
> @@ -412,6 +412,7 @@ struct altera_dmaops {
>   	int (*init_dma)(struct altera_tse_private *priv);
>   	void (*uninit_dma)(struct altera_tse_private *priv);
>   	void (*start_rxdma)(struct altera_tse_private *priv);
> +	void (*start_txdma)(struct altera_tse_private *priv);
>   };
>   
>   /* This structure is private to each device.
> diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
> index 0c0e8f9bba9b..f6b6a14b1ce9 100644
> --- a/drivers/net/ethernet/altera/altera_tse_main.c
> +++ b/drivers/net/ethernet/altera/altera_tse_main.c
> @@ -1256,6 +1256,9 @@ static int tse_open(struct net_device *dev)
>   
>   	priv->dmaops->start_rxdma(priv);
>   
> +	if (priv->dmaops->start_txdma)
> +		priv->dmaops->start_txdma(priv);
> +
>   	/* Start MAC Rx/Tx */
>   	spin_lock(&priv->mac_cfg_lock);
>   	tse_set_mac(priv, true);
> @@ -1658,6 +1661,7 @@ static const struct altera_dmaops altera_dtype_sgdma = {
>   	.init_dma = sgdma_initialize,
>   	.uninit_dma = sgdma_uninitialize,
>   	.start_rxdma = sgdma_start_rxdma,
> +	.start_txdma = NULL,
>   };
>   
>   static const struct altera_dmaops altera_dtype_msgdma = {
> @@ -1677,6 +1681,7 @@ static const struct altera_dmaops altera_dtype_msgdma = {
>   	.init_dma = msgdma_initialize,
>   	.uninit_dma = msgdma_uninitialize,
>   	.start_rxdma = msgdma_start_rxdma,
> +	.start_txdma = NULL,
>   };
>   
>   static const struct of_device_id altera_tse_ids[] = {
> 
Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
