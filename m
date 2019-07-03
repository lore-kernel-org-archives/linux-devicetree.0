From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 2/7] net: phy: realtek: Allow disabling RTL8211E EEE
 LED mode
Date: Wed, 3 Jul 2019 13:32:04 -0700
Message-ID: <20190703203204.GE250418@google.com>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-2-mka@chromium.org>
 <743dda1b-532d-175f-1f87-5d80ba4a2e94@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <743dda1b-532d-175f-1f87-5d80ba4a2e94@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jul 03, 2019 at 10:09:39PM +0200, Heiner Kallweit wrote:
> On 03.07.2019 21:37, Matthias Kaehlcke wrote:
> > EEE LED mode is enabled by default on the RTL8211E. Disable it when
> > the device tree property 'realtek,eee-led-mode-disable' exists.
> > 
> > The magic values to disable EEE LED mode were taken from the RTL8211E
> > datasheet, unfortunately they are not further documented.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > Changes in v2:
> > - patch added to the series
> > ---
> >  drivers/net/phy/realtek.c | 37 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> > index a669945eb829..eb815cbe1e72 100644
> > --- a/drivers/net/phy/realtek.c
> > +++ b/drivers/net/phy/realtek.c
> > @@ -9,8 +9,9 @@
> >   * Copyright (c) 2004 Freescale Semiconductor, Inc.
> >   */
> >  #include <linux/bitops.h>
> > -#include <linux/phy.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/phy.h>
> >  
> >  #define RTL821x_PHYSR				0x11
> >  #define RTL821x_PHYSR_DUPLEX			BIT(13)
> > @@ -26,6 +27,10 @@
> >  #define RTL821x_EXT_PAGE_SELECT			0x1e
> >  #define RTL821x_PAGE_SELECT			0x1f
> >  
> > +/* RTL8211E page 5 */
> > +#define RTL8211E_EEE_LED_MODE1			0x05
> > +#define RTL8211E_EEE_LED_MODE2			0x06
> > +
> >  #define RTL8211F_INSR				0x1d
> >  
> >  #define RTL8211F_TX_DELAY			BIT(8)
> > @@ -53,6 +58,35 @@ static int rtl821x_write_page(struct phy_device *phydev, int page)
> >  	return __phy_write(phydev, RTL821x_PAGE_SELECT, page);
> >  }
> >  
> > +static int rtl8211e_disable_eee_led_mode(struct phy_device *phydev)
> > +{
> 
> You define return type int but AFAICS the return value is never used,
> also in subsequent patches.

ok, I'll change it to void

> > +	int ret = 0;
> > +	int oldpage;
> > +
> > +	oldpage = phy_select_page(phydev, 5);
> > +	if (oldpage < 0)
> > +		goto out;
> > +
> > +	/* write magic values to disable EEE LED mode */
> > +	ret = __phy_write(phydev, RTL8211E_EEE_LED_MODE1, 0x8b82);
> > +	if (ret)
> > +		goto out;
> > +
> > +	ret = __phy_write(phydev, RTL8211E_EEE_LED_MODE2, 0x052b);
> > +
> > +out:
> > +	return phy_restore_page(phydev, oldpage, ret);
> > +}
> > +
> > +static int rtl8211e_config_init(struct phy_device *phydev)
> > +{
> > +	struct device *dev = &phydev->mdio.dev;
> > +
> > +	if (of_property_read_bool(dev->of_node, "realtek,eee-led-mode-disable"))
> > +		rtl8211e_disable_eee_led_mode(phydev);
> > +
> > +	return 0;
> > +}
> 
> I suppose checkpatch complains about the missing empty line.
> You add it in a later patch, in case of a v3 you could fix that.

Actually checkpatch does not complain, I'll fix it in v3.

Thanks

Matthias
