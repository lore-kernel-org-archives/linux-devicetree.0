From: Palmer Dabbelt <palmer@sifive.com>
Subject: Driver for the RISC-V Interrupt Controller
Date: Fri, 22 Jun 2018 16:20:03 -0700
Message-ID: <20180622232006.12158-1-palmer@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Palmer Dabbelt <palmer@sifive.com>, aou@eecs.berkeley.edu, shorne@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The RISC-V ISA mandantes the presence of a simple, per-hart (hardware
thread) interrupt controller availiable to supervisor mode.  This patch
set adds a driver for this interrupt controller.

The patch set itself has been around in various flavors for a while, but
as far as I remember it's never been properly cleaned up and submitted
before.  As it currently stands it's essentially three seperate patches,
but as they're all intertwined I'm keeping them together.  Sorry if
that's the wrong thing to do.

The patches are:

* A cleanup to arch/riscv to remove a bit of the old initialization
  mechanism that snuck in to our arch port.  This patch is trivial, so
  unless there's any feedback on it specificly I'll include it in my
  next pull request.
* The addition of device tree bindings to describe "riscv,cpu-intc".
* The actual irqchip driver.  If this gets merged before the arch/riscv
  patch then it'll cause our build to fail, but I'm assuming this will
  be targeted at the next merge window so we should be safe.
