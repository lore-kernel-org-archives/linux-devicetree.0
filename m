From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v2 7/7] arm: dts: mt6323: add keys, power-controller, rtc and codec
Date: Wed,  3 Jul 2019 18:48:22 +0200
Message-ID: <20190703164822.17924-8-frank-w@public-files.de>
References: <20190703164822.17924-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703164822.17924-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Allison Randal <allison@lohutok.net>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gr>
Cc: Josef Friedl <josef.friedl@speed.at>, Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

From: Josef Friedl <josef.friedl@speed.at>

support poweroff and power-related keys on bpi-r2

Suggested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Josef Friedl <josef.friedl@speed.at>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
 arch/arm/boot/dts/mt6323.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/mt6323.dtsi b/arch/arm/boot/dts/mt6323.dtsi
index ba397407c1dd..7fda40ab5fe8 100644
=2D-- a/arch/arm/boot/dts/mt6323.dtsi
+++ b/arch/arm/boot/dts/mt6323.dtsi
@@ -238,5 +238,32 @@
 				regulator-enable-ramp-delay =3D <216>;
 			};
 		};
+
+		mt6323keys: mt6323keys {
+			compatible =3D "mediatek,mt6323-keys";
+			mediatek,long-press-mode =3D <1>;
+			power-off-time-sec =3D <0>;
+
+			power {
+				linux,keycodes =3D <116>;
+				wakeup-source;
+			};
+
+			home {
+				linux,keycodes =3D <114>;
+			};
+		};
+
+		codec: mt6397codec {
+			compatible =3D "mediatek,mt6397-codec";
+		};
+
+		power-controller {
+			compatible =3D "mediatek,mt6323-pwrc";
+		};
+
+		rtc {
+			compatible =3D "mediatek,mt6323-rtc";
+		};
 	};
 };
=2D-
2.17.1
