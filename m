From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 03/97] arm64: dts: mt7622: fix no more console output on rfb1
Date: Wed, 26 Dec 2018 17:34:23 -0500
Message-ID: <20181226223557.149329-3-sashal@kernel.org>
References: <20181226223557.149329-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181226223557.149329-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ryder Lee <ryder.lee@mediatek.com>

[ Upstream commit 6c05946e349d92f527d98644fbc9c41f06312c00 ]

No default serial console on boot.
Fix this by using a 'stdout-path' property that points to the device.

Fixes: c0d9f9ad4f76 ("arm64: dts: mt7622: add earlycon to mt7622-rfb1 board")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
[mb: Fix commit message]
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index a747b7bf132d..387be39d40cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -17,8 +17,13 @@
 	model = "MediaTek MT7622 RFB1 board";
 	compatible = "mediatek,mt7622-rfb1", "mediatek,mt7622";
 
+	aliases {
+		serial0 = &uart0;
+	};
+
 	chosen {
-		bootargs = "earlycon=uart8250,mmio32,0x11002000 console=ttyS0,115200n1 swiotlb=512";
+		stdout-path = "serial0:115200n8";
+		bootargs = "earlycon=uart8250,mmio32,0x11002000 swiotlb=512";
 	};
 
 	cpus {
-- 
2.19.1
