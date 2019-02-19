From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 1/8] regulator: stpmic1: Use regulator mode definition from
 bindings
Date: Tue, 19 Feb 2019 10:04:31 +0000
Message-ID: <1550570647-9555-2-git-send-email-p.paillet@st.com>
References: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "axel.lin@ingics.com" <axel.lin@ingics.com>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Get the regulator mode definition from the bindings header.

Signed-off-by: pascal paillet <p.paillet@st.com>
---
 drivers/regulator/stpmic1_regulator.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpmic1_regulator.c
index d456fb5..c25f82f 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -12,6 +12,8 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
+#include <dt-bindings/mfd/st,stpmic1.h>
+
 /**
  * stpmic1 regulator description
  * @desc: regulator framework description
@@ -68,9 +70,6 @@ enum {
 /* Enable time worst case is 5000mV/(2250uV/uS) */
 #define PMIC_ENABLE_TIME_US 2200
 
-#define STPMIC1_BUCK_MODE_NORMAL 0
-#define STPMIC1_BUCK_MODE_LP BUCK_HPLP_ENABLE_MASK
-
 static const struct regulator_linear_range buck1_ranges[] = {
 	REGULATOR_LINEAR_RANGE(600000, 0, 30, 25000),
 	REGULATOR_LINEAR_RANGE(1350000, 31, 63, 0),
-- 
1.9.1
