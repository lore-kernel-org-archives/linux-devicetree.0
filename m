From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/4] net: dsa: Change DT bindings for Vitesse VSC73xx
 switches
Date: Mon, 1 Jul 2019 09:44:49 -0700
Message-ID: <45ff597a-5090-3874-b43d-5b5f45d2d2f6@gmail.com>
References: <20190701152723.624-1-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701152723.624-1-paweldembicki@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linus.walleij@linaro.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 7/1/19 8:27 AM, Pawel Dembicki wrote:
> This commit document changes after split vsc73xx driver into core and
> spi part. The change of DT bindings is required for support the same
> vsc73xx chip, which need PI bus to communicate with CPU. It also
> introduce how to use vsc73xx platform driver.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>  .../bindings/net/dsa/vitesse,vsc73xx.txt      | 74 ++++++++++++++++---
>  1 file changed, 64 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
> index ed4710c40641..c6a4cd85891c 100644
> --- a/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
> @@ -2,8 +2,8 @@ Vitesse VSC73xx Switches
>  ========================
>  
>  This defines device tree bindings for the Vitesse VSC73xx switch chips.
> -The Vitesse company has been acquired by Microsemi and Microsemi in turn
> -acquired by Microchip but retains this vendor branding.
> +The Vitesse company has been acquired by Microsemi and Microsemi has
> +been acquired Microchip but retains this vendor branding.
>  
>  The currently supported switch chips are:
>  Vitesse VSC7385 SparX-G5 5+1-port Integrated Gigabit Ethernet Switch
> @@ -11,16 +11,26 @@ Vitesse VSC7388 SparX-G8 8-port Integrated Gigabit Ethernet Switch
>  Vitesse VSC7395 SparX-G5e 5+1-port Integrated Gigabit Ethernet Switch
>  Vitesse VSC7398 SparX-G8e 8-port Integrated Gigabit Ethernet Switch
>  
> -The device tree node is an SPI device so it must reside inside a SPI bus
> -device tree node, see spi/spi-bus.txt
> +This switch could have two different management interface.
> +
> +If SPI interface is used, the device tree node is an SPI device so it must
> +reside inside a SPI bus device tree node, see spi/spi-bus.txt
> +
> +If Platform driver is used, the device tree node is an platform device so it
> +must reside inside a platform bus device tree node.

That should not be required because the device remains the same and how
it connects to the host is entirely described by the Device Tree topology.

Take b53 for instance which supports MDIO and SPI by default, and
optionally memory mapped and SRAB (indirect memory map) accesses, they
all have the same compatible strings. Whether the switches will appear
as spi_device, platform_device, or something else is entirely based on
how the Device Tree is laid out.
-- 
Florian
