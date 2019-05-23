From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 3/8] net: phy: dp83867: Add ability to
 disable output clock
Date: Wed, 22 May 2019 17:44:08 -0700 (PDT)
Message-ID: <20190522.174408.2115994822395295597.davem@davemloft.net>
References: <20190522184255.16323-1-tpiepho@impinj.com>
        <20190522184255.16323-3-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190522184255.16323-3-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: tpiepho@impinj.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 22 May 2019 18:43:22 +0000

> Generally, the output clock pin is only used for testing and only serves
> as a source of RF noise after this.  It could be used to daisy-chain
> PHYs, but this is uncommon.  Since the PHY can disable the output, make
> doing so an option.  I do this by adding another enumeration to the
> allowed values of ti,clk-output-sel.
> 
> The code was not using the value DP83867_CLK_O_SEL_REF_CLK as one might
> expect: to select the REF_CLK as the output.  Rather it meant "keep
> clock output setting as is", which, depending on PHY strapping, might
> not be outputting REF_CLK.
> 
> Change this so DP83867_CLK_O_SEL_REF_CLK means enable REF_CLK output.
> Omitting the property will leave the setting as is (which was the
> previous behavior in this case).
> 
> Out of range values were silently converted into
> DP83867_CLK_O_SEL_REF_CLK.  Change this so they generate an error.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Applied.
