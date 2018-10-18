From: Nickhu <nickhu@andestech.com>
Subject: [PATCH 5/5] nds32: Add document for NDS32 PMU.
Date: Thu, 18 Oct 2018 16:43:17 +0800
Message-ID: <c0a80d2db642b1d9547ff412d91baa9927b68aac.1539745993.git.nickhu@andestech.com>
References: <cover.1539745993.git.nickhu@andestech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1539745993.git.nickhu@andestech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: greentime@andestech.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, deanbo422@gmail.com, peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, arnd@arndb.de, sboyd@codeaurora.org, geert@linux-m68k.org, zong@andestech.com, ebiederm@xmission.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, pombredanne@nexb.com, tglx@linutronix.de, kstewart@linuxfoundation.org, devicetree@vger.kernel.org
Cc: Nickhu <nickhu@andestech.com>, green.hu@gmail.com
List-Id: devicetree@vger.kernel.org

The document for how to add NDS32 PMU
in devicetree.

Signed-off-by: Nickhu <nickhu@andestech.com>
---
 Documentation/devicetree/bindings/nds32/pmu.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nds32/pmu.txt

diff --git a/Documentation/devicetree/bindings/nds32/pmu.txt b/Documentation/devicetree/bindings/nds32/pmu.txt
new file mode 100644
index 000000000000..02762b850e59
--- /dev/null
+++ b/Documentation/devicetree/bindings/nds32/pmu.txt
@@ -0,0 +1,17 @@
+* NDS32 Performance Monitor Units
+
+NDS32 core have a PMU for counting cpu and cache events like cache misses.
+The NDS32 PMU representation in the device tree should be done as under:
+
+Required properties:
+
+- compatilbe :
+	"andestech,atcpmu"
+
+- interrupts : The interrupt number for NDS32 PMU is 13.
+
+Example:
+pmu{
+	compatible = "andestech,atcpmu";
+	interrupts = <13>;
+}
-- 
2.17.0
