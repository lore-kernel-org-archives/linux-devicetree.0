From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v2 6/7] MAINTAINERS: add Mediatek shutdown drivers
Date: Wed,  3 Jul 2019 18:48:21 +0200
Message-ID: <20190703164822.17924-7-frank-w@public-files.de>
References: <20190703164822.17924-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703164822.17924-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Allison Randal <allison@lohutok.net>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gr>
Cc: Josef Friedl <josef.friedl@speed.at>, Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

From: Josef Friedl <josef.friedl@speed.at>

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01a52fc964da..31c1e882b7d2 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9920,6 +9920,13 @@ S:	Maintained
 F:	drivers/net/dsa/mt7530.*
 F:	net/dsa/tag_mtk.c

+MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS
+M:	Sean Wang <sean.wang@mediatek.com>
+L:	linux-pm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
+F:	drivers/power/reset/mt6323-poweroff.c
+
 MEDIATEK JPEG DRIVER
 M:	Rick Chang <rick.chang@mediatek.com>
 M:	Bin Liu <bin.liu@mediatek.com>
=2D-
2.17.1
