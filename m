From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCH v2 net-next 02/10] net: eth: altera: set rx and tx ring
 size before init_dma call
Date: Tue, 18 Dec 2018 09:33:10 -0600
Message-ID: <5b3859d1-93c2-06e2-b2da-65a30fdd54da@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
 <20181213175252.21143-3-dalon.westergreen@linux.intel.com>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181213175252.21143-3-dalon.westergreen@linux.intel.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: dwesterg@gmail.com, netdev@vger.kernel.org, dinguyen@kernel.org, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, "mark.rutland@arm.commark.rutland"@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@intel.com>
List-Id: devicetree@vger.kernel.org

On 12/13/18 11:52 AM, dwesterg@gmail.com wrote:
> From: Dalon Westergreen <dalon.westergreen@intel.com>
> 
> It is more appropriate to set the rx and tx ring size before calling
> the init function for the dma.
> 
> Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
> ---
>   drivers/net/ethernet/altera/altera_tse_main.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
> index dcb330129e23..0c0e8f9bba9b 100644
> --- a/drivers/net/ethernet/altera/altera_tse_main.c
> +++ b/drivers/net/ethernet/altera/altera_tse_main.c
> @@ -1166,6 +1166,10 @@ static int tse_open(struct net_device *dev)
>   	int i;
>   	unsigned long int flags;
>   
> +	/* set tx and rx ring size */
> +	priv->rx_ring_size = dma_rx_num;
> +	priv->tx_ring_size = dma_tx_num;
> +
>   	/* Reset and configure TSE MAC and probe associated PHY */
>   	ret = priv->dmaops->init_dma(priv);
>   	if (ret != 0) {
> @@ -1208,8 +1212,6 @@ static int tse_open(struct net_device *dev)
>   	priv->dmaops->reset_dma(priv);
>   
>   	/* Create and initialize the TX/RX descriptors chains. */
> -	priv->rx_ring_size = dma_rx_num;
> -	priv->tx_ring_size = dma_tx_num;
>   	ret = alloc_init_skbufs(priv);
>   	if (ret) {
>   		netdev_err(dev, "DMA descriptors initialization failed\n");
> 
Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
