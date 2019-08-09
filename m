From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 04/14] net: phy: adin: add {write,read}_mmd hooks
Date: Fri, 9 Aug 2019 20:21:26 +0200
Message-ID: <eb89d746-cf4a-6586-f4c7-101e00765c08@gmail.com>
References: <20190809133552.21597-1-alexandru.ardelean@analog.com>
 <20190809133552.21597-5-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809133552.21597-5-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On 09.08.2019 15:35, Alexandru Ardelean wrote:
> Both ADIN1200 & ADIN1300 support Clause 45 access for some registers.
> The Extended Management Interface (EMI) registers are accessible via both
> Clause 45 (at register MDIO_MMD_VEND1) and using Clause 22.
> 
> However, the Clause 22 access for MMD regs differs from the standard one
> defined by 802.3. The ADIN PHYs  use registers ExtRegPtr (0x0010) and
> ExtRegData (0x0011) to access Clause 45 & EMI registers.
> 
> The indirect access is done via the following mechanism (for both R/W):
> 1. Write the address of the register in the ExtRegPtr
> 2. Read/write the value of the register (written at ExtRegPtr)
> 
> This mechanism is needed to manage configuration of chip settings and to
> access EEE registers (via Clause 22).
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/net/phy/adin.c | 46 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
> index 91ff26d08fd5..8973ad819b93 100644
> --- a/drivers/net/phy/adin.c
> +++ b/drivers/net/phy/adin.c
> @@ -14,6 +14,9 @@
>  #define PHY_ID_ADIN1200				0x0283bc20
>  #define PHY_ID_ADIN1300				0x0283bc30
>  
> +#define ADIN1300_MII_EXT_REG_PTR		0x0010
> +#define ADIN1300_MII_EXT_REG_DATA		0x0011
> +
>  #define ADIN1300_INT_MASK_REG			0x0018
>  #define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
>  #define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
> @@ -53,6 +56,45 @@ static int adin_phy_config_intr(struct phy_device *phydev)
>  			      ADIN1300_INT_MASK_EN);
>  }
>  
> +static int adin_read_mmd(struct phy_device *phydev, int devad, u16 regnum)
> +{
> +	struct mii_bus *bus = phydev->mdio.bus;
> +	int phy_addr = phydev->mdio.addr;
> +	int err;
> +
> +	if (phydev->is_c45) {

Similar to what we discussed regarding feature detection:
Flag is_c45 shouldn't be set with these PHY's, therefore this is dead code.

> +		u32 addr = MII_ADDR_C45 | (devad << 16) | (regnum & 0xffff);
> +
> +		return __mdiobus_read(bus, phy_addr, addr);
> +	}
> +
> +	err = __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_PTR, regnum);
> +	if (err)
> +		return err;
> +
> +	return __mdiobus_read(bus, phy_addr, ADIN1300_MII_EXT_REG_DATA);
> +}
> +
> +static int adin_write_mmd(struct phy_device *phydev, int devad, u16 regnum,
> +			  u16 val)
> +{
> +	struct mii_bus *bus = phydev->mdio.bus;
> +	int phy_addr = phydev->mdio.addr;
> +	int err;
> +
> +	if (phydev->is_c45) {
> +		u32 addr = MII_ADDR_C45 | (devad << 16) | (regnum & 0xffff);
> +
> +		return __mdiobus_write(bus, phy_addr, addr, val);
> +	}
> +
> +	err = __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_PTR, regnum);
> +	if (err)
> +		return err;
> +
> +	return __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_DATA, val);
> +}
> +
>  static struct phy_driver adin_driver[] = {
>  	{
>  		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1200),
> @@ -64,6 +106,8 @@ static struct phy_driver adin_driver[] = {
>  		.config_intr	= adin_phy_config_intr,
>  		.resume		= genphy_resume,
>  		.suspend	= genphy_suspend,
> +		.read_mmd	= adin_read_mmd,
> +		.write_mmd	= adin_write_mmd,
>  	},
>  	{
>  		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1300),
> @@ -75,6 +119,8 @@ static struct phy_driver adin_driver[] = {
>  		.config_intr	= adin_phy_config_intr,
>  		.resume		= genphy_resume,
>  		.suspend	= genphy_suspend,
> +		.read_mmd	= adin_read_mmd,
> +		.write_mmd	= adin_write_mmd,
>  	},
>  };
>  
> 
