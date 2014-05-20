From: Maxime COQUELIN <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v6 2/4] ARM: dts: Fix STi boards compatibles
Date: Tue, 20 May 2014 11:46:30 +0200
Message-ID: <1400579192-17620-3-git-send-email-maxime.coquelin@st.com>
References: <1400579192-17620-1-git-send-email-maxime.coquelin@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400579192-17620-1-git-send-email-maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The compatible strings have to be ordered from specific to generic.
This patch fixes this for STi boards, which did the exact opposite.

Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Signed-off-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih415-b2000.dts | 2 +-
 arch/arm/boot/dts/stih415-b2020.dts | 2 +-
 arch/arm/boot/dts/stih416-b2000.dts | 3 +--
 arch/arm/boot/dts/stih416-b2020.dts | 3 +--
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stih415-b2000.dts b/arch/arm/boot/dts/stih415-b2000.dts
index d4af531..bdfbd37 100644
--- a/arch/arm/boot/dts/stih415-b2000.dts
+++ b/arch/arm/boot/dts/stih415-b2000.dts
@@ -11,5 +11,5 @@
 #include "stih41x-b2000.dtsi"
 / {
 	model = "STiH415 B2000 Board";
-	compatible = "st,stih415", "st,stih415-b2000";
+	compatible = "st,stih415-b2000", "st,stih415";
 };
diff --git a/arch/arm/boot/dts/stih415-b2020.dts b/arch/arm/boot/dts/stih415-b2020.dts
index 442b019..71903a8 100644
--- a/arch/arm/boot/dts/stih415-b2020.dts
+++ b/arch/arm/boot/dts/stih415-b2020.dts
@@ -11,5 +11,5 @@
 #include "stih41x-b2020.dtsi"
 / {
 	model = "STiH415 B2020 Board";
-	compatible = "st,stih415", "st,stih415-b2020";
+	compatible = "st,stih415-b2020", "st,stih415";
 };
diff --git a/arch/arm/boot/dts/stih416-b2000.dts b/arch/arm/boot/dts/stih416-b2000.dts
index a5eb6ee..488e80a 100644
--- a/arch/arm/boot/dts/stih416-b2000.dts
+++ b/arch/arm/boot/dts/stih416-b2000.dts
@@ -9,8 +9,7 @@
 /dts-v1/;
 #include "stih416.dtsi"
 #include "stih41x-b2000.dtsi"
-
 / {
-	compatible = "st,stih416", "st,stih416-b2000";
 	model = "STiH416 B2000";
+	compatible = "st,stih416-b2000", "st,stih416";
 };
diff --git a/arch/arm/boot/dts/stih416-b2020.dts b/arch/arm/boot/dts/stih416-b2020.dts
index 276f28d..4e2df66 100644
--- a/arch/arm/boot/dts/stih416-b2020.dts
+++ b/arch/arm/boot/dts/stih416-b2020.dts
@@ -11,6 +11,5 @@
 #include "stih41x-b2020.dtsi"
 / {
 	model = "STiH416 B2020";
-	compatible = "st,stih416", "st,stih416-b2020";
-
+	compatible = "st,stih416-b2020", "st,stih416";
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
