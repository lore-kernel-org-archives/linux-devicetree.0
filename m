From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/3] lan78xx: Read LED states from Device Tree
Date: Wed, 18 Apr 2018 18:11:21 +0200
Message-ID: <20180418161121.GD3036@lunn.ch>
References: <1524066323-109628-1-git-send-email-phil@raspberrypi.org>
 <1524066323-109628-3-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524066323-109628-3-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 18, 2018 at 04:45:22PM +0100, Phil Elwell wrote:
> Add support for DT property "microchip,led-modes", a vector of zero
> to four cells (u32s) in the range 0-15, each of which sets the mode
> for one of the LEDs. Some possible values are:
> 
>     0=link/activity          1=link1000/activity
>     2=link100/activity       3=link10/activity
>     4=link100/1000/activity  5=link10/1000/activity
>     6=link10/100/activity    14=off    15=on
> 
> These values are given symbolic constants in a dt-bindings header.
> 
> Also use the presence of the DT property to indicate that the
> LEDs should be enabled - necessary in the event that no valid OTP
> or EEPROM is available.

Hi Phil

As i said last week, these are PHY properties, so should be in the PHY
node in device tree. It should be the PHY driver which parses these
properties and configures the LEDs, not the MAC.

	   Andrew
