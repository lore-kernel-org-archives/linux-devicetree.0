From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 4/7] net: phy: mscc: add support for VSC8574 PHY
Date: Fri, 14 Sep 2018 13:26:06 -0700
Message-ID: <bc95fae7-cf2f-5cf1-4e24-59fcc231fd64@gmail.com>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
 <236ef7815c0bec6048e79ef06868719b65c63892.1536916714.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <236ef7815c0bec6048e79ef06868719b65c63892.1536916714.git-series.quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org

On 09/14/2018 02:44 AM, Quentin Schulz wrote:
> The VSC8574 PHY is a 4-ports PHY that is 10/100/1000BASE-T, 100BASE-FX,
> 1000BASE-X and triple-speed copper SFP capable, can communicate with
> the MAC via SGMII, QSGMII or 1000BASE-X, supports WOL, downshifting and
> can set the blinking pattern of each of its 4 LEDs, supports SyncE as
> well as HP Auto-MDIX detection.
> 
> This adds support for 10/100/1000BASE-T, SGMII/QSGMII link with the MAC,
> WOL, downshifting, HP Auto-MDIX detection and blinking pattern for its 4
> LEDs.
> 
> The VSC8574 has also an internal Intel 8051 microcontroller whose
> firmware needs to be patched when the PHY is reset. If the 8051's
> firmware has the expected CRC, its patching can be skipped. The
> microcontroller can be accessed from any port of the PHY, though the CRC
> function can only be done through the PHY that is the base PHY of the
> package (internal address 0) due to a limitation of the firmware.
> 
> The GPIO register bank is a set of registers that are common to all PHYs
> in the package. So any modification in any register of this bank affects
> all PHYs of the package.
> 
> If the PHYs haven't been reset before booting the Linux kernel and were
> configured to use interrupts for e.g. link status updates, it is
> required to clear the interrupts mask register of all PHYs before being
> able to use interrupts with any PHY. The first PHY of the package that
> will be init will take care of clearing all PHYs interrupts mask
> registers. Thus, we need to keep track of the init sequence in the
> package, if it's already been done or if it's to be done.
> 
> Most of the init sequence of a PHY of the package is common to all PHYs
> in the package, thus we use the SMI broadcast feature which enables us
> to propagate a write in one register of one PHY to all PHYs in the
> package.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---

[snip]

> +	reg = __mdiobus_read(bus, phy, MSCC_PHY_TEST_PAGE_8);
> +	reg |= 0x8000;

Having a define would be nice here? This looks like a write enable?

> +	__mdiobus_write(bus, phy, MSCC_PHY_TEST_PAGE_8, reg);
> +
> +	__mdiobus_write(bus, phy, MSCC_EXT_PAGE_ACCESS, MSCC_PHY_PAGE_TR);
> +
> +	vsc8584_csr_write(bus, phy, 0x8fae, 0x000401bd);

Just make this an array of address + value pairs and blast it to the
PHY, having them be inlined here is both error prone and does not scale
well at all.
[snip]
> +	vsc8584_csr_write(bus, phy, 0x84a8, 0x00000000);
> +	vsc8584_csr_write(bus, phy, 0x84aa, 0x00000000);
> +	vsc8584_csr_write(bus, phy, 0x84ae, 0x007df7dd);
> +	vsc8584_csr_write(bus, phy, 0x84b0, 0x006d95d4);
> +	vsc8584_csr_write(bus, phy, 0x84b2, 0x00492410);

Likewise

[snip]
-- 
Florian
