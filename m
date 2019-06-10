From: Saravana Kannan <saravanak@google.com>
Subject: [Example code] crypto: qcom-rng: Add interconnect devfreq support
Date: Mon, 10 Jun 2019 16:12:39 -0700
Message-ID: <20190610231239.103913-1-saravanak@google.com>
References: <20190608054711.GZ22737@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608054711.GZ22737@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, 0001-crypto-qcom-rng-Add-interconnect-dev.patch@google.com
Cc: Saravana Kannan <saravanak@google.com>, Rajendra Nayak <rnayak@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, evgreen@chromium.org, sibis@codeaurora.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is just an example code and I'm not actually trying to get this
merged.

Bjorn,

This is what the code would look like. It compiles, but I can't test it.
I'm not sending this as part of the patch series as I'm not sure what
the interconnects property should be set to in DT for qcom-rng device
nor is QCOM RNG an ideal candidate for bandwidth scaling using devfreq.
It can probably just set the bandwidth to some fixed low value like 1
KB/s. But this is pretty much all the code one would need if they wanted
to enable interconnect scaling for their interconnect path using
devfreq.

-Saravana

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/crypto/qcom-rng.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index e54249ccc009..7a92238061ca 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -9,6 +9,7 @@
 #include <linux/crypto.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/interconnect.h>
 #include <linux/platform_device.h>
 
 /* Device specific register offsets */
@@ -37,6 +38,7 @@ struct qcom_rng_ctx {
 };
 
 static struct qcom_rng *qcom_rng_dev;
+static struct icc_devfreq *icc_df;
 
 static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
 {
@@ -186,6 +188,13 @@ static int qcom_rng_probe(struct platform_device *pdev)
 		qcom_rng_dev = NULL;
 	}
 
+	ret = dev_pm_opp_of_add_table_indexed(&pdev->dev, 0);
+	if (ret)
+		return ret;
+	icc_df = icc_create_devfreq(&pdev->dev, "prng-slv");
+	if (IS_ERR(icc_df))
+		return PTR_ERR(icc_df);
+
 	return ret;
 }
 
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
