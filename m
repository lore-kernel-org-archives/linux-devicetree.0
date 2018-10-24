From: Nickhu <nickhu@andestech.com>
Subject: [PATCH v3 0/4] nds32: Perf Support
Date: Wed, 24 Oct 2018 11:32:36 +0800
Message-ID: <cover.1540350887.git.nickhu@andestech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: greentime@andestech.com, linux-kernel@vger.kernel.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, deanbo422@gmail.com, peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, ebiederm@xmission.com, pombredanne@nexb.com, tglx@linutronix.de, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, john.garry@huawei.com, devicetree@vger.kernel.org, zong@andestech.com, alankao@andestech.com
Cc: Nickhu <nickhu@andestech.com>, green.hu@gmail.com
List-Id: devicetree@vger.kernel.org

* Sorry everyone, I forgot to add the version number
of the patch set I just sent.

These four commits are perf supporting for nds32.
There are three perfomance counters in nds32, and
each of them can counts different events. You can
use 'perf list' to show the available events that
can be used.

Changes in V2:
	1. Change the definition 'PFM_CTL_xxx' to
array form.

	2. Simplify the PMU driver.

	3. Stop all counters when handling irq
caused by performance counters overflow.

	4. Rename the compatible string in
devicetree.
	
Changes in V3:
	Fix the typo in Documentation/devicetree/
bindings/nds32/pmu.txt.

Nickhu (4):
  nds32: Fix bug in bitfield.h
  nds32: Perf porting
  nds32: Add perf call-graph support.
  nds32: Add document for NDS32 PMU.

 .../devicetree/bindings/nds32/pmu.txt         |   17 +
 arch/nds32/Kconfig                            |    1 +
 arch/nds32/boot/dts/ae3xx.dts                 |    5 +
 arch/nds32/include/asm/Kbuild                 |    1 +
 arch/nds32/include/asm/bitfield.h             |    4 +-
 arch/nds32/include/asm/perf_event.h           |   16 +
 arch/nds32/include/asm/pmu.h                  |  386 +++++
 arch/nds32/include/asm/stacktrace.h           |   39 +
 arch/nds32/kernel/Makefile                    |    3 +-
 arch/nds32/kernel/perf_event_cpu.c            | 1522 +++++++++++++++++
 arch/nds32/mm/fault.c                         |   13 +-
 tools/include/asm/barrier.h                   |    2 +
 tools/perf/arch/nds32/Build                   |    1 +
 tools/perf/arch/nds32/util/Build              |    1 +
 tools/perf/arch/nds32/util/header.c           |   29 +
 tools/perf/pmu-events/arch/nds32/mapfile.csv  |   15 +
 .../pmu-events/arch/nds32/n13/atcpmu.json     |  290 ++++
 17 files changed, 2337 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nds32/pmu.txt
 create mode 100644 arch/nds32/include/asm/perf_event.h
 create mode 100644 arch/nds32/include/asm/pmu.h
 create mode 100644 arch/nds32/include/asm/stacktrace.h
 create mode 100644 arch/nds32/kernel/perf_event_cpu.c
 create mode 100644 tools/perf/arch/nds32/Build
 create mode 100644 tools/perf/arch/nds32/util/Build
 create mode 100644 tools/perf/arch/nds32/util/header.c
 create mode 100644 tools/perf/pmu-events/arch/nds32/mapfile.csv
 create mode 100644 tools/perf/pmu-events/arch/nds32/n13/atcpmu.json

-- 
2.17.0
