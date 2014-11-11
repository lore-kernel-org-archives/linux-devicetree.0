From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2 0/1] ARM: dts: Fix failing ethernet PHY
 detection on the LeMaker Banana Pi
Date: Wed, 12 Nov 2014 00:01:45 +0100
Message-ID: <1415746906-20835-1-git-send-email-merker@debian.org>
References: <1415539714-7652-1-git-send-email-merker@debian.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBEFLRKRQKGQEV7T74EY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1415539714-7652-1-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

While testing the daily builds of the Debian-Installer (d-i) on the
LeMaker Banana Pi (a small, Allwinner A20-based board), I found that
within the installer environment, the detection of the external Realtek
ethernet PHY connected to the Allwinner A20 GMAC fails upon first
loading of the stmmac driver:

[   77.235117] stmmaceth 1c50000.ethernet: no reset control found
[   77.235192]  Ring mode enabled
[   77.235202]  No HW DMA feature register supported
[   77.235211]  Normal descriptors
[   77.235219]  TX Checksum insertion supported
[   77.242678] libphy: stmmac: probed
[   77.242708] eth0: No PHY found

Just unloading the stmmac module and immediately afterwards 
modprobing it again results in proper detection of the PHY:

[  148.823456] stmmaceth 1c50000.ethernet: no reset control found
[  148.823487]  Ring mode enabled
[  148.823496]  No HW DMA feature register supported
[  148.823502]  Normal descriptors
[  148.823509]  TX Checksum insertion supported
[  148.854654] libphy: stmmac: probed
[  148.854683] eth0: PHY ID 001cc915 at 0 IRQ POLL (stmmac-0:00) active
[  148.854694] eth0: PHY ID 001cc915 at 1 IRQ POLL (stmmac-0:01)

On the Banana Pi, the PHY power supply is handled by a GPIO-controlled
regulator:

gmac: ethernet@01c50000 {
        pinctrl-names = "default";
        pinctrl-0 = <&gmac_pins_rgmii_a>;
        phy = <&phy1>;
        phy-mode = "rgmii";
        phy-supply = <&reg_gmac_3v3>;
        status = "okay";

        phy1: ethernet-phy@1 {
                reg = <1>;
        };
};

reg_gmac_3v3: gmac-3v3 {
        compatible = "regulator-fixed";
        pinctrl-names = "default";
        pinctrl-0 = <&gmac_power_pin_bananapi>;
        regulator-name = "gmac-3v3";
        regulator-min-microvolt = <3300000>;
        regulator-max-microvolt = <3300000>;
        startup-delay-us = <50000>;
        enable-active-high;
        gpio = <&pio 7 23 0>;
};

and this problem did not show up on the hardware-wise rather similar
Cubietech Cubietruck (same SoC, same external PHY, but no
GPIO-controlled regulator for the PHY).  Further tests have shown that
increasing the startup-delay for the regulator solves the problem.  The
current sun7i-a20-bananapi.dts file (in linux-next, intended to go into
kernel 3.19) sets startup-delay-us for the PHY's regulator to 50000.  On
my Banana Pi board, even with a value of 55000, the PHY detection does
usually not work on the first probing inside d-i.  Increasing the value
to 57500 results in a successful probing most of the time, but not
always; only setting it to 60000 results in a reliable PHY detection
for me.

Following is a patch to increase the startup delay in the Banana Pi dts.

Regards,
Karsten

Karsten Merker (1):
  ARM: dts: sunxi: Banana Pi: increase startup-delay for the GMAC PHY
    regulator

 arch/arm/boot/dts/sun7i-a20-bananapi.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes since V1:
- increased the delay from 60000us to 100000us to have a certain
  safety margin and cater for manufacturing variations as proposed
  by Hans de Goede.

-- 
1.7.10.4
