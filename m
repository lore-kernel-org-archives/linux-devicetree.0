From: richard.gong@linux.intel.com
Subject: [PATCHv1 6/6] MAINTAINERS: add maintainer for Intel Stratix10 FW drivers
Date: Tue,  9 Apr 2019 13:46:02 -0500
Message-ID: <1554835562-25056-7-git-send-email-richard.gong@linux.intel.com>
References: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, richard.gong@linux.intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Add myself as maintainer for the newly created Intel Stratix10
firmware drivers.

Signed-off-by: Richard Gong <richard.gong@intel.com>
Reviewed-by: Alan Tull <atull@kernel.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cf3cbf..d7054f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8039,6 +8039,16 @@ S:	Supported
 F:	drivers/infiniband/hw/i40iw/
 F:	include/uapi/rdma/i40iw-abi.h
 
+INTEL STRATIX10 FIRMWARE DRIVERS
+M:	Richard Gong <richard.gong@intel.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/stratix10*
+F:	include/linux/firmware/intel/
+F:	Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
+F:	Documentation/devicetree/bindings/firmware/intel,stratix10-rsu.txt
+F:	Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
+
 INTEL TELEMETRY DRIVER
 M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
 M:	"David E. Box" <david.e.box@linux.intel.com>
-- 
2.7.4
