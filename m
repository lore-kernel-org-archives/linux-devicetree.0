From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v8 3/3] regulator: qcom-rpm: Add missing state flag in call to
 RPM
Date: Wed, 26 Nov 2014 13:51:01 -0800
Message-ID: <1417038661-30209-4-git-send-email-bjorn.andersson@sonymobile.com>
References: <1417038661-30209-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417038661-30209-1-git-send-email-bjorn.andersson@sonymobile.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, Josh Cartwright <joshc@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the missing state parameter to the call down to the RPM. This
is currently hard coded to the active state, as that's all we're
supporting at this moment.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/regulator/qcom_rpm-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index b55cd5b..8f66040 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -198,6 +198,7 @@ static int rpm_reg_write(struct qcom_rpm_reg *vreg,
 	vreg->val[req->word] |= value << req->shift;
 
 	return qcom_rpm_write(vreg->rpm,
+			      QCOM_RPM_ACTIVE_STATE,
 			      vreg->resource,
 			      vreg->val,
 			      vreg->parts->request_len);
-- 
1.8.2.2
