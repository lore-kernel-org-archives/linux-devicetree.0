From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] r8169: Load MAC address from device tree if present
Date: Fri, 25 Jan 2019 19:26:39 +0100
Message-ID: <42d32783-c433-b859-6ba4-f2864f034871@gmail.com>
References: <20190125101814.6262-1-thierry.reding@gmail.com>
 <20190125145711.GF12962@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125145711.GF12962@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <thierry.reding@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25.01.2019 15:57, Andrew Lunn wrote:
> On Fri, Jan 25, 2019 at 11:18:14AM +0100, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> If the system was booted using a device tree and if the device tree
>> contains a MAC address, use it instead of reading one from the EEPROM.
>> This is useful in situations where the EEPROM isn't properly programmed
>> or where the firmware wants to override the existing MAC address.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>> Based on net-next.
>>
>>  drivers/net/ethernet/realtek/r8169.c | 35 +++++++++++++++++-----------
>>  1 file changed, 22 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
>> index f574b6b557f9..fd9edd643ca5 100644
>> --- a/drivers/net/ethernet/realtek/r8169.c
>> +++ b/drivers/net/ethernet/realtek/r8169.c
>> @@ -6957,6 +6957,21 @@ static int rtl_alloc_irq(struct rtl8169_private *tp)
>>  	return pci_alloc_irq_vectors(tp->pci_dev, 1, 1, flags);
>>  }
>>  
>> +static void rtl_read_mac_address(struct rtl8169_private *tp,
>> +				 u8 mac_addr[ETH_ALEN])
>> +{
>> +	/* Get MAC address */
>> +	switch (tp->mac_version) {
>> +	case RTL_GIGA_MAC_VER_35 ... RTL_GIGA_MAC_VER_38:
>> +	case RTL_GIGA_MAC_VER_40 ... RTL_GIGA_MAC_VER_51:
>> +		*(u32 *)&mac_addr[0] = rtl_eri_read(tp, 0xe0, ERIAR_EXGMAC);
>> +		*(u16 *)&mac_addr[4] = rtl_eri_read(tp, 0xe4, ERIAR_EXGMAC);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>>  DECLARE_RTL_COND(rtl_link_list_ready_cond)
>>  {
>>  	return RTL_R8(tp, MCU) & LINK_LIST_RDY;
>> @@ -7148,6 +7163,7 @@ static int rtl_get_ether_clk(struct rtl8169_private *tp)
>>  static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  {
>>  	const struct rtl_cfg_info *cfg = rtl_cfg_infos + ent->driver_data;
>> +	u8 mac_addr[ETH_ALEN] __aligned(4);
> 
> Hi Thierry
> 
> Maybe now would be a good time to cleanup this __aligned(4), pointer
> aliasing, etc?
> 
Andrew, for my understanding: What do you think is wrong with the 
alignment requirement? It was introduced because we do a 32 bit access
to the start address of the array and want to avoid an unaligned access.

>> +	/* get MAC address */
>> +	if (eth_platform_get_mac_address(&pdev->dev, mac_addr))
>> +		rtl_read_mac_address(tp, mac_addr);
>> +
> 
> Maybe that could be made more readable with:
> 
>       err = eth_platform_get_mac_address(&pdev->dev, mac_addr);
>       if (err)
>       	 	rtl_read_mac_address(tp, mac_addr);
> 
> Thanks
> 	Andrew
> .
> 
