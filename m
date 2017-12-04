From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH v4.1] phylib: Add device reset GPIO support
Date: Mon, 4 Dec 2017 17:20:13 +0100
Message-ID: <b95b046c-ee37-5ec1-01c1-763fb1e307e2@skidata.com>
References: <1512383692-14009-2-git-send-email-geert+renesas@glider.be>
 <1512390905-28094-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512390905-28094-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 12/04/2017 01:35 PM, Geert Uytterhoeven wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> The PHY devices sometimes do have their reset signal (maybe even power
> supply?) tied to some GPIO and sometimes it also does happen that a boot
> loader does not leave it deasserted. So far this issue has been attacked
> from (as I believe) a wrong angle: by teaching the MAC driver to manipulate
> the GPIO in question; that solution, when applied to the device trees, led
> to adding the PHY reset GPIO properties to the MAC device node, with one
> exception: Cadence MACB driver which could handle the "reset-gpios" prop
> in a PHY device subnode. I believe that the correct approach is to teach
> the 'phylib' to get the MDIO device reset GPIO from the device tree node
> corresponding to this device -- which this patch is doing...
> 
> Note that I had to modify the AT803x PHY driver as it would stop working
> otherwise -- it made use of the reset GPIO for its own purposes...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Rob Herring <robh@kernel.org>
> [geert: Propagate actual errors from fwnode_get_named_gpiod()]
> [geert: Avoid destroying initial setup]
> [geert: Consolidate GPIO descriptor acquiring code]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Successfully tested this patch on a i.MX6SOLO based board containing a
LAN8710 PHY:

Tested-by: Richard Leitner <richard.leitner@skidata.com>
