From: Christoph Hellwig <hch@lst.de>
Subject: RISC-V irqchip drivers
Date: Wed, 25 Jul 2018 11:36:43 +0200
Message-ID: <20180725093649.32332-1-hch@lst.de>
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
To: tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: shorne@gmail.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The RISC-V ISA mandantes the presence of a simple, per-hart (hardware
thread) interrupt controller availiable to supervisor mode.  In addition
the RISC-V specification contains the definition of a programmable
interrupt controller that is present on all current RISC-V cores (at
least as far as a I know).

This series adds both of them.  For the per-hart controller this series
tries to address all comments vs the last posting from Palmr in June,
and for the PLIC it has a lot of cleanups which I think should address
all outstanding comments, but it has been a while since it was last
posted.

Without these irqchip drivers the RISC-V port in mainline is rather
useless as it can't boot on any SOC or emulator.  With it it still is
almost as useless as a clocksource driver is still missing, but at least
we're only a patch or two away from a booting system, and the
clocksource  driver will need the per-hart interrupt driver to work as
well.

Palmer: I assume you are ok with me pushing this forward.  If not I'll
happily drop this series.

A git tree with the patches in this series, the missing clocksource
driver a few pending patches to allow booting a RISC-V kernel in qemu
is available here:

    git://git.infradead.org/users/hch/riscv.git riscv-linux-4.18

Gitweb:

    http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-linux-4.18
