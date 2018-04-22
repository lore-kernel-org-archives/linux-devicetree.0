From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.16 148/196] dt-bindings: clock: mediatek: add binding for fixed-factor clock axisel_d4
Date: Sun, 22 Apr 2018 15:52:48 +0200
Message-ID: <20180422135111.890281754@linuxfoundation.org>
References: <20180422135104.278511750@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180422135104.278511750@linuxfoundation.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
List-Id: devicetree@vger.kernel.org

4.16-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Sean Wang <sean.wang@mediatek.com>

commit 55a5fcafe3a94e8a0777bb993d09107d362258d2 upstream.

Just add binding for a fixed-factor clock axisel_d4, which would be
referenced by PWM devices on MT7623 or MT2701 SoC.

Cc: stable@vger.kernel.org
Fixes: 1de9b21633d6 ("clk: mediatek: Add dt-bindings for MT2701 clocks")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 include/dt-bindings/clock/mt2701-clk.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/include/dt-bindings/clock/mt2701-clk.h
+++ b/include/dt-bindings/clock/mt2701-clk.h
@@ -176,7 +176,8 @@
 #define CLK_TOP_AUD_EXT1			156
 #define CLK_TOP_AUD_EXT2			157
 #define CLK_TOP_NFI1X_PAD			158
-#define CLK_TOP_NR				159
+#define CLK_TOP_AXISEL_D4			159
+#define CLK_TOP_NR				160
 
 /* APMIXEDSYS */
 
