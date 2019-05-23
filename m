From: richard.gong@linux.intel.com
Subject: [PATCHv3 3/4] firmware: rsu: document sysfs interface
Date: Thu, 23 May 2019 08:03:29 -0500
Message-ID: <1558616610-499-4-git-send-email-richard.gong@linux.intel.com>
References: <1558616610-499-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558616610-499-1-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, richard.gong@linux.intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Describe Intel Stratix10 Remote System Update (RSU) device attributes

Signed-off-by: Richard Gong <richard.gong@intel.com>
Reviewed-by: Alan Tull <atull@kernel.org>
---
v2: changed to use tab everywhere and wrap lines at 72 colums
    s/soc:firmware:svc:rsu/stratix10-rsu.0
    added for watchdog
v3: s/KernelVersion:5.2/KernelVersion:5.3
---
 .../testing/sysfs-devices-platform-stratix10-rsu   | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
new file mode 100644
index 0000000..73ebaf2
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
@@ -0,0 +1,100 @@
+		Intel Stratix10 Remote System Update (RSU) device attributes
+
+What:		/sys/devices/platform/stratix10-rsu.0/current_image
+Date:		May 2019
+KernelVersion:	5.3
+Contact:	Richard Gong <richard.gong@intel.com>
+Description:
+		(RO) the address of image currently running in flash.
+
+What:		/sys/devices/platform/stratix10-rsu.0/fail_image
+Date:		May 2019
+KernelVersion:	5.3
+Contact:	Richard Gong <richard.gong@intel.com>
+Description:
+		(RO) the address of failed image in flash.
+
+What:		/sys/devices/platform/stratix10-rsu.0/state
+Date:		May 2019
+KernelVersion:	5.3
+Contact:	Richard Gong <richard.gong@intel.com>
+Description:
+		(RO) the state of RSU system.
+		The state field has two parts: major error code in upper 16 bits and
+		minor error code in lower 16 bits.
+
+		Major error code:
+			0xF001	bitstream error
+			0xF002	hardware access failure
+			0xF003	bitstream corruption
+			0xF004	internal error
+			0xF005	device error
+			0xF006	CPU watchdog timeout
+			0xF007	internal unknown error
+		Minor error code:
+			Currently used only when major error is 0xF006
+			(CPU watchdog timeout), in which case the minor
+			error code is the value reported by CPU to
+			firmware through the RSU notify command before
+			the watchdog timeout occurs.
+
+What:		/sys/devices/platform/stratix10-rsu.0/fail_image
+Date:           May 2019
+KernelVersion:  5.3
+Contact:        Richard Gong <richard.gong@intel.com>
+Description:
+		(RO) the version number of RSU firmware.
+
+What:		/sys/devices/platform/stratix10-rsu.0/error_location
+Date:           May 2019
+KernelVersion:  5.3
+Contact:        Richard Gong <richard.gong@intel.com>
+Description:
+		(RO) the error offset inside the image that failed.
+
+What:		/sys/devices/platform/stratix10-rsu.0/error_details
+Date:           May 2019
+KernelVersion:  5.3
+Contact:        Richard Gong <richard.gong@intel.com>
+Description:
+		(RO) error code.
+
+What:		/sys/devices/platform/stratix10-rsu.0/reboot_image
+Date:           May 2019
+KernelVersion:  5.3
+Contact:        Richard Gong <richard.gong@intel.com>
+Description:
+		(WO) the address of image to be loaded on next reboot command.
+
+What:		/sys/devices/platform/stratix10-rsu.0/notify
+Date:           May 2019
+KernelVersion:  5.3
+Contact:        Richard Gong <richard.gong@intel.com>
+Description:
+		(WO) inform firmware that the current software state as
+		a 16-bit numerical value below:
+			0 is for the first stage bootloader didn't run
+			or didn't reach the point of launching second
+			stage bootloader.
+			1 is for failed in second bootloader or didn't
+			get to the point of launching the operating
+			system.
+			2 is for both first and second stage bootloader
+			ran and the operating system launch was
+			attempted.
+
+What:		/sys/devices/platform/stratix10-rsu.0/watchdog
+Date:		May 2019
+KernelVersion:	5.3
+Contact:	Richard Gong <richard.gong@intel.com>
+Description:
+		(WO) instruct firmware what to do when rebooting due to
+		a watchdog timer expiration. The attribute takes a
+		32 bits word as the parameter indicating the action for
+		firmware to take:
+
+			b[0] is set to 0, the firmware should reboot
+			with the normal RSU flow.
+			b[0] is set to 1, the firmware shall always
+			reboot with the current running image.
+			b[31:1] reserved.
-- 
2.7.4
