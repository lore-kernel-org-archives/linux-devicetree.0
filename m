From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH RESEND v2 3/3] Documentation: sysfs: add Broadcom GISB arbiter sysfs properties
Date: Mon, 19 May 2014 13:06:01 -0700
Message-ID: <1400529962-9612-4-git-send-email-f.fainelli@gmail.com>
References: <1400529962-9612-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400529962-9612-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Alexander Shiyan <shc_work@mail.ru>, Huang Shijie <b32955@freescale.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch documents the sysfs properties exposed by the Broadcom GISB
bus arbiter hardware.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:
- respin

 Documentation/ABI/testing/sysfs-platform-brcmstb-gisb-arb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-brcmstb-gisb-arb

diff --git a/Documentation/ABI/testing/sysfs-platform-brcmstb-gisb-arb b/Documentation/ABI/testing/sysfs-platform-brcmstb-gisb-arb
new file mode 100644
index 000000000000..f1bad92bbe27
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-brcmstb-gisb-arb
@@ -0,0 +1,8 @@
+What:		/sys/devices/../../gisb_arb_timeout
+Date:		May 2014
+KernelVersion:	3.17
+Contact:	Florian Fainelli <f.fainelli@gmail.com>
+Description:
+		Returns the currently configured raw timeout value of the
+		Broadcom Set Top Box internal GISB bus arbiter. Minimum value
+		is 1, and maximum value is 0xffffffff.
-- 
1.9.1
