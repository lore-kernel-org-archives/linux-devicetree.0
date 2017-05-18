From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 1/6] dt-bindings: clock: sunxi-ccu: Add
 compatible string for A83T CCU
Date: Thu, 18 May 2017 11:58:04 +0800
Message-ID: <20170518035809.15487-2-wens@csie.org>
References: <20170518035809.15487-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBW5X6TEAKGQEEMVBYUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170518035809.15487-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A83T clock control unit is a hybrid of some new style clock designs
from the A80, and old style layout from the other Allwinner SoCs.

Like the A80, the SoC does not have a low speed 32.768 kHz oscillator.
Unlike the A80, there is no clock input either. The only low speed clock
available is the internal oscillator which runs at around 16 MHz,
divided by 512, yielding a low speed clock around 31.250 kHz.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
index e9c5a1d9834a..34b2a9249a94 100644
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -6,6 +6,7 @@ Required properties :
 		- "allwinner,sun6i-a31-ccu"
 		- "allwinner,sun8i-a23-ccu"
 		- "allwinner,sun8i-a33-ccu"
+		- "allwinner,sun8i-a83t-ccu"
 		- "allwinner,sun8i-h3-ccu"
 		- "allwinner,sun8i-h3-r-ccu"
 		- "allwinner,sun8i-v3s-ccu"
@@ -18,6 +19,7 @@ Required properties :
 - clocks: phandle to the oscillators feeding the CCU. Two are needed:
   - "hosc": the high frequency oscillator (usually at 24MHz)
   - "losc": the low frequency oscillator (usually at 32kHz)
+	    On the A83T, this is the internal 16MHz oscillator divided by 512
 - clock-names: Must contain the clock names described just above
 - #clock-cells : must contain 1
 - #reset-cells : must contain 1
-- 
2.11.0
