From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4] lan78xx: Read initial EEE setting from Device Tree
Date: Thu, 12 Apr 2018 16:16:30 +0200
Message-ID: <20180412141630.GM28963@lunn.ch>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-3-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523541336-145953-3-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 12, 2018 at 02:55:34PM +0100, Phil Elwell wrote:
> Add two new Device Tree properties:
> * microchip,eee-enabled  - a boolean to enable EEE
> * microchip,tx-lpi-timer - time in microseconds to wait after TX goes
>                            idle before entering the low power state
>                            (default 600)

Hi Phil

This looks wrong.

What should happen is that the MAC driver calls phy_init_eee() to find
out if the PHY supports EEE. There should be no need to look in device
tree.

	Andrew
