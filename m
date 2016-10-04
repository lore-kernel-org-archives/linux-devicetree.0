From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 net-next] net: phy: Add Edge-rate driver for Microsemi
 PHYs.
Date: Tue, 4 Oct 2016 14:53:19 +0200
Message-ID: <20161004125319.GK11677@lunn.ch>
References: <1475581272-12093-1-git-send-email-Raju.Lakkaraju@microsemi.com>
 <20161004115132.GG11677@lunn.ch>
 <20161004122648.GA12301@microsemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161004122648.GA12301@microsemi.com>
Sender: netdev-owner@vger.kernel.org
To: Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, Allan.Nielsen@microsemi.com
List-Id: devicetree@vger.kernel.org

> Regarding remove the -'s in table, PHY data sheet descript the
> concept of edge rate with table. I would like to keep the same table
> in driver.

The double negative makes the code ugly. Plus a negative slowdown is a
speed up! The kernel maintainability and sanity comes first, and if
the data sheet is crazy, because it uses negative slows downs, it
should be ignored. Get the data sheet fixed....

       Andrew
