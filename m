From: Gerald BAEZA <gerald.baeza@st.com>
Subject: [PATCH v2 1/5] Documentation: perf: stm32: ddrperfm support
Date: Mon, 20 May 2019 15:27:15 +0000
Message-ID: <1558366019-24214-2-git-send-email-gerald.baeza@st.com>
References: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "arnd@arndb.de" <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gerald BAEZA <gerald.baeza@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.

This documentation introduces the DDRPERFM, the stm32-ddr-pmu driver
supporting it and how to use it with the perf tool.

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 Documentation/perf/stm32-ddr-pmu.txt | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/perf/stm32-ddr-pmu.txt

diff --git a/Documentation/perf/stm32-ddr-pmu.txt b/Documentation/perf/stm32-ddr-pmu.txt
new file mode 100644
index 0000000..d5b35b3
--- /dev/null
+++ b/Documentation/perf/stm32-ddr-pmu.txt
@@ -0,0 +1,41 @@
+STM32 DDR Performance Monitor (DDRPERFM)
+========================================
+
+The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.
+See STM32MP157 reference manual RM0436 to get a description of this peripheral.
+
+
+The five following counters are supported by stm32-ddr-pmu driver:
+	cnt0: read operations counters		(read_cnt)
+	cnt1: write operations counters		(write_cnt)
+	cnt2: active state counters		(activate_cnt)
+	cnt3: idle state counters		(idle_cnt)
+	tcnt: time count, present for all sets	(time_cnt)
+
+The stm32-ddr-pmu driver relies on the perf PMU framework to expose the
+counters via sysfs:
+	$ ls /sys/bus/event_source/devices/ddrperfm/events
+	activate_cnt  idle_cnt  read_cnt  time_cnt  write_cnt
+
+
+The perf PMU framework is usually invoked via the 'perf stat' tool.
+
+The DDRPERFM is a system monitor that cannot isolate the traffic coming from a
+given thread or CPU, that is why stm32-ddr-pmu driver rejects any 'perf stat'
+call that does not request a system-wide collection: the '-a, --all-cpus'
+option is mandatory!
+
+Example:
+	$ perf stat -e ddrperfm/read_cnt/,ddrperfm/time_cnt/ -a sleep 20
+	Performance counter stats for 'system wide':
+
+	         342541560      ddrperfm/read_cnt/
+	       10660011400      ddrperfm/time_cnt/
+
+	      20.021068551 seconds time elapsed
+
+
+The driver also exposes a 'bandwidth' attribute that can be used to display
+the read/write/total bandwidth achieved during the last 'perf stat' execution.
+	$ cat /sys/bus/event_source/devices/ddrperfm/bandwidth
+	Read = 403, Write = 239, Read & Write = 642 (MB/s)
-- 
2.7.4
