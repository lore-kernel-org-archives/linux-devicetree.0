From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH 1/2] arm64: dts: add Spreadtrum's fm support
Date: Tue, 4 Jul 2017 18:15:07 +0800
Message-ID: <20170704101508.30946-2-chunyan.zhang@spreadtrum.com>
References: <20170704101508.30946-1-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170704101508.30946-1-chunyan.zhang@spreadtrum.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org, Zhongping Tan <zhongping.tan@spreadtrum.com>, Songhe Wei <songhe.wei@spreadtrum.com>, Chunyan Zhang <chunyan.zhang@spreadtrum.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Added FM support for Spreadtrum's SP9860 board.

Signed-off-by: Songhe Wei <songhe.wei@spreadtrum.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
index 0362ecd..6fe052d 100644
--- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
+++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
@@ -39,6 +39,10 @@
 		#size-cells = <2>;
 		ranges;
 	};
+
+	sprd-fm {
+		compatible  = "sprd,marlin2-fm";
+	};
 };
 
 &uart0 {
-- 
2.7.4
