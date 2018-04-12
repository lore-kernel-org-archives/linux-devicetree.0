From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/4] lan78xx: Read MAC address from DT if present
Date: Thu, 12 Apr 2018 16:06:40 +0200
Message-ID: <20180412140640.GL28963@lunn.ch>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-2-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523541336-145953-2-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Phil

> -			ret = lan78xx_write_reg(dev, RX_ADDRL, addr_lo);
> -			ret = lan78xx_write_reg(dev, RX_ADDRH, addr_hi);
> +		mac_addr = of_get_mac_address(dev->udev->dev.of_node);

It might be better to use the higher level eth_platform_get_mac_address().

   Andrew
