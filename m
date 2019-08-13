From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 2/4] net: phy: Add support for generic LED
 configuration through the DT
Date: Tue, 13 Aug 2019 21:56:33 +0200
Message-ID: <20190813195633.GJ15047@lunn.ch>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813191147.19936-3-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 12:11:45PM -0700, Matthias Kaehlcke wrote:
> For PHYs with a device tree node look for LED trigger configuration
> using the generic binding, if it exists try to apply it via the new
> driver hook .config_led.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
