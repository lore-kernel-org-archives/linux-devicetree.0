From: richard.gong@linux.intel.com
Subject: [PATCHv5 4/4] MAINTAINERS: add maintainer for Intel Stratix10 FW drivers
Date: Tue,  3 Sep 2019 08:18:21 -0500
Message-ID: <1567516701-26026-5-git-send-email-richard.gong@linux.intel.com>
References: <1567516701-26026-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567516701-26026-1-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, richard.gong@intel.com
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Add myself as maintainer for the newly created Intel Stratix10
firmware drivers.

Signed-off-by: Richard Gong <richard.gong@intel.com>
Reviewed-by: Alan Tull <atull@kernel.org>
---
v2: removed RSU binding text file
v3: no change
v4: no change
v5: s/richard.gong@intel.com/richard.gong@linux.intel.com
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4761f09..4387504 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8396,6 +8396,17 @@ F:	drivers/platform/x86/intel_speed_select_if/
 F:	tools/power/x86/intel-speed-select/
 F:	include/uapi/linux/isst_if.h
 
+INTEL STRATIX10 FIRMWARE DRIVERS
+M:	Richard Gong <richard.gong@linux.intel.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/stratix10-rsu.c
+F:	drivers/firmware/stratix10-svc.c
+F:	include/linux/firmware/intel/stratix10-smc.h
+F:	include/linux/firmware/intel/stratix10-svc-client.h
+F:	Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
+F:	Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
+
 INTEL TELEMETRY DRIVER
 M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
 M:	"David E. Box" <david.e.box@linux.intel.com>
-- 
2.7.4
