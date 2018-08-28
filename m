From: Urja Rannikko <urjaman@gmail.com>
Subject: [PATCH 2/7] dt-bindings: clock: rk3288-cru: Add property to dedicate
 NPLL for VOPx
Date: Tue, 28 Aug 2018 18:55:08 +0000
Message-ID: <20180828185513.13216-3-urjaman@gmail.com>
References: <20180828185513.13216-1-urjaman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180828185513.13216-1-urjaman@gmail.com>
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
Cc: Urja Rannikko <urjaman@gmail.com>, devicetree@vger.kernel.org, heiko@sntech.de
List-Id: devicetree@vger.kernel.org

Signed-off-by: Urja Rannikko <urjaman@gmail.com>
---
 .../devicetree/bindings/clock/rockchip,rk3288-cru.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
index 8cb47c39ba53..20724584e0a4 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
@@ -16,6 +16,9 @@ Optional Properties:
 
 - rockchip,grf: phandle to the syscon managing the "general register files"
   If missing pll rates are not changeable, due to the missing pll lock status.
+- rockchip,npll-for-vop: u32 0 or 1, dedicates NPLL to a VOP output unit for
+  more frequency flexibility for the selected VOP output at a cost of
+  flexibility for other devices. Disabled if not present or -1.
 
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
-- 
2.18.0
