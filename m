From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 6/8] net: phy: dp83867: IO impedance is not
 dependent on RGMII delay
Date: Wed, 22 May 2019 17:44:28 -0700 (PDT)
Message-ID: <20190522.174428.1897486876688266010.davem@davemloft.net>
References: <20190522184255.16323-1-tpiepho@impinj.com>
        <20190522184255.16323-6-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190522184255.16323-6-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: tpiepho@impinj.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 22 May 2019 18:43:25 +0000

> The driver would only set the IO impedance value when RGMII internal
> delays were enabled.  There is no reason for this.  Move the IO
> impedance block out of the RGMII delay block.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Applied.
