From: Hoan Tran <hotran@apm.com>
Subject: [PATCH v2 1/3] Documentation: dtb: xgene: Add hwmon dts binding
 documentation
Date: Mon, 11 Jul 2016 17:30:14 -0700
Message-ID: <1468283416-12780-2-git-send-email-hotran@apm.com>
References: <1468283416-12780-1-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468283416-12780-1-git-send-email-hotran@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Duc Dang <dhdang@apm.com>, linux-doc@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, lho@apm.com, Hoan Tran <hotran@apm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the APM X-Gene hwmon device tree node documentation.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
 .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
new file mode 100644
index 0000000..59b3855
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
@@ -0,0 +1,14 @@
+APM X-Gene hwmon driver
+
+APM X-Gene SOC sensors are accessed over the "SLIMpro" mailbox.
+
+Required properties :
+ - compatible : should be "apm,xgene-slimpro-hwmon"
+ - mboxes : use the label reference for the mailbox as the first parameter.
+	    The second parameter is the channel number.
+
+Example :
+	hwmonslimpro {
+		compatible = "apm,xgene-slimpro-hwmon";
+		mboxes = <&mailbox 7>;
+	};
-- 
1.9.1
