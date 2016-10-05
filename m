From: Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>
Subject: Re: [PATCH v7 net-next] net: phy: Add Edge-rate driver for Microsemi
 PHYs.
Date: Wed, 5 Oct 2016 14:06:43 +0530
Message-ID: <20161005083642.GA13404@microsemi.com>
References: <1475589845-29182-1-git-send-email-Raju.Lakkaraju@microsemi.com>
 <20161004143450.GP11677@lunn.ch>
Reply-To: <Raju.Lakkaraju@microsemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161004143450.GP11677@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, Allan.Nielsen@microsemi.com
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Thank you for review comment.

On Tue, Oct 04, 2016 at 04:34:50PM +0200, Andrew Lunn wrote:
> EXTERNAL EMAIL
> 
> 
> > v7:
> > - As per review comment, Removed '-'s (minus) sign in Edge rate table.
> 
> Still no exact match on the table.
> 
> So if i specify a voltage of 3301, 53% slowdown it looks i will
> actually get 0% slowdown and no error message. That is not very
> helpful.
> 

According to my understanding, User should choose the right VDDMAC voltage
(i.e. 3.3V or 2.5V or 1.8V or 1.5V).

Do you want me to add an error trace which will inform the user that the 
configured values can not be supported - or if the driver should pick 
the "closest" value it can support (or both).

Please suggest me.

>         Andrew

---
Thanks,
Raju.
