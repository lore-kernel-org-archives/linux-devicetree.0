From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 net-next 0/2] Add support for Microchip Technology
 KSZ9131 10/100/1000 Ethernet PHY
Date: Thu, 27 Sep 2018 12:28:31 -0700
Message-ID: <7c84dfed-6864-7b25-38d1-9bed1cfea0bc@gmail.com>
References: <1538079344-6152-1-git-send-email-yuiko.oshino@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538079344-6152-1-git-send-email-yuiko.oshino@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yuiko Oshino <yuiko.oshino@microchip.com>, davem@davemloft.net, robh+dt@kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, m.felsch@pengutronix.de, Markus.Niebel@tqs.de, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
List-Id: devicetree@vger.kernel.org

On 09/27/2018 01:15 PM, Yuiko Oshino wrote:
> This is the initial driver for Microchip KSZ9131 10/100/1000 Ethernet PHY
> 
> v2:
> - Creating a series from two related patches.

When people give you Acked-by or Reviewed-by tags in prior versions, it
is usually a good  practice to add them to your next version of the
patch submission. Also, your patches 1 and 2 did not show up as as reply
to this cover letter, while they should, please fix this if you ever
need to submit new patches in the future.

Thank you!

> 
> Yuiko Oshino (2):
>   net: phy: micrel: add Microchip KSZ9131 inital driver
>   dt-bindings: net: add support for Microchip KSZ9131 Ethernet PHY
> 
>  .../devicetree/bindings/net/micrel-ksz90x1.txt     | 29 +++++++++++++++++++-
>  drivers/net/phy/micrel.c                           | 32 ++++++++++++++++++++--
>  include/linux/micrel_phy.h                         |  1 +
>  3 files changed, 58 insertions(+), 4 deletions(-)
> 


-- 
Florian
