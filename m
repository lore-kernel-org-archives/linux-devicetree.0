From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 4/4] net: phy: realtek: configure RTL8211E LEDs
Date: Fri, 2 Aug 2019 20:18:40 +0200
Message-ID: <20190802181840.GP2099@lunn.ch>
References: <20190801190759.28201-1-mka@chromium.org>
 <20190801190759.28201-5-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190801190759.28201-5-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 01, 2019 at 12:07:59PM -0700, Matthias Kaehlcke wrote:
> Configure the RTL8211E LEDs behavior when the device tree property
> 'realtek,led-modes' is specified.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Hi Matthias

I was more thinking of adding a new driver call to the PHY driver API,
to configure an LED. Something like

rtl8211e_config_leds(phydev, int led, struct phy_led_config cfg);

It would be called by the phylib core after config_init(). But also,
thinking ahead to generic linux LED support, it could be called later
to reconfigure the LEDs to use a different trigger. The standard LED
sysfs interface would be used.

      Andrew
