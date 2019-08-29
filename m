From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v10 6/7] dt-bindings: Add depends-on property to break cyclic
 inferred dependencies
Date: Thu, 29 Aug 2019 00:46:02 -0700
Message-ID: <20190829074603.70424-7-saravanak@google.com>
References: <20190829074603.70424-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829074603.70424-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

The functional dependencies of a device can be inferred by looking at
the common devicetree bindings like clocks, interconnects and
regulators.

However, this can sometimes result in cyclic dependencies where one of
the inferred dependencies isn't really a functional dependency.

Add a depends-on property that can override inferred dependencies by
explicitly listing the suppliers of a device and thereby allow breaking
any cyclic inferred depenencies.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 .../devicetree/bindings/depends-on.txt        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/depends-on.txt

diff --git a/Documentation/devicetree/bindings/depends-on.txt b/Documentation/devicetree/bindings/depends-on.txt
new file mode 100644
index 000000000000..e6535917b189
--- /dev/null
+++ b/Documentation/devicetree/bindings/depends-on.txt
@@ -0,0 +1,46 @@
+Explicit listing of dependencies
+================================
+
+Apart from parent-child relationships, devices (consumers) often have
+functional dependencies on other devices (suppliers). Examples of common
+suppliers are clocks, interconnects and regulators.
+
+The consumer-supplier dependencies of most devices can be inferred by
+simply looking at the devicetree bindings of common suppliers like clocks,
+interconnects and regulators.  However, this can sometimes result in cyclic
+dependencies where one of the inferred dependencies isn't really a
+functional dependency.
+
+When there is an inferred cyclic dependency between devices, we need a way
+to explicitly list the suppliers of one or more devices in the cycle so
+that we can break the cycle.
+
+The depends-on property fills this need. It can be used to explicitly list
+the suppliers of a device and override any inferred dependencies of that
+device.
+
+This property shall be used ONLY to break cyclic dependencies.
+
+Optional properties:
+- depends-on:	A list of phandles to suppliers of the device.
+
+Examples:
+Here, the inferred depencency would state that cc2 is dependent on cc1 and
+cc3; and cc3 is dependent on cc1 and cc2. This creates a cycle between cc2
+and cc3.
+
+With the use of depends-on, cc2 is only dependent on cc1; and cc3 is still
+dependent on cc1 and cc2. This breaks the cycle between cc2 and cc3.
+
+cc2: cc2@40031000 {
+	      compatible = "cc2";
+	      reg = <0x40031000 0x1000>;
+	      clocks = <&cc1 10>, <&cc3 7>;
+	      depends-on = <&cc1>;
+};
+
+cc3: cc3@40034000 {
+	      compatible = "cc3";
+	      reg = <0x40031000 0x1000>;
+	      clocks = <&cc1 10>, <&cc2 7>;
+};
-- 
2.23.0.187.g17f5b7556c-goog
