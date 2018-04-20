From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v4 0/3] lan78xx: Read configuration from Device Tree
Date: Fri, 20 Apr 2018 11:39:27 -0400 (EDT)
Message-ID: <20180420.113927.810364321398349353.davem@davemloft.net>
References: <1524157180-27276-1-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524157180-27276-1-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: phil@raspberrypi.org
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, mchehab@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, akpm@linux-foundation.org, rdunlap@infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Phil Elwell <phil@raspberrypi.org>
Date: Thu, 19 Apr 2018 17:59:37 +0100

> The Microchip LAN78XX family of devices are Ethernet controllers with
> a USB interface. Despite being discoverable devices it can be useful to
> be able to configure them from Device Tree, particularly in low-cost
> applications without an EEPROM or programmed OTP.
> 
> This patch set adds support for reading the MAC address and LED modes from
> Device Tree.
> 
> v4:
> - Rename nodes in bindings doc.
> 
> v3:
> - Move LED setting into PHY driver.
> 
> v2:
> - Use eth_platform_get_mac_address.
> - Support up to 4 LEDs, and move LED mode constants into dt-bindings header.
> - Improve bindings document.
> - Remove EEE support.

Series applied, thanks Phil.
