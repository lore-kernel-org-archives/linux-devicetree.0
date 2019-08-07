From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 1/3] dt-bindings: opp: Introduce opp-peak-kBps and
 opp-avg-kBps bindings
Date: Wed,  7 Aug 2019 15:31:09 -0700
Message-ID: <20190807223111.230846-2-saravanak@google.com>
References: <20190807223111.230846-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807223111.230846-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>, vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Interconnects often quantify their performance points in terms of
bandwidth. So, add opp-peak-kBps (required) and opp-avg-kBps (optional) to
allow specifying Bandwidth OPP tables in DT.

opp-peak-kBps is a required property that replaces opp-hz for Bandwidth OPP
tables.

opp-avg-kBps is an optional property that can be used in Bandwidth OPP
tables.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 Documentation/devicetree/bindings/opp/opp.txt     | 15 ++++++++++++---
 .../devicetree/bindings/property-units.txt        |  4 ++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
index 68592271461f..dbad8eb6c746 100644
--- a/Documentation/devicetree/bindings/opp/opp.txt
+++ b/Documentation/devicetree/bindings/opp/opp.txt
@@ -83,9 +83,14 @@ properties.
 
 Required properties:
 - opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
-  required property for all device nodes but devices like power domains. The
-  power domain nodes must have another (implementation dependent) property which
-  uniquely identifies the OPP nodes.
+  required property for all device nodes except for devices like power domains
+  or bandwidth opp tables. The power domain nodes must have another
+  (implementation dependent) property which uniquely identifies the OPP nodes.
+  The interconnect opps are required to have the opp-peak-kBps property.
+
+- opp-peak-kBps: Peak bandwidth in kilobytes per second, expressed as a 32-bit
+  big-endian integer. This is a required property for all devices that don't
+  have opp-hz. For example, bandwidth OPP tables for interconnect paths.
 
 Optional properties:
 - opp-microvolt: voltage in micro Volts.
@@ -132,6 +137,10 @@ Optional properties:
 - opp-level: A value representing the performance level of the device,
   expressed as a 32-bit integer.
 
+- opp-avg-kBps: Average bandwidth in kilobytes per second, expressed as a
+  32-bit big-endian integer. This property is only meaningful in OPP tables
+  where opp-peak-kBps is present.
+
 - clock-latency-ns: Specifies the maximum possible transition latency (in
   nanoseconds) for switching to this OPP from any other OPP.
 
diff --git a/Documentation/devicetree/bindings/property-units.txt b/Documentation/devicetree/bindings/property-units.txt
index e9b8360b3288..c80a110c1e26 100644
--- a/Documentation/devicetree/bindings/property-units.txt
+++ b/Documentation/devicetree/bindings/property-units.txt
@@ -41,3 +41,7 @@ Temperature
 Pressure
 ----------------------------------------
 -kpascal	: kilopascal
+
+Throughput
+----------------------------------------
+-kBps		: kilobytes per second
-- 
2.23.0.rc1.153.gdeed80330f-goog
