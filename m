From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 2/4] net: phy: Add support for generic LED
 configuration through the DT
Date: Wed, 7 Aug 2019 20:15:36 +0200
Message-ID: <20190807181536.GA26047@lunn.ch>
References: <20190807170449.205378-1-mka@chromium.org>
 <20190807170449.205378-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190807170449.205378-3-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> +	for_each_child_of_node(np, child) {
> +		u32 led;
> +
> +		if (of_property_read_u32(child, "reg", &led))
> +			goto skip_config;


> +
> +	skip_config:
> +		of_node_put(child);

There is no need for this put. So long as you don't break out of
for_each_child_of_node() with a return, it will correctly release
child at the end of each loop. A continue statement is also O.K.

      Andrew
