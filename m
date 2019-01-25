From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] r8169: Load MAC address from device tree if present
Date: Fri, 25 Jan 2019 19:34:31 +0100
Message-ID: <59aa73fd-9cdc-8db8-b58e-ed106b084637@gmail.com>
References: <20190125101814.6262-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125101814.6262-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, "David S. Miller" <davem@davemloft.net>
Cc: Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25.01.2019 11:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> If the system was booted using a device tree and if the device tree
> contains a MAC address, use it instead of reading one from the EEPROM.
> This is useful in situations where the EEPROM isn't properly programmed
> or where the firmware wants to override the existing MAC address.
> 
I rarely see DT-configured boards with RTL8168 network. Do you add this
patch because of a specific board?
And you state "if EEPROM isn't properly programmed": Did you come across
such a case?

In general the patch is fine with me, I just want to understand the
motivation. One further comment see inline.
As of today we already have the option to set a MAC from userspace
via ethtool.

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Based on net-next.
> 
>  drivers/net/ethernet/realtek/r8169.c | 35 +++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
> index f574b6b557f9..fd9edd643ca5 100644
> --- a/drivers/net/ethernet/realtek/r8169.c
> +++ b/drivers/net/ethernet/realtek/r8169.c
> @@ -6957,6 +6957,21 @@ static int rtl_alloc_irq(struct rtl8169_private *tp)
>  	return pci_alloc_irq_vectors(tp->pci_dev, 1, 1, flags);
>  }
>  
[...]
> @@ -7252,20 +7268,13 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	u64_stats_init(&tp->rx_stats.syncp);
>  	u64_stats_init(&tp->tx_stats.syncp);
>  
> -	/* Get MAC address */
> -	switch (tp->mac_version) {
> -		u8 mac_addr[ETH_ALEN] __aligned(4);
> -	case RTL_GIGA_MAC_VER_35 ... RTL_GIGA_MAC_VER_38:
> -	case RTL_GIGA_MAC_VER_40 ... RTL_GIGA_MAC_VER_51:
> -		*(u32 *)&mac_addr[0] = rtl_eri_read(tp, 0xe0, ERIAR_EXGMAC);
> -		*(u16 *)&mac_addr[4] = rtl_eri_read(tp, 0xe4, ERIAR_EXGMAC);
> +	/* get MAC address */
> +	if (eth_platform_get_mac_address(&pdev->dev, mac_addr))
> +		rtl_read_mac_address(tp, mac_addr);
> +
> +	if (is_valid_ether_addr(mac_addr))

Here array mac_addr may be uninitialized (if platform defines no MAC
and chip version is not covered by the switch statement).

> +		rtl_rar_set(tp, mac_addr);
>  
> -		if (is_valid_ether_addr(mac_addr))
> -			rtl_rar_set(tp, mac_addr);
> -		break;
> -	default:
> -		break;
> -	}
>  	for (i = 0; i < ETH_ALEN; i++)
>  		dev->dev_addr[i] = RTL_R8(tp, MAC0 + i);
>  
> 
