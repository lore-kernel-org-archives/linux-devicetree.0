From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 2/3] net: phy: realtek: Enable accessing RTL8211E
 extension pages
Date: Mon, 1 Jul 2019 22:43:12 +0200
Message-ID: <d2386f7d-b4bc-d983-1b83-cc2aa4aec38b@gmail.com>
References: <20190701195225.120808-1-mka@chromium.org>
 <20190701195225.120808-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190701195225.120808-2-mka@chromium.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On 01.07.2019 21:52, Matthias Kaehlcke wrote:
> The RTL8211E has extension pages, which can be accessed after
> selecting a page through a custom method. Add a function to
> modify bits in a register of an extension page and a few
> helpers for dealing with ext pages.
> 
> rtl8211e_modify_ext_paged() and rtl821e_restore_page() are
> inspired by their counterparts phy_modify_paged() and
> phy_restore_page().
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> This code might be applicable to other Realtek PHYs, but I don't
> have access to the datasheets to confirm it, so for now it's just
> for the RTL8211E.
> 
This extended page mechanism exists on a number of older Realtek
PHY's. For most extended pages however Realtek releases no public
documentation.
Considering that we use these helpers in one place only,  I don't
really see a need for them.

>  drivers/net/phy/realtek.c | 61 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> index a669945eb829..dfc2e20ef335 100644
> --- a/drivers/net/phy/realtek.c
> +++ b/drivers/net/phy/realtek.c
> @@ -26,6 +26,9 @@
>  #define RTL821x_EXT_PAGE_SELECT			0x1e
>  #define RTL821x_PAGE_SELECT			0x1f
>  
> +#define RTL8211E_EXT_PAGE			7
> +#define RTL8211E_EPAGSR				0x1e
> +
>  #define RTL8211F_INSR				0x1d
>  
>  #define RTL8211F_TX_DELAY			BIT(8)
> @@ -53,6 +56,64 @@ static int rtl821x_write_page(struct phy_device *phydev, int page)
>  	return __phy_write(phydev, RTL821x_PAGE_SELECT, page);
>  }
>  
> +static int rtl821e_select_ext_page(struct phy_device *phydev, int page)
> +{
> +	int rc;
> +
> +	rc = phy_write(phydev, RTL821x_PAGE_SELECT, RTL8211E_EXT_PAGE);
> +	if (rc)
> +		return rc;
> +
> +	return phy_write(phydev, RTL8211E_EPAGSR, page);
> +}
> +
> +static int rtl821e_restore_page(struct phy_device *phydev, int oldpage, int ret)
> +{
> +	int r;
> +
> +	if (oldpage >= 0) {
> +		r = phy_write(phydev, RTL821x_PAGE_SELECT, oldpage);
> +
> +		/* Propagate the operation return code if the page write
> +		 * was successful.
> +		 */
> +		if (ret >= 0 && r < 0)
> +			ret = r;
> +	} else {
> +		/* Propagate the page selection error code */
> +		ret = oldpage;
> +	}
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused rtl8211e_modify_ext_paged(struct phy_device *phydev,
> +				    int page, u32 regnum, u16 mask, u16 set)
> +{
> +	int ret = 0;
> +	int oldpage;
> +	int new;
> +
> +	oldpage = phy_read(phydev, RTL821x_PAGE_SELECT);
> +	if (oldpage < 0)
> +		goto out;
> +
> +	ret = rtl821e_select_ext_page(phydev, page);
> +	if (ret)
> +		goto out;
> +
> +	ret = phy_read(phydev, regnum);
> +	if (ret < 0)
> +		goto out;
> +
> +	new = (ret & ~mask) | set;
> +	if (new != ret)
> +		ret = phy_write(phydev, regnum, new);
> +
> +out:
> +	return rtl821e_restore_page(phydev, oldpage, ret);
> +}
> +
>  static int rtl8201_ack_interrupt(struct phy_device *phydev)
>  {
>  	int err;
> 
