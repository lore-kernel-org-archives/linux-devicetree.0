From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v3 0/5] Miscellaneous fixes
Date: Wed, 31 Jul 2019 17:58:38 -0700
Message-ID: <20190801005843.10343-1-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anup Patel <anup.patel@wdc.com>, Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Gary Guo <gary@garyguo.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
List-Id: devicetree@vger.kernel.org

This patch series have some unrelated fixes related
to clocksource, dt-bindings and isa strings.

I combined them into series as most of them are
prerequisite for kvm patch series.

Changes from v2->v3:
1. Updated commit text of dt binding patch.
2. Removed couple of remaining uppercase usage.

Changes from v1->v2:

1. Dropped the case-insensitive support patch and added a dt-bindings
   update patch.
2. Added a export symbol patch.

Anup Patel (1):
RISC-V: Add riscv_isa reprensenting ISA features common across CPUs

Atish Patra (4):
RISC-V: Remove per cpu clocksource
RISC-V: Fix unsupported isa string info.
RISC-V: Export few kernel symbols
dt-bindings: Update the riscv,isa string description

.../devicetree/bindings/riscv/cpus.yaml       |  4 +-
arch/riscv/include/asm/hwcap.h                | 16 +++++++
arch/riscv/kernel/cpu.c                       | 47 +++++++++++++++----
arch/riscv/kernel/cpufeature.c                | 39 +++++++++++++--
arch/riscv/kernel/smp.c                       |  2 +-
arch/riscv/kernel/time.c                      |  1 +
drivers/clocksource/timer-riscv.c             |  6 +--
7 files changed, 96 insertions(+), 19 deletions(-)

--
2.21.0
