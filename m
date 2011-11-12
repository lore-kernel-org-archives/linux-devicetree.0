From: ddaney.cavm@gmail.com
Subject: [PATCH 0/2] irq/of: Enchance irq_domain support.
Date: Fri, 11 Nov 2011 17:50:14 -0800
Message-ID: <1321062616-28317-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, tglx@linutronix.
Cc: David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

This is the first cut at hooking up my Octeon port to the irq_domain things.

The Octeon specific patches are part of a larger set, and will need to
be applied with that set, the first patch is stand-alone.

The basic problem being solved taken from one of my other e-mails:

   Unfortunately, although a good idea, kernel/irq/irqdomain.c makes a
   bunch of assumptions that don't hold for Octeon.  We may be able to
   improve it so that it flexible enough to suit us.


   Here are the problems I see:

   1) It is assumed that there is some sort of linear correspondence
   between 'hwirq' and 'irq', and that the range of valid values is
   contiguous.

   2) It is assumed that the concepts of nr_irq, irq_base and
   hwirq_base have easy to determine values and you can do iteration
   over their ranges by adding indexes to the bases.


David Daney (2):
  irq/of/ARM: Enhance irq iteration capability of irq_domain code.
  MIPS: Octeon: Add irq_create_of_mapping() and GPIO interrupts.

 arch/arm/common/gic.c                |   32 +++--
 arch/mips/Kconfig                    |    1 +
 arch/mips/cavium-octeon/octeon-irq.c |  279 +++++++++++++++++++++++++++++++++-
 include/linux/irqdomain.h            |   29 +++-
 kernel/irq/irqdomain.c               |   97 +++++++++---
 5 files changed, 390 insertions(+), 48 deletions(-)

-- 
1.7.2.3
