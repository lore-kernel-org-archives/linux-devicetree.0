From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 3/3] dt-bindings: Document the DT bindings for lan78xx
Date: Thu, 19 Apr 2018 17:20:56 +0200
Message-ID: <20180419152056.GD29658@lunn.ch>
References: <1524148325-78945-1-git-send-email-phil@raspberrypi.org>
 <1524148325-78945-5-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524148325-78945-5-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 19, 2018 at 03:32:05PM +0100, Phil Elwell wrote:
> The Microchip LAN78XX family of devices are Ethernet controllers with
> a USB interface. Despite being discoverable devices it can be useful to
> be able to configure them from Device Tree, particularly in low-cost
> applications without an EEPROM or programmed OTP.
> 
> Document the supported properties in a bindings file.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
