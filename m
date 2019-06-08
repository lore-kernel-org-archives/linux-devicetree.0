From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v1 8/9] OPP: Allow copying OPPs tables between devices
Date: Fri,  7 Jun 2019 21:43:38 -0700
Message-ID: <20190608044339.115026-9-saravanak@google.com>
References: <20190608044339.115026-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608044339.115026-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Saravana Kannan <saravanak@google.com>, Rajendra Nayak <rnayak@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, evgreen@chromium.org, sibis@codeaurora.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some hardware devices might create multiple children devices to manage
different components of the hardware. In these cases, it might be necessary
for the original hardware device to copy specific OPP tables to a specific
the new child device. Add dev_pm_opp_add_opp_table() to do that.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/opp/core.c     | 8 ++++++++
 include/linux/pm_opp.h | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index d96d5746eb47..9d49aee2c3ef 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -943,6 +943,14 @@ struct opp_device *_add_opp_dev(const struct device *dev,
 	return opp_dev;
 }
 
+int dev_pm_opp_add_opp_table(struct device *dev, struct opp_table *opp_table)
+{
+	if (!dev || !opp_table)
+		return -EINVAL;
+
+	return _add_opp_dev(dev, opp_table) ? 0 : -ENOMEM;
+}
+
 static struct opp_table *_allocate_opp_table(struct device *dev, int index)
 {
 	struct opp_table *opp_table;
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 13381dc3dd39..31acc617fda3 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -81,6 +81,7 @@ struct dev_pm_set_opp_data {
 struct opp_table *dev_pm_opp_get_opp_table(struct device *dev);
 struct opp_table *dev_pm_opp_get_opp_table_indexed(struct device *dev, int index);
 void dev_pm_opp_put_opp_table(struct opp_table *opp_table);
+int dev_pm_opp_add_opp_table(struct device *dev, struct opp_table *opp_table);
 
 unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp);
 
@@ -158,6 +159,12 @@ static inline struct opp_table *dev_pm_opp_get_opp_table_indexed(struct device *
 
 static inline void dev_pm_opp_put_opp_table(struct opp_table *opp_table) {}
 
+static int dev_pm_opp_add_opp_table(struct device *dev,
+				    struct opp_table *opp_table)
+{
+	return -ENOTSUPP;
+}
+
 static inline unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp)
 {
 	return 0;
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
