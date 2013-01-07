From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 3.9 2/3] arm: mvebu: add the 7-segment display DT informations
 to Armada 370 DB
Date: Mon,  7 Jan 2013 17:42:07 +0100
Message-ID: <1357576928-29133-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Now that we have a 7-segment display driver in the kernel, use it on
the Marvell Armada 370 DB evaluation board.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arm/boot/dts/armada-370-db.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
index 0004402..c433072 100644
--- a/arch/arm/boot/dts/armada-370-db.dts
+++ b/arch/arm/boot/dts/armada-370-db.dts
@@ -59,5 +59,10 @@
 			phy = <&phy1>;
 			phy-mode = "rgmii-id";
 		};
+		gpio-7seg@0 {
+			compatible = "generic,gpio-7seg";
+			status = "okay";
+			gpios = <&gpio1 27 0 &gpio1 28 0 &gpio1 29 0>;
+		};
 	};
 };
-- 
1.7.9.5
