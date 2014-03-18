From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] mfd: sec-core: Fix uninitialized 'regmap_rtc' on S2MPA01
Date: Tue, 18 Mar 2014 14:11:26 +0100
Message-ID: <1395148286-32002-1-git-send-email-k.kozlowski@samsung.com>
References: <20140318110947.GR25478@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140318110947.GR25478@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, broonie@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Initialize the 'regmap_rtc' on S2MPA01 to some sane value. Sane at leas=
t
for S5M87X chipsets, not S2MPS/S2MPA but it won't be used because
rtc-s5m driver does not support S2MPA01.

This fixes following error:
drivers/mfd/sec-core.c:342:45: warning: =E2=80=98regmap_rtc=E2=80=99 ma=
y be used uninitialized in this function [-Wuninitialized]

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mfd/sec-core.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 281a827..f5e09d0 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -295,6 +295,13 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	switch (sec_pmic->device_type) {
 	case S2MPA01:
 		regmap =3D &s2mpa01_regmap_config;
+		/*
+		 * The rtc-s5m driver does not support S2MPA01 and there
+		 * is no mfd_cell for S2MPA01 RTC device.
+		 * However we must pass something to devm_regmap_init_i2c()
+		 * so use S5M-like regmap config even though it wouldn't work.
+		 */
+		regmap_rtc =3D &s5m_rtc_regmap_config;
 		break;
 	case S2MPS11X:
 		regmap =3D &s2mps11_regmap_config;
--=20
1.7.9.5
