From: Nickhu <nickhu@andestech.com>
Subject: [PATCH v3 4/4] nds32: Add document for NDS32 PMU.
Date: Wed, 24 Oct 2018 11:32:40 +0800
Message-ID: <bdfe23ce3ded5299d7b525fcb16c353c2be31924.1540350887.git.nickhu@andestech.com>
References: <cover.1540350887.git.nickhu@andestech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1540350887.git.nickhu@andestech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: greentime@andestech.com, linux-kernel@vger.kernel.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, deanbo422@gmail.com, peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, ebiederm@xmission.com, pombredanne@nexb.com, tglx@linutronix.de, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, john.garry@huawei.com, devicetree@vger.kernel.org, zong@andestech.com, alankao@andestech.com
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
index 000000000000..1bd15785b4ae
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
+- compatible :
+	"andestech,nds32v3-pmu"
+
+- interrupts : The interrupt number for NDS32 PMU is 13.
+
+Example:
+pmu{
+	compatible = "andestech,nds32v3-pmu";
+	interrupts = <13>;
+}
-- 
2.17.0
