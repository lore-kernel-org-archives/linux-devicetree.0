From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [RFCv1 05/11] arm: mvebu: do not duplicate the mpic alias
Date: Tue, 26 Mar 2013 17:52:20 +0100
Message-ID: <1364316746-8702-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Maen Suleiman <maen@marvell.com>, Thierry Reding <thierry.reding@avionic-design.de>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

The mpic alias is already defined in the common armada-370-xp.dtsi, so
there's no need to repeat it at the armada-xp.dtsi and armada-370.dtsi
level. Moreover, we're going to slightly change how the interrupt
controller is declared in the common armada-370-xp.dtsi file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arm/boot/dts/armada-370.dtsi |    2 +-
 arch/arm/boot/dts/armada-xp.dtsi  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index b0468fd..a23a74f 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -33,7 +33,7 @@
 		gpio2 = &gpio2;
 	};
 
-	mpic: interrupt-controller@d0020000 {
+	interrupt-controller@d0020000 {
 	      reg = <0xd0020a00 0x1d0>,
 		    <0xd0021870 0x58>;
 	};
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index ca00d83..2fed73b 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -29,7 +29,7 @@
 		wt-override;
 	};
 
-	mpic: interrupt-controller@d0020000 {
+	interrupt-controller@d0020000 {
 	      reg = <0xd0020a00 0x2d0>,
 		    <0xd0021070 0x58>;
 	};
-- 
1.7.9.5
