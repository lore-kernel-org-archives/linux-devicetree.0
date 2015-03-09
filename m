From: Lina Iyer <lina.iyer@linaro.org>
Subject: [RFC PATCH v15 04/11] ARM: cpuidle: Register cpuidle_ops for QCOM cpus
Date: Mon,  9 Mar 2015 09:16:39 -0600
Message-ID: <1425914206-22295-5-git-send-email-lina.iyer@linaro.org>
References: <1425914206-22295-1-git-send-email-lina.iyer@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1425914206-22295-1-git-send-email-lina.iyer@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, khilman@linaro.org, sboyd@codeaurora.org, galak@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: lorenzo.pieralisi@arm.com, msivasub@codeaurora.org, devicetree@vger.kernel.org, Lina Iyer <lina.iyer@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Register cpuidle ops for Krait Processor Sub-System.
Supports v1 and v2 versions of KPSS.

Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Hilman <khilman@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
---
 arch/arm/include/asm/cpuidle_ops.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/include/asm/cpuidle_ops.h b/arch/arm/include/asm/cpuidle_ops.h
index be0a612..40cb262 100644
--- a/arch/arm/include/asm/cpuidle_ops.h
+++ b/arch/arm/include/asm/cpuidle_ops.h
@@ -1,3 +1,8 @@
 /*
  * List of cpuidle operations
  */
+
+#if IS_ENABLED(CONFIG_QCOM_PM)
+CPUIDLE_OPS(qcom_kpss_v1)
+CPUIDLE_OPS(qcom_kpss_v2)
+#endif
-- 
2.1.0

