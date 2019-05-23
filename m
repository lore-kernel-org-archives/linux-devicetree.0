From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 8/8] net: phy: dp83867: Allocate state
 struct in probe
Date: Wed, 22 May 2019 17:44:41 -0700 (PDT)
Message-ID: <20190522.174441.2151424309076790135.davem@davemloft.net>
References: <20190522184255.16323-1-tpiepho@impinj.com>
        <20190522184255.16323-8-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190522184255.16323-8-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: tpiepho@impinj.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 22 May 2019 18:43:27 +0000

> This was being done in config the first time the phy was configured.
> Should be in the probe method.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Applied.
