From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v1 5/9] dt-bindings: interconnect: Add interconnect-opp-table property
Date: Fri,  7 Jun 2019 21:43:35 -0700
Message-ID: <20190608044339.115026-6-saravanak@google.com>
References: <20190608044339.115026-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608044339.115026-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Saravana Kannan <saravanak@google.com>, Rajendra Nayak <rnayak@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, evgreen@chromium.org, sibis@codeaurora.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for listing bandwidth OPP tables for each interconnect path
listed using the interconnects property.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 .../devicetree/bindings/interconnect/interconnect.txt     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/interconnect.txt b/Documentation/devicetree/bindings/interconnect/interconnect.txt
index 6f5d23a605b7..fc5b75b76a2c 100644
--- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
+++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
@@ -55,10 +55,18 @@ interconnect-names : List of interconnect path name strings sorted in the same
 			 * dma-mem: Path from the device to the main memory of
 			            the system
 
+interconnect-opp-table: List of phandles to OPP tables (bandwidth OPP tables)
+			that specify the OPPs for the interconnect paths listed
+			in the interconnects property. This property can only
+			point to OPP tables that belong to the device and are
+			listed in the device's operating-points-v2 property.
+
 Example:
 
 	sdhci@7864000 {
+		operating-points-v2 = <&sdhc_opp_table>, <&sdhc_mem_opp_table>;
 		...
 		interconnects = <&pnoc MASTER_SDCC_1 &bimc SLAVE_EBI_CH0>;
 		interconnect-names = "sdhc-mem";
+		interconnect-opp-table = <&sdhc_mem_opp_table>;
 	};
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
