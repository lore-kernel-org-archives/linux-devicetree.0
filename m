From: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 3/5] ARM: DT: STiH410: Add label for sti-hdmi node
Date: Tue, 4 Oct 2016 18:11:55 +0200
Message-ID: <1475597517-14225-4-git-send-email-arnaud.pouliquen@st.com>
References: <1475597517-14225-1-git-send-email-arnaud.pouliquen@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475597517-14225-1-git-send-email-arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Moise Gergaud <moise.gergaud-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Needed to declare HDMI device in sound card

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih410.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih410.dtsi b/arch/arm/boot/dts/stih410.dtsi
index a3ef734..281a124 100644
--- a/arch/arm/boot/dts/stih410.dtsi
+++ b/arch/arm/boot/dts/stih410.dtsi
@@ -193,7 +193,7 @@
 							 <&clk_s_d2_quadfs 0>;
 			};
 
-			sti-hdmi@8d04000 {
+			sti_hdmi: sti-hdmi@8d04000 {
 				compatible = "st,stih407-hdmi";
 				reg = <0x8d04000 0x1000>;
 				reg-names = "hdmi-reg";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
