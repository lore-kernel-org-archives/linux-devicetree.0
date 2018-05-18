From: Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: da850-evm: Enable SATA port
Date: Fri, 18 May 2018 15:43:39 -0500
Message-ID: <20180518204339.14298-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Adam Ford <aford173@gmail.com>, devicetree@vger.kernel.org, nsekhar@ti.com, adam.ford@logicpd.com, khilman@kernel.org
List-Id: devicetree@vger.kernel.org

The DA850-EVM from Logic PD has a SATA port and the module that went
with the kit support it as well. This patch will enable the SATA
controller.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index a76c2ddfd23e..afccbe7681e7 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -160,6 +160,10 @@
 	};
 };
 
+&sata {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
-- 
2.17.0
