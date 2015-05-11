From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [v4.0: PATCH 1/3] ARM: dts: k2hk: fix the netcp range size
Date: Mon, 11 May 2015 14:05:28 -0400
Message-ID: <1431367530-4924-2-git-send-email-m-karicheri2@ti.com>
References: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ssantosh@kernel.org
Cc: Murali Karicheri <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org

k2hk netcp range size is 1M (0x100000) and not 0xfffff. This patch fixes
this.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 arch/arm/boot/dts/k2hk-netcp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/k2hk-netcp.dtsi b/arch/arm/boot/dts/k2hk-netcp.dtsi
index 308abe5..77a32c3 100644
--- a/arch/arm/boot/dts/k2hk-netcp.dtsi
+++ b/arch/arm/boot/dts/k2hk-netcp.dtsi
@@ -129,7 +129,7 @@ netcp: netcp@2000000 {
 	#size-cells = <1>;
 
 	/* NetCP address range */
-	ranges  = <0 0x2000000 0xfffff>;
+	ranges  = <0 0x2000000 0x100000>;
 
 	clocks = <&papllclk>, <&clkcpgmac>, <&chipclk12>;
 	dma-coherent;
-- 
1.9.1
