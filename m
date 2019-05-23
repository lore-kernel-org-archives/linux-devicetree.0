From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 5/8] net: phy: dp83867: Use unsigned
 variables to store unsigned properties
Date: Wed, 22 May 2019 17:44:22 -0700 (PDT)
Message-ID: <20190522.174422.2007799425271972845.davem@davemloft.net>
References: <20190522184255.16323-1-tpiepho@impinj.com>
        <20190522184255.16323-5-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190522184255.16323-5-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: tpiepho@impinj.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 22 May 2019 18:43:24 +0000

> The variables used to store u32 DT properties were signed ints.  This
> doesn't work properly if the value of the property were to overflow.
> Use unsigned variables so this doesn't happen.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Applied.
