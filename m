From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 7/7] net: phy: realtek: configure RTL8211E LEDs
Date: Wed, 3 Jul 2019 22:10:32 +0200
Message-ID: <20190703201032.GG18473@lunn.ch>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-7-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190703193724.246854-7-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> +	for (i = 0; i < count; i++) {
> +		u32 val;
> +
> +		of_property_read_u32_index(dev->of_node,
> +					   "realtek,led-modes", i, &val);

Please validate the value, 0 - 7.

       Andrew
