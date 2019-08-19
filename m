From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 4/4] net: phy: realtek: Add LED configuration support
 for RTL8211E
Date: Mon, 19 Aug 2019 02:37:57 +0200
Message-ID: <20190819003757.GB8981@lunn.ch>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-5-mka@chromium.org>
 <20190816201342.GB1646@bug>
 <20190816212728.GW250418@google.com>
 <20190817140502.GA5878@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190817140502.GA5878@amd>
Sender: netdev-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Matthias Kaehlcke <mka@chromium.org>, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, dmurphy@ti.com, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> Yes, I believe the integration is neccessary. Using same binding is
> neccessary for that, but not sufficient. For example, we need
> compatible trigger names, too.

Hi Pavel

Please could you explain what you mean by compatible trigger names?

> So... I'd really like to see proper integration is possible before we
> merge this.

Please let me turn that around. What do you see as being impossible at
the moment? What do we need to convince you about?

    Thanks
	Andrew
