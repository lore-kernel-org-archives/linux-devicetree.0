From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 2/3 v3] ARM: dts: exynos: Explicitly set dr_mode on arndale-octa
Date: Mon, 15 Sep 2014 12:52:33 +0200
Message-ID: <1410778354-31210-3-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1410778354-31210-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1410778354-31210-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

Explicitly set the dr_mode for the second dwc3 controller on the
Arndale Octa board to host mode. This is required to ensure the
controller is initialized in the right mode if the kernel is build with
USB gadget support

Reported-By: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 Changes in v3: new patch

 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/b=
oot/dts/exynos5420-arndale-octa.dts
index 434fd9d..fc2e983 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -375,3 +375,7 @@
 		};
 	};
 };
+
+&usbdrd_dwc3_1 {
+	dr_mode =3D "host";
+};
--=20
2.1.0
