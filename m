From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] powerpc: dts: don't fall back to fsl,pq3-gpio for fsl,mpc8572-gpio devices
Date: Fri, 31 Jul 2015 11:12:01 +0200
Message-ID: <1438333921-8999-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

While the handling of fsl,pq3-gpio and fsl,mpc8572-gpio is done in the
same driver and the two hardly differ, the latter controller needs a
workaround for an erratum in the gpio_get callback. To make this
difference more explicit remove fsl,pq3-gpio from the list of
compatibles for mpc8572 machines.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi b/arch/power=
pc/boot/dts/fsl/mpc8536si-post.dtsi
index c8b2daa40ac8..41935709ebe8 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
@@ -172,7 +172,7 @@
=20
 	/* mark compat w/8572 to get some erratum treatment */
 	gpio-controller@f000 {
-		compatible =3D "fsl,mpc8572-gpio", "fsl,pq3-gpio";
+		compatible =3D "fsl,mpc8572-gpio";
 	};
=20
 	sata@18000 {
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi b/arch/power=
pc/boot/dts/fsl/mpc8572si-post.dtsi
index d44e25a48734..49294cf36b4e 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
@@ -162,7 +162,7 @@
 /include/ "pq3-dma-1.dtsi"
 /include/ "pq3-gpio-0.dtsi"
 	gpio-controller@f000 {
-		compatible =3D "fsl,mpc8572-gpio", "fsl,pq3-gpio";
+		compatible =3D "fsl,mpc8572-gpio";
 	};
=20
 	L2: l2-cache-controller@20000 {
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
