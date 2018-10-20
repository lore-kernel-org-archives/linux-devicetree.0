From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 net-next 0/2] Add support for Microchip Technology
 KSZ9131 10/100/1000 Ethernet PHY
Date: Fri, 19 Oct 2018 17:02:40 -0700 (PDT)
Message-ID: <20181019.170240.1751894482425967587.davem@davemloft.net>
References: <1539889562-21458-1-git-send-email-yuiko.oshino@microchip.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539889562-21458-1-git-send-email-yuiko.oshino@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yuiko.oshino@microchip.com
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, linux-kernel@vger.kernel.org, mark.rutland@arm.com, m.felsch@pengutronix.de, Markus.Niebel@tqs.de, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
List-Id: devicetree@vger.kernel.org

From: Yuiko Oshino <yuiko.oshino@microchip.com>
Date: Thu, 18 Oct 2018 15:06:00 -0400

> This is the initial driver for Microchip KSZ9131 10/100/1000 Ethernet PHY
> 
> v3:
> - KSZ9131 uses picosecond units for values of devicetree properties.
> - rewrite micrel.c and micrel-ksz90x1.txt to use the picosecond values.
> v2:
> - Creating a series from two related patches.

Series applied.
