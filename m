From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Subject: [PATCH v3 0/2] ARC: Add perf support for ARC700 cores
Date: Thu,  7 Nov 2013 14:55:10 +0100
Message-ID: <1383832512-21130-1-git-send-email-mjonker@synopsys.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Vineet.Gupta1@synopsys.com, mingo@redhat.com, a.p.zijlstra@chello.nl
Cc: Mischa Jonker <Mischa.Jonker@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi all,

Please find v3 of my attempt to add support for perf for ARC700 PMU's. If
possible, it would be nice to get some feedback on the implementation from
non-ARC/Synopsys people familiar with the perf subsystem in Linux.

Thanks,

Mischa


v3:
	split devicetree binding doc into separate patch
	updated devicetree binding doc according to review comments
v2:
	updated comments to kernel coding standards
	renamed devicetree binding to snps,arc700-pmu
	added devicetree binding doc


Mischa Jonker (2):
  ARC: Add perf support for ARC700 cores
  ARC: Add documentation on DT binding for ARC700 PMU

 Documentation/devicetree/bindings/arc/pmu.txt |   24 ++
 arch/arc/boot/dts/angel4.dts                  |    4 +
 arch/arc/include/asm/perf_event.h             |  204 +++++++++++++++-
 arch/arc/kernel/Makefile                      |    1 +
 arch/arc/kernel/perf_event.c                  |  322 +++++++++++++++++++++++++
 5 files changed, 554 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arc/pmu.txt
 create mode 100644 arch/arc/kernel/perf_event.c

-- 
1.7.9.5

