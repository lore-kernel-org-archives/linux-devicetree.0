From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/3] Malta DT memory init
Date: Tue, 22 Sep 2015 11:56:35 -0700
Message-ID: <1442948198-14507-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, James Hogan <james.hogan@imgtec.com>, Pawel Moll <pawel.moll@arm.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This series extracts some parts of my earlier Malta DT conversion
patchset which I believe should be good to merge independently from the
rest (which require further interrupt work).

Paul Burton (3):
  MIPS: malta: split obj-y entries across lines
  MIPS: malta: remove fw_memblock_t abstraction
  MIPS: malta: setup RAM regions via DT

 arch/mips/Kconfig                               |   2 +
 arch/mips/boot/dts/mti/malta.dts                |   4 +
 arch/mips/include/asm/fw/fw.h                   |  16 ---
 arch/mips/include/asm/mach-malta/malta-dtshim.h |  29 +++++
 arch/mips/mti-malta/Makefile                    |  15 ++-
 arch/mips/mti-malta/malta-dtshim.c              | 162 ++++++++++++++++++++++++
 arch/mips/mti-malta/malta-memory.c              | 131 +------------------
 arch/mips/mti-malta/malta-setup.c               |   5 +-
 8 files changed, 215 insertions(+), 149 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-malta/malta-dtshim.h
 create mode 100644 arch/mips/mti-malta/malta-dtshim.c

-- 
2.5.3
