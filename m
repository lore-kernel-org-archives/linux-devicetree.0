From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 4/4] charger-manager: Remove build warning fo unused variable
Date: Tue, 22 Oct 2013 21:51:57 +0900
Message-ID: <1382446317-32613-5-git-send-email-cw00.choi@samsung.com>
References: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: anton@enomsg.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com
List-Id: devicetree@vger.kernel.org

drivers/power/charger-manager.c: In function =E2=80=98_cm_monitor=E2=80=
=99:
drivers/power/charger-manager.c:598:23: warning: unused variable =E2=80=
=98desc=E2=80=99 [-Wunused-variable]

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Myungjoo Ham <myungjoo.ham@samsung.com>
---
 drivers/power/charger-manager.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/power/charger-manager.c b/drivers/power/charger-ma=
nager.c
index 02a395c..02b4d76 100644
--- a/drivers/power/charger-manager.c
+++ b/drivers/power/charger-manager.c
@@ -595,7 +595,6 @@ static int read_battery_temperature(struct charger_=
manager *cm,
  */
 static bool _cm_monitor(struct charger_manager *cm)
 {
-	struct charger_desc *desc =3D cm->desc;
 	int temp =3D read_battery_temperature(cm, &cm->last_temp_mC);
=20
 	dev_dbg(cm->dev, "monitoring (%2.2d.%3.3dC)\n",
--=20
1.8.0
