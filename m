From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v1 3/3] ARM: dts: bcm2711: Enable GENET support for the
 RPi4
Date: Fri, 11 Oct 2019 12:31:46 -0700
Message-ID: <a514751e-e82a-b5ea-34d3-46468c851a80@gmail.com>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
 <20191011184822.866-4-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011184822.866-4-matthias.bgg@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@kernel.org, "David S . Miller" <davem@davemloft.net>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>, Matthias Brugger <mbrugger@suse.com>, Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/11/19 11:48 AM, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Enable Gigabit Ethernet support on the Raspberry Pi 4
> Model B.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> ---
> 
>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 22 ++++++++++++++++++++++
>  arch/arm/boot/dts/bcm2711.dtsi        | 18 ++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> index cccc1ccd19be..958553d62670 100644
> --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> @@ -97,6 +97,28 @@
>  	status = "okay";
>  };
>  
> +&genet {
> +	phy-handle = <&phy1>;
> +	phy-mode = "rgmii";

Can you check that things still work against David Miller's net-next?
Tree, in particular the BCM54213PE PHY might be matched by the BCM54210E
entry in drivers/net/phy/broadcom.c and I just fixed an issue in how
RGMII delays were configured:

https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/?id=fea7fda7f50a6059220f83251e70709e45cc8040

This might require you to change the 'phy-mode' property to what is
appropriate.

> +	status = "okay";
> +	dma-burst-sz = <0x08>;
> +
> +	mdio@e14 {
> +		compatible = "brcm,genet-mdio-v5";
> +		reg = <0xe14 0x8>;
> +		reg-names = "mdio";
> +		#address-cells = <0x0>;
> +		#size-cells = <0x1>;
> +
> +		phy1: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";

This does not hurt, but this compatibility string is not required.

> +			/* No PHY interrupt */
> +			max-speed = <1000>;

And this property is not required either, since the PHY library will
determine the PHY's capabilities.

Other than those patches, I believe you also need something like this
(inspired by the Rpi downstream patch):

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c
b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index 970e478a9017..94d1dd5d56bf 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -273,11 +273,12 @@ int bcmgenet_mii_probe(struct net_device *dev)
        struct bcmgenet_priv *priv = netdev_priv(dev);
        struct device_node *dn = priv->pdev->dev.of_node;
        struct phy_device *phydev;
-       u32 phy_flags;
+       u32 phy_flags = 0;
        int ret;

        /* Communicate the integrated PHY revision */
-       phy_flags = priv->gphy_rev;
+       if (priv->internal_phy)
+               phy_flags = priv->gphy_rev;

        /* Initialize link state variables that bcmgenet_mii_setup() uses */
        priv->old_link = -1;

to prevent the internal PHY revision, which we stick into
phydev->dev_flags from incorrectly setting bits in
drivers/net/phy/broadcom.c. I will probably send this as a fix in the
next few hours.
-- 
Florian
