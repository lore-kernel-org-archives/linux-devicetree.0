From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] hwrng: st: dt: Fix trivial typo in node address
Date: Mon,  5 Oct 2015 16:10:42 +0100
Message-ID: <1444057842-23439-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-crypto-owner@vger.kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, herbert@gondor.apana.org.au, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org, mpm@selenic.com, sboyd@codeaurora.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

DT nodes should not append their addresses with '0x'.

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/rng/st,rng.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rng/st,rng.txt b/Documentation/devicetree/bindings/rng/st,rng.txt
index dbc64e6..35734bc 100644
--- a/Documentation/devicetree/bindings/rng/st,rng.txt
+++ b/Documentation/devicetree/bindings/rng/st,rng.txt
@@ -8,7 +8,7 @@ clocks		: Phandle to device's clock (See: ../clocks/clock-bindings.txt)
 
 Example:
 
-rng@0xfee80000 {
+rng@fee80000 {
 	compatible      = "st,rng";
 	reg		= <0xfee80000 0x1000>;
 	clocks          = <&clk_sysin>;
-- 
1.9.1
