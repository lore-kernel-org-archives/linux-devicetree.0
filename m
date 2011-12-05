From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] Rename propgated to dt binding documentation
Date: Mon,  5 Dec 2011 15:58:06 -0800
Message-ID: <1323129487-24859-4-git-send-email-rklein@nvidia.com>
References: <1323129487-24859-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323129487-24859-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/power_supply/sbs_sbs-battery.txt      |   23 ++++++++++++++++++++
 .../bindings/power_supply/ti_bq20z75.txt           |   23 --------------------
 2 files changed, 23 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt
 delete mode 100644 Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt

diff --git a/Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt b/Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt
new file mode 100644
index 0000000..c40e892
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt
@@ -0,0 +1,23 @@
+SBS sbs-battery
+~~~~~~~~~~
+
+Required properties :
+ - compatible : "sbs,sbs-battery"
+
+Optional properties :
+ - sbs,i2c-retry-count : The number of times to retry i2c transactions on i2c
+   IO failure.
+ - sbs,poll-retry-count : The number of times to try looking for new status
+   after an external change notification.
+ - sbs,battery-detect-gpios : The gpio which signals battery detection and
+   a flag specifying its polarity.
+
+Example:
+
+	bq20z75@b {
+		compatible = "sbs,sbs-battery";
+		reg = < 0xb >;
+		sbs,i2c-retry-count = <2>;
+		sbs,poll-retry-count = <10>;
+		sbs,battery-detect-gpios = <&gpio-controller 122 1>;
+	}
diff --git a/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt b/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt
deleted file mode 100644
index 7571294..0000000
--- a/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-TI bq20z75
-~~~~~~~~~~
-
-Required properties :
- - compatible : "ti,bq20z75"
-
-Optional properties :
- - ti,i2c-retry-count : The number of times to retry i2c transactions on i2c
-   IO failure.
- - ti,poll-retry-count : The number of times to try looking for new status
-   after an external change notification.
- - ti,battery-detect-gpios : The gpio which signals battery detection and
-   a flag specifying its polarity.
-
-Example:
-
-	bq20z75@b {
-		compatible = "ti,bq20z75";
-		reg = < 0xb >;
-		ti,i2c-retry-count = <2>;
-		ti,poll-retry-count = <10>;
-		ti,battery-detect-gpios = <&gpio-controller 122 1>;
-	}
-- 
1.7.0.4
