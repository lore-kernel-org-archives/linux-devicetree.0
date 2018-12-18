From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCH v2 net-next 01/10] net: eth: altera: tse_start_xmit
 ignores tx_buffer call response
Date: Tue, 18 Dec 2018 09:32:54 -0600
Message-ID: <ef8f7984-365c-12c8-9c9c-8945d67f1cfd@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
 <20181213175252.21143-2-dalon.westergreen@linux.intel.com>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181213175252.21143-2-dalon.westergreen@linux.intel.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: dwesterg@gmail.com, netdev@vger.kernel.org, dinguyen@kernel.org, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, "mark.rutland@arm.commark.rutland"@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@intel.com>
List-Id: devicetree@vger.kernel.org

Hi Dalon,

On 12/13/18 11:52 AM, dwesterg@gmail.com wrote:
> From: Dalon Westergreen <dalon.westergreen@intel.com>
> 
> The return from tx_buffer call in tse_start_xmit is
> inapropriately ignored.  tse_buffer calls should return
> 0 for success or NETDEV_TX_BUSY.  tse_start_xmit should
> return not report a successful transmit when the tse_buffer
> call returns an error condition.
> 
> In addition to the above, the msgdma and sgdma do not return
> the same value on success or failure.  The sgdma_tx_buffer
> returned 0 on failure and a positive number of transmitted
> packets on success.  Given that it only ever sends 1 packet,
> this made no sense.  The msgdma implementation msgdma_tx_buffer
> returns 0 on success.
> 
>    -> Don't ignore the return from tse_buffer calls
>    -> Fix sgdma tse_buffer call to return 0 on success
>       and NETDEV_TX_BUSY on failure.
> 
> Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
> ---
>   drivers/net/ethernet/altera/altera_sgdma.c    | 14 ++++++++------
>   drivers/net/ethernet/altera/altera_tse_main.c |  4 +++-
>   2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/altera/altera_sgdma.c b/drivers/net/ethernet/altera/altera_sgdma.c
> index 88ef67a998b4..eb47b9b820bb 100644
> --- a/drivers/net/ethernet/altera/altera_sgdma.c
> +++ b/drivers/net/ethernet/altera/altera_sgdma.c
> @@ -15,6 +15,7 @@
>    */
>   
>   #include <linux/list.h>
> +#include <linux/netdevice.h>
>   #include "altera_utils.h"
>   #include "altera_tse.h"
>   #include "altera_sgdmahw.h"
> @@ -170,10 +171,11 @@ void sgdma_clear_txirq(struct altera_tse_private *priv)
>   		    SGDMA_CTRLREG_CLRINT);
>   }
>   
> -/* transmits buffer through SGDMA. Returns number of buffers
> - * transmitted, 0 if not possible.
> - *
> - * tx_lock is held by the caller
> +/* transmits buffer through SGDMA.
> + *   original behavior returned the number of transmitted packets (always 1) &
> + *   returned 0 on error.  This differs from the msgdma.  the calling function
> + *   will now actually look at the code, so from now, 0 is good and return
> + *   NETDEV_TX_BUSY when busy.
>    */
>   int sgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
>   {
> @@ -185,7 +187,7 @@ int sgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
>   
>   	/* wait 'til the tx sgdma is ready for the next transmit request */
>   	if (sgdma_txbusy(priv))
> -		return 0;
> +		return NETDEV_TX_BUSY;
>   
>   	sgdma_setup_descrip(cdesc,			/* current descriptor */
>   			    ndesc,			/* next descriptor */
> @@ -202,7 +204,7 @@ int sgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
>   	/* enqueue the request to the pending transmit queue */
>   	queue_tx(priv, buffer);
>   
> -	return 1;
> +	return 0;
>   }
>   
>   
> diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
> index baca8f704a45..dcb330129e23 100644
> --- a/drivers/net/ethernet/altera/altera_tse_main.c
> +++ b/drivers/net/ethernet/altera/altera_tse_main.c
> @@ -606,7 +606,9 @@ static int tse_start_xmit(struct sk_buff *skb, struct net_device *dev)
>   	buffer->dma_addr = dma_addr;
>   	buffer->len = nopaged_len;
>   
> -	priv->dmaops->tx_buffer(priv, buffer);
> +	ret = priv->dmaops->tx_buffer(priv, buffer);
> +	if (ret)
> +		goto out;
>   
>   	skb_tx_timestamp(skb);
>   
> 
If the content hasn't changed, you can just include my previous Acked-by 
under your Signed-off-by in the subsequent versions. For now though,

Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
