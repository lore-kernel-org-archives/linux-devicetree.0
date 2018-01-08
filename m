From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/3] ARM: dts: enable L2 cache parity and ecc on db-xc3-24g4xg
 board
Date: Tue,  9 Jan 2018 11:31:56 +1300
Message-ID: <20180108223158.21930-2-chris.packham@alliedtelesis.co.nz>
References: <20180108223158.21930-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180108223158.21930-1-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jlu@pengutronix.de, linux@armlinux.org.uk, bp@alien8.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
index 06fce35d7491..00ca489fc788 100644
--- a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
+++ b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
@@ -70,6 +70,11 @@
 	};
 };
 
+&L2 {
+	arm,parity-enable;
+	marvell,ecc-enable;
+};
+
 &devbus_bootcs {
 	status = "okay";
 
-- 
2.15.1
