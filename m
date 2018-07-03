From: Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH 2/4] Documentation: ABI: Add sysfs-class-bmc documentation to testing
Date: Tue,  3 Jul 2018 17:04:11 +1000
Message-ID: <20180703070413.28756-3-andrew@aj.id.au>
References: <20180703070413.28756-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703070413.28756-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, gregkh@linuxfoundation.org, Eugene.Cho@dell.com, a.amelkin@yadro.com, stewart@linux.ibm.com, benh@kernel.crashing.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/ABI/testing/sysfs-class-bmc | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-bmc

diff --git a/Documentation/ABI/testing/sysfs-class-bmc b/Documentation/ABI/testing/sysfs-class-bmc
new file mode 100644
index 000000000000..9d42106b89f9
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-bmc
@@ -0,0 +1,62 @@
+This document defines the sysfs attributes common to the bmc device class. See
+Documentation/devicetree/bindings/misc/bmc-misc-ctrl.txt for exhaustive list of
+field definitions.
+
+What:		/sys/class/bmc/<field>/label
+Date:		July, 2018
+KernelVersion:	v4.19
+Contact:	openbmc@lists.ozlabs.org
+Description:
+		The name of the field of interest. Corresponds to the value of
+		<field> in the path
+Users:		openbmc@lists.ozlabs.org
+
+What:		/sys/class/bmc/<field>/value
+Date:		July, 2018
+KernelVersion:	v4.19
+Contact:	openbmc@lists.ozlabs.org
+Description:
+		The value of the field of interest.
+
+		If the field is exposed from a read-modify-write register this
+		attribute will be RW, where writes will set the field to the
+		value written. Writing values that exceed the width of the
+		field will return an error.
+
+		If the field is exposed from a write-1-set/write-1-clear
+		register this attribute will be RO, and the attributes 'set'
+		and 'clear' will be present as write-only.
+Users:		openbmc@lists.ozlabs.org
+
+What:		/sys/class/bmc/<field>/mask
+Date:		July, 2018
+KernelVersion:	v4.19
+Contact:	openbmc@lists.ozlabs.org
+Description:
+		The mask applied to the value read/written from the 'value'
+		attribute.
+Users:		openbmc@lists.ozlabs.org
+
+What:		/sys/class/bmc/<field>/set
+Users:		openbmc@lists.ozlabs.org
+Date:		July, 2018
+KernelVersion:	v4.19
+Contact:	openbmc@lists.ozlabs.org
+Description:
+		For fields backed by write-1-set/write-1-clear registers,
+		set bits in the value written will be set in hardware. Zero
+		values are ignored. Writing values that exceed the width of the
+		mask value will return an error.
+Users:		openbmc@lists.ozlabs.org
+
+What:		/sys/class/bmc/<field>/clear
+Users:		openbmc@lists.ozlabs.org
+Date:		July, 2018
+KernelVersion:	v4.19
+Contact:	openbmc@lists.ozlabs.org
+Description:
+		For fields backed by write-1-set/write-1-clear registers,
+		set bits in the value written will be cleared in hardware. Zero
+		values are ignored. Writing values that exceed the width of the
+		mask value will return an error.
+Users:		openbmc@lists.ozlabs.org
-- 
2.17.1
