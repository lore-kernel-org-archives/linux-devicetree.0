From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 5/8] net: phy: dp83867: Use unsigned
 variables to store unsigned properties
Date: Wed, 22 May 2019 20:59:35 +0200
Message-ID: <20190522185935.GC7281@lunn.ch>
References: <20190522184255.16323-1-tpiepho@impinj.com>
 <20190522184255.16323-5-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522184255.16323-5-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2019 at 06:43:24PM +0000, Trent Piepho wrote:
> The variables used to store u32 DT properties were signed ints.  This
> doesn't work properly if the value of the property were to overflow.
> Use unsigned variables so this doesn't happen.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
