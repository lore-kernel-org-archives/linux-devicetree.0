From: Colin King <colin.king@canonical.com>
Subject: [PATCH] bus: qcom: fix spelling mistake "ambigous" -> "ambiguous"
Date: Wed, 11 Sep 2019 16:39:47 +0100
Message-ID: <20190911153947.10203-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake on the documentation. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/devicetree/bindings/bus/qcom,ebi2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/qcom,ebi2.txt b/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
index 5a7d567f6833..5058aa2c63b2 100644
--- a/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
+++ b/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
@@ -71,7 +71,7 @@ Optional subnodes:
 
 The following optional properties are properties that can be tagged onto
 any device subnode. We are assuming that there can be only ONE device per
-chipselect subnode, else the properties will become ambigous.
+chipselect subnode, else the properties will become ambiguous.
 
 Optional properties arrays for SLOW chip selects:
 - qcom,xmem-recovery-cycles: recovery cycles is the time the memory continues to
-- 
2.20.1
