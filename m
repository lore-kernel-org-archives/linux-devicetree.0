From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCH v2 net-next 03/10] net: eth: altera: fix altera_dmaops
 declaration
Date: Tue, 18 Dec 2018 09:33:48 -0600
Message-ID: <5e34b170-4365-e4a6-18e8-bb2396ad85a9@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
 <20181213175252.21143-4-dalon.westergreen@linux.intel.com>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181213175252.21143-4-dalon.westergreen@linux.intel.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: dwesterg@gmail.com, netdev@vger.kernel.org, dinguyen@kernel.org, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, "mark.rutland@arm.commark.rutland"@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@intel.com>
List-Id: devicetree@vger.kernel.org

On 12/13/18 11:52 AM, dwesterg@gmail.com wrote:
> From: Dalon Westergreen <dalon.westergreen@intel.com>
> 
> The declaration of struct altera_dmaops does not have
> identifier names.  Add identifier names to confrom with
> required coding styles.
> 
> Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
> ---
>   drivers/net/ethernet/altera/altera_tse.h | 30 +++++++++++++-----------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/altera/altera_tse.h b/drivers/net/ethernet/altera/altera_tse.h
> index e2feee87180a..d5b97e02e6d6 100644
> --- a/drivers/net/ethernet/altera/altera_tse.h
> +++ b/drivers/net/ethernet/altera/altera_tse.h
> @@ -396,20 +396,22 @@ struct altera_tse_private;
>   struct altera_dmaops {
>   	int altera_dtype;
>   	int dmamask;
> -	void (*reset_dma)(struct altera_tse_private *);
> -	void (*enable_txirq)(struct altera_tse_private *);
> -	void (*enable_rxirq)(struct altera_tse_private *);
> -	void (*disable_txirq)(struct altera_tse_private *);
> -	void (*disable_rxirq)(struct altera_tse_private *);
> -	void (*clear_txirq)(struct altera_tse_private *);
> -	void (*clear_rxirq)(struct altera_tse_private *);
> -	int (*tx_buffer)(struct altera_tse_private *, struct tse_buffer *);
> -	u32 (*tx_completions)(struct altera_tse_private *);
> -	void (*add_rx_desc)(struct altera_tse_private *, struct tse_buffer *);
> -	u32 (*get_rx_status)(struct altera_tse_private *);
> -	int (*init_dma)(struct altera_tse_private *);
> -	void (*uninit_dma)(struct altera_tse_private *);
> -	void (*start_rxdma)(struct altera_tse_private *);
> +	void (*reset_dma)(struct altera_tse_private *priv);
> +	void (*enable_txirq)(struct altera_tse_private *priv);
> +	void (*enable_rxirq)(struct altera_tse_private *priv);
> +	void (*disable_txirq)(struct altera_tse_private *priv);
> +	void (*disable_rxirq)(struct altera_tse_private *priv);
> +	void (*clear_txirq)(struct altera_tse_private *priv);
> +	void (*clear_rxirq)(struct altera_tse_private *priv);
> +	int (*tx_buffer)(struct altera_tse_private *priv,
> +			 struct tse_buffer *buffer);
> +	u32 (*tx_completions)(struct altera_tse_private *priv);
> +	void (*add_rx_desc)(struct altera_tse_private *priv,
> +			    struct tse_buffer *buffer);
> +	u32 (*get_rx_status)(struct altera_tse_private *priv);
> +	int (*init_dma)(struct altera_tse_private *priv);
> +	void (*uninit_dma)(struct altera_tse_private *priv);
> +	void (*start_rxdma)(struct altera_tse_private *priv);
>   };
>   
>   /* This structure is private to each device.
> 
Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
