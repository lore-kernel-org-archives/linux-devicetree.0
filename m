From: Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH v4 2/2] dt-bindings: clk: add rockchip, grf property for RK3399
Date: Tue, 10 Jan 2017 14:15:30 +0800
Message-ID: <1484028930-20305-3-git-send-email-zhengxing@rock-chips.com>
References: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, dianders@google.com, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support for rockchip,grf property which is used for GRF muxes
on RK3399.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

Changes in v4:
- update the decription for rockchip,grf property

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
index 3888dd3..3bc56fa 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
@@ -13,6 +13,12 @@ Required Properties:
 - #clock-cells: should be 1.
 - #reset-cells: should be 1.
 
+Optional Properties:
+
+- rockchip,grf: phandle to the syscon managing the "general register files".
+  It is used for GRF muxes, if missing any muxes present in the GRF will not
+  be available.
+
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
 preprocessor macros in the dt-bindings/clock/rk3399-cru.h headers and can be
-- 
2.7.4
