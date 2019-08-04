From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 3/4] net: phy: realtek: Add helpers for accessing
 RTL8211E extension pages
Date: Sun, 4 Aug 2019 10:33:30 +0200
Message-ID: <71d817b9-7bcc-9f83-331d-1c3958c41f51@gmail.com>
References: <20190801190759.28201-1-mka@chromium.org>
 <20190801190759.28201-4-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190801190759.28201-4-mka@chromium.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On 01.08.2019 21:07, Matthias Kaehlcke wrote:
> The RTL8211E has extension pages, which can be accessed after
> selecting a page through a custom method. Add a function to
> modify bits in a register of an extension page and a helper for
> selecting an ext page. Use rtl8211e_modify_ext_paged() in
> rtl8211e_config_init() instead of doing things 'manually'.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v4:
> - don't add constant RTL8211E_EXT_PAGE, it's only used once,
>   use a literal instead
> - pass 'oldpage' to phy_restore_page() in rtl8211e_select_ext_page(),
>   not 'page'
> - return 'oldpage' in rtl8211e_select_ext_page()
> - use __phy_modify() in rtl8211e_modify_ext_paged() instead of
>   reimplementing __phy_modify_changed()
> - in rtl8211e_modify_ext_paged() return directly when
>   rtl8211e_select_ext_page() fails
> ---
>  drivers/net/phy/realtek.c | 48 +++++++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> index a669945eb829..e09d3b0da2c7 100644
> --- a/drivers/net/phy/realtek.c
> +++ b/drivers/net/phy/realtek.c
> @@ -53,6 +53,36 @@ static int rtl821x_write_page(struct phy_device *phydev, int page)
>  	return __phy_write(phydev, RTL821x_PAGE_SELECT, page);
>  }
>  
> +static int rtl8211e_select_ext_page(struct phy_device *phydev, int page)

The "extended page" mechanism doesn't exist on RTL8211E only. A prefix
rtl821x like in other functions may be better therefore.

> +{
> +	int ret, oldpage;
> +
> +	oldpage = phy_select_page(phydev, 7);
> +	if (oldpage < 0)
> +		return oldpage;
> +
> +	ret = __phy_write(phydev, RTL821x_EXT_PAGE_SELECT, page);
> +	if (ret)
> +		return phy_restore_page(phydev, oldpage, ret);
> +
> +	return oldpage;
> +}
> +
> +static int rtl8211e_modify_ext_paged(struct phy_device *phydev, int page,
> +				     u32 regnum, u16 mask, u16 set)
> +{
> +	int ret = 0;
> +	int oldpage;
> +
> +	oldpage = rtl8211e_select_ext_page(phydev, page);
> +	if (oldpage < 0)
> +		return oldpage;
> +
> +	ret = __phy_modify(phydev, regnum, mask, set);
> +
> +	return phy_restore_page(phydev, oldpage, ret);
> +}
> +
>  static int rtl8201_ack_interrupt(struct phy_device *phydev)
>  {
>  	int err;
> @@ -184,7 +214,7 @@ static int rtl8211f_config_init(struct phy_device *phydev)
>  
>  static int rtl8211e_config_init(struct phy_device *phydev)
>  {
> -	int ret = 0, oldpage;
> +	int ret;
>  	u16 val;
>  
>  	/* enable TX/RX delay for rgmii-* modes, and disable them for rgmii. */
> @@ -213,19 +243,9 @@ static int rtl8211e_config_init(struct phy_device *phydev)
>  	 * 2 = RX Delay, 1 = TX Delay, 0 = SELRGV (see original PHY datasheet
>  	 * for details).
>  	 */
> -	oldpage = phy_select_page(phydev, 0x7);
> -	if (oldpage < 0)
> -		goto err_restore_page;
> -
> -	ret = __phy_write(phydev, RTL821x_EXT_PAGE_SELECT, 0xa4);
> -	if (ret)
> -		goto err_restore_page;
> -
> -	ret = __phy_modify(phydev, 0x1c, RTL8211E_TX_DELAY | RTL8211E_RX_DELAY,
> -			   val);
> -
> -err_restore_page:
> -	return phy_restore_page(phydev, oldpage, ret);
> +	return rtl8211e_modify_ext_paged(phydev, 0xa4, 0x1c,
> +					 RTL8211E_TX_DELAY | RTL8211E_RX_DELAY,
> +					 val);
>  }
>  
>  static int rtl8211b_suspend(struct phy_device *phydev)
> 
