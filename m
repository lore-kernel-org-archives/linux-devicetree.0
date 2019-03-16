From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
Date: Sat, 16 Mar 2019 03:54:48 +0100
Message-ID: <20190316025448.GD29548@lunn.ch>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314140135.19184-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
>> +static int _g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
>

You would generally use the _ prefix when you have a locked and an
unlocked version. I don't see anything like this here. So please drop
the _ .

Nice to see the generic clock framework being used. I just wonder if
this is the correct place to have this clock code. Can it be made part
of the SoC clock code?

    Andrew
