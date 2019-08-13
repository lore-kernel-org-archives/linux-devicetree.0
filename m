From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v6 4/4] net: phy: realtek: Add LED configuration support
 for RTL8211E
Date: Tue, 13 Aug 2019 13:46:34 -0700
Message-ID: <20190813204634.GR250418@google.com>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-5-mka@chromium.org>
 <20190813201411.GL15047@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813201411.GL15047@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 10:14:11PM +0200, Andrew Lunn wrote:
> > +static int rtl8211e_config_led(struct phy_device *phydev, int led,
> > +			       struct phy_led_config *cfg)
> > +{
> > +	u16 lacr_bits = 0, lcr_bits = 0;
> > +	int oldpage, ret;
> > +
> 
> You should probably check that led is 0 or 1. 

Actually this PHY has up to 3 LEDs, but yes, good point to validate
the parameter. I'll wait a day or two for if there is other feedback
and send a new version with the check.

> Otherwise this looks good.

Thanks for the reviews!

Matthias
