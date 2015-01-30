Return-Path: <linux-arm-kernel-bounces+robherring2=gmail.com@lists.infradead.org>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Fri, 30 Jan 2015 07:06:31 +0100
Subject: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Message-ID: <E1YH5bS-0005mG-02@bombadil.infradead.org>
Errors-To: linux-arm-kernel-bounces+robherring2=gmail.com@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

This patch enables the ethernet device by default, permitting CM-A510
boards to access the network when an ethernet connector is present.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
Tested-by: Gabriel Dobato <dobatog@gmail.com>
---
 arch/arm/boot/dts/dove-cm-a510.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/dove-cm-a510.dts b/arch/arm/boot/dts/dove-cm-a510.dts
index 50c0d69..404e983 100644
--- a/arch/arm/boot/dts/dove-cm-a510.dts
+++ b/arch/arm/boot/dts/dove-cm-a510.dts
@@ -21,6 +21,8 @@
 &sdio0 { status = "okay"; };
 &sdio1 { status = "okay"; };
 &sata0 { status = "okay"; };
+&eth { status = "okay"; };
+&mdio { status ="okay";};
 
 &spi0 {
 	status = "okay";
-- 
2.1.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
