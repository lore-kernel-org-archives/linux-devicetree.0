From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v1 3/5] dt-bindings: Add depends-on property
Date: Thu, 23 May 2019 18:01:14 -0700
Message-ID: <20190524010117.225219-4-saravanak@google.com>
References: <20190524010117.225219-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524010117.225219-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

The depends-on property is used to list the mandatory functional
dependencies of a consumer device on zero or more supplier devices.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 .../devicetree/bindings/depends-on.txt        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/depends-on.txt

diff --git a/Documentation/devicetree/bindings/depends-on.txt b/Documentation/devicetree/bindings/depends-on.txt
new file mode 100644
index 000000000000..1cbddd11cf17
--- /dev/null
+++ b/Documentation/devicetree/bindings/depends-on.txt
@@ -0,0 +1,26 @@
+Functional dependency linking
+=============================
+
+Apart from parent-child relationships, devices (consumers) often have
+functional dependencies on other devices (suppliers). Common examples of
+suppliers are clock, regulators, pinctrl, etc. However not all of them are
+dependencies with well defined devicetree bindings. Also, not all functional
+dependencies are mandatory as the device might be able to operate in a limited
+mode without some of the dependencies.
+
+The depends-on property allows marking these mandatory functional dependencies
+between one or more devices. The depends-on property is used by the consumer
+device to point to all its mandatory supplier devices.
+
+Optional properties:
+- depends-on:	A list of phandles to mandatory suppliers of the device.
+
+
+Examples:
+Here, the device is dependent on only 2 of the 3 clock providers
+dev@40031000 {
+	      compatible = "name";
+	      reg = <0x40031000 0x1000>;
+	      clocks = <&osc_1 1>, <&osc_2 7> <&osc_3 5>;
+	      depends-on = <&osc_1>, <&osc_3>;
+};
-- 
2.22.0.rc1.257.g3120a18244-goog
