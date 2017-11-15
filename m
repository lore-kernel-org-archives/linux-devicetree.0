From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [URGENT PATCH] arm64: dts: uniphier: route on-board device IRQ to GPIO controller for PXs3
Date: Wed, 15 Nov 2017 13:15:12 +0900
Message-ID: <1510719312-22269-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 429f203eb712 ("arm64: dts: uniphier: route on-board device IRQ
to GPIO controller") missed to update this DTS.  It becames a real
problem when arm and arm64 trees are merged together.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

Arnd, Olof,

I think you are sending pull-requests for v4.15-rc1 shortly.
Can you apply this on top your arm64 tree?

With DT tree merged in Linus' tree today,
I realized my mistake that was hidden before.

arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dtb: Warning (interrupts_property):
interrupts size is (12), expected multiple of 8 in /soc@0/system-bus@58c00000/support-card@1,1f00000/ethernet@0

We do not have much time, so I am sending this patch
instead of a pull-reuqest.

Please pick up.


 arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
index dad4743..864feeb 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
@@ -38,7 +38,8 @@
 };
 
 &ethsc {
-	interrupts = <0 52 4>;
+	interrupt-parent = <&gpio>;
+	interrupts = <0 8>;
 };
 
 &serial0 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
