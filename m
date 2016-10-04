From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 net-next] net: phy: Add Edge-rate driver for Microsemi
 PHYs.
Date: Tue, 4 Oct 2016 16:34:50 +0200
Message-ID: <20161004143450.GP11677@lunn.ch>
References: <1475589845-29182-1-git-send-email-Raju.Lakkaraju@microsemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475589845-29182-1-git-send-email-Raju.Lakkaraju@microsemi.com>
Sender: netdev-owner@vger.kernel.org
To: Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, Allan.Nielsen@microsemi.com
List-Id: devicetree@vger.kernel.org

> v7:
> - As per review comment, Removed '-'s (minus) sign in Edge rate table. 

Still no exact match on the table. 

So if i specify a voltage of 3301, 53% slowdown it looks i will
actually get 0% slowdown and no error message. That is not very
helpful.

	Andrew
