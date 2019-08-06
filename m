From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v4 06/10] rtc: mt6397: add compatible for mt6323
Date: Tue,  6 Aug 2019 18:27:41 +0200
Message-ID: <20190806162745.8414-7-frank-w@public-files.de>
References: <20190806162745.8414-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806162745.8414-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Allison Randal <allison@lohutok.net>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kate Stewart <kstewart@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Fontana <rfontana@r>
Cc: Josef Friedl <josef.friedl@speed.at>, Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

From: Josef Friedl <josef.friedl@speed.at>

use mt6397 rtc driver also for mt6323 but with different
base/size see "mfd: mt6323: add mt6323 rtc+pwrc"

Signed-off-by: Josef Friedl <josef.friedl@speed.at>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
changes since v3: moved (was part 5)
changes since v2: splitted this from v2.3 suggested-by Alexandre Belloni

 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 9370b7fc9f81..21cd9cc8b4c7 100644
=2D-- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -325,6 +325,7 @@ static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_sus=
pend,
 			mt6397_rtc_resume);

 static const struct of_device_id mt6397_rtc_of_match[] =3D {
+	{ .compatible =3D "mediatek,mt6323-rtc", },
 	{ .compatible =3D "mediatek,mt6397-rtc", },
 	{ }
 };
=2D-
2.17.1
