From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/7] net: phy: icplus: rename IP101A_G_NO_IRQ to
 IP101A_G_IRQ_ALL_MASK
Date: Sun, 18 Nov 2018 18:06:30 +0100
Message-ID: <20181118170630.GE5591@lunn.ch>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
 <20181117182007.14791-6-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181117182007.14791-6-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 17, 2018 at 07:20:05PM +0100, Martin Blumenstingl wrote:
> The datasheet uses the name "All Mask" for this bit. Change the name of
> our #define to be consistent with the datasheet. While here also replace
> the tab between the #define and IP101A_G_IRQ_ALL_MASK with a space.
> No functional changes.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

I think this is the bit which confused Florian. Nice change, it makes
it a lot clearer what is going on.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
