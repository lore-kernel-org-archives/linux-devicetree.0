From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 1/3] ARM: dts: imx6sx-sabreauto: Fix misspelled property
Date: Tue,  5 Jul 2016 06:04:08 +0200
Message-ID: <1467691450-22975-2-git-send-email-afaerber@suse.de>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467691450-22975-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Ettore Chimenti <ettore.chimenti@udoo.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

In commit 99fc5ba0bfb6 ("ARM: dts: imx6sx: add i.mx6sx sabreauto board
support") it should've been enable-sdio-wakeup (not -wakup). But that i=
s
now considered a legacy name for wakeup-source, so directly use the new
name instead, as done in commit 26cefdd15db1 for the other occurrence.

=46ixes: 26cefdd15db1 ("ARM: dts: imx: replace legacy wakeup property w=
ith 'wakeup-source'")
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/boot/dts/imx6sx-sabreauto.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts=
/imx6sx-sabreauto.dts
index 96ea936eeeb0..240a2864d044 100644
--- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
@@ -64,7 +64,7 @@
 	cd-gpios =3D <&gpio7 11 GPIO_ACTIVE_LOW>;
 	no-1-8-v;
 	keep-power-in-suspend;
-	enable-sdio-wakup;
+	wakeup-source;
 	status =3D "okay";
 };
=20
--=20
2.6.6
