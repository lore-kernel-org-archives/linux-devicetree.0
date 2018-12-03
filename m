From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH 0/4] Timer code cleanup.
Date: Mon,  3 Dec 2018 12:57:27 -0800
Message-ID: <1543870651-16669-1-git-send-email-atish.patra@wdc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Damien Le Moal <Damien.LeMoal@wdc.com>
List-Id: devicetree@vger.kernel.org


This patch series provides an assorted timer cleanups in RISC-V.

Atish Patra (3):
RISC-V: Support per-hart timebase-frequency
RISC-V: Remove per cpu clocksource
RISC-V: Fix non-smp kernel boot on SMP systems

Palmer Dabbelt (1):
dt-bindings: Correct RISC-V's timebase-frequency

Documentation/devicetree/bindings/riscv/cpus.txt |  4 ++-
arch/riscv/kernel/time.c                         |  9 +-----
drivers/clocksource/riscv_timer.c                | 39 ++++++++++++++++++++----
3 files changed, 37 insertions(+), 15 deletions(-)

--
2.7.4
