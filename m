From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v3 02/12] Documentation: ABI: Add occ-hwmon driver sysfs documentation
Date: Mon, 20 Nov 2017 17:53:31 -0600
Message-ID: <1511222021-562-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org, joel@jms.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Detail the sysfs attributes provided by the occ-hwmon driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/ABI/testing/sysfs-driver-occ-hwmon | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon

diff --git a/Documentation/ABI/testing/sysfs-driver-occ-hwmon b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
new file mode 100644
index 0000000..8873cc3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
@@ -0,0 +1,85 @@
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_active
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC is in the "active" state.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_ot
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has limited the processor
+		frequency due to over-temperature.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_power
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has limited the processor
+		frequency due to power usage.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_error
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates any error condition
+		observed by the OCC or detected by the driver. Reading the
+		attribute will return an integer. A negative integer indicates
+		either an error response from the OCC or bus error or other
+		error condition detected by the driver. A "0" indicates no
+		error.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_master
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC is the "master" OCC.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_mem_throttle
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not the OCC has throttled memory due
+		to over-temperature.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occs_present
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates the number of OCCs present
+		on the system.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_quick_drop
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has asserted the "quick
+		power drop" signal.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_status
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates the current OCC state. The
+		value of the attribute will be one of the following states:
+		0: Reserved
+		1: Standby
+		2: Observation
+		3: Active
+		4: Safe
+		5: Characterization
-- 
1.8.3.1

