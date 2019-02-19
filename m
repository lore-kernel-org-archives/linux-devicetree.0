From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 6/8] regulator: stpmic1: Change buck1 voltage range
Date: Tue, 19 Feb 2019 10:04:34 +0000
Message-ID: <1550570647-9555-7-git-send-email-p.paillet@st.com>
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

Change buck1 voltage range to be conform with the data-sheet.

Signed-off-by: pascal paillet <p.paillet@st.com>
---
 drivers/regulator/stpmic1_regulator.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpmic1_regulator.c
index 6970e45..41128c4 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -56,8 +56,9 @@ enum {
 #define PMIC_ENABLE_TIME_US 2200
 
 static const struct regulator_linear_range buck1_ranges[] = {
-	REGULATOR_LINEAR_RANGE(600000, 0, 30, 25000),
-	REGULATOR_LINEAR_RANGE(1350000, 31, 63, 0),
+	REGULATOR_LINEAR_RANGE(725000, 0, 4, 0),
+	REGULATOR_LINEAR_RANGE(725000, 5, 36, 25000),
+	REGULATOR_LINEAR_RANGE(1500000, 37, 63, 0),
 };
 
 static const struct regulator_linear_range buck2_ranges[] = {
-- 
1.9.1
