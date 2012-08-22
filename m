From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 7/9] ARM: mvebu: Add pinctrl support to Armada XP SoCs
Date: Wed, 22 Aug 2012 14:45:18 -0600
Message-ID: <503544DE.20003@wwwdotorg.org>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com> <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com> <1345623750-10645-8-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1345623750-10645-8-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/22/2012 02:22 AM, Sebastian Hesselbarth wrote:
> This commits adds the necessary device tree information to define the
> compatible property for the pinctrl driver instance of Armada XP SoCs.
> 
> Until now, the device tree representation considered the Armada XP as
> a single SoC. But in fact, there are three different SoCs in the
> Armada XP families, with different number of CPU cores, different
> number of Ethernet interfaces... and different number of muxable pins
> or functions. We therefore introduce three armada-xp-mv78xx0.dtsi for
> the three SoCs of the Armada XP family. The current armada-xp-db.dts
> evaluation board uses the MV78460 variant of the SoC.

> diff --git a/arch/arm/boot/dts/armada-xp-mv78230.dtsi b/arch/arm/boot/dts/armada-xp-mv78230.dtsi

> +/include/ "armada-xp.dtsi"
> +
> +/ {
> +	model = "Marvell Armada XP family SoC";
> +	compatible = "marvell,armadaxp-mv78230", "marvell,armadaxp", "marvell,armada-370-xp";

Since each of these files is specifically for a different SoC, I'd
expect them all to say something different in the model property?

> diff --git a/arch/arm/boot/dts/armada-xp-mv78260.dtsi b/arch/arm/boot/dts/armada-xp-mv78260.dtsi

> +	model = "Marvell Armada XP family SoC";
> +	compatible = "marvell,armadaxp-mv78260", "marvell,armadaxp", "marvell,armada-370-xp";

> diff --git a/arch/arm/boot/dts/armada-xp-mv78460.dtsi b/arch/arm/boot/dts/armada-xp-mv78460.dtsi

> +	model = "Marvell Armada XP family SoC";
> +	compatible = "marvell,armadaxp-mv78460", "marvell,armadaxp", "marvell,armada-370-xp";

