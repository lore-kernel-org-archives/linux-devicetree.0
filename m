From: Andy Gross <agross@codeaurora.org>
Subject: [Patch v2 1/4] soc: Placeholder files for drivers/soc
Date: Thu, 24 Apr 2014 11:31:19 -0500
Message-ID: <1398357082-5102-2-git-send-email-agross@codeaurora.org>
References: <1398357082-5102-1-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398357082-5102-1-git-send-email-agross@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@codeaurora.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add placeholder Kconfig and linkage for driver/soc.

The first patch set that implemented this was authored by Santosh Shilimkar:
https://lkml.org/lkml/2014/2/28/567

Signed-off-by: Andy Gross <agross@codeaurora.org>
---
 drivers/Kconfig     |    2 ++
 drivers/Makefile    |    4 ++++
 drivers/soc/Kconfig |    4 ++++
 3 files changed, 10 insertions(+)
 create mode 100644 drivers/soc/Kconfig

diff --git a/drivers/Kconfig b/drivers/Kconfig
index b3138fb..37f955f 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -130,6 +130,8 @@ source "drivers/staging/Kconfig"
 
 source "drivers/platform/Kconfig"
 
+source "drivers/soc/Kconfig"
+
 source "drivers/clk/Kconfig"
 
 source "drivers/hwspinlock/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index 8e3b8b0..ba77e7b 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -132,6 +132,10 @@ obj-$(CONFIG_VHOST_RING)	+= vhost/
 obj-$(CONFIG_VLYNQ)		+= vlynq/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
+
+# soc specific drivers
+obj-y				+= soc/
+
 #common clk code
 obj-y				+= clk/
 
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
new file mode 100644
index 0000000..58bd962
--- /dev/null
+++ b/drivers/soc/Kconfig
@@ -0,0 +1,4 @@
+menu "SOC specific Drivers"
+
+endmenu
+`
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
