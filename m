From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/10] metag: various patches for v3.11
Date: Thu, 13 Jun 2013 13:19:31 +0100
Message-ID: <1371125981-5184-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset consists of various miscellaneous arch/metag patches I
intend to apply for v3.11.

The first two improve clock setup, allowing the core clock frequency to
optionally be determined from device tree clock nodes, and to print out
the core and timer clock frequencies during boot. These are followed by
various fixes from Markos (mostly sparse related).

James Hogan (2):
  metag: init common clk and use "core" clk
  metag: log core and timer frequencies from arch code

Markos Chandras (8):
  metag/kernel/irq.c: Declare root_domain as static
  metag/asm/irq.h: Declare init_IRQ
  metag/mm/cache: Restrict scope for metag_lnkget_probe
  metag/setup: Restrict scope for the capabilities variable
  metag/processor.h: Add missing cpuinfo_op declaration.
  metag/traps: Mark die() as __noreturn to match the declaration.
  metag/traps: include setup.h for the per_cpu_trap_init declaration
  metag/.gitignore: Extend the *.dtb pattern to match the dtb.S files

 Documentation/devicetree/bindings/metag/meta.txt | 30 ++++++++++++
 arch/metag/boot/.gitignore                       |  2 +-
 arch/metag/include/asm/bug.h                     |  4 +-
 arch/metag/include/asm/clock.h                   |  8 ++++
 arch/metag/include/asm/irq.h                     |  1 +
 arch/metag/include/asm/processor.h               |  2 +
 arch/metag/kernel/clock.c                        | 59 +++++++++++++++++++++++-
 arch/metag/kernel/irq.c                          |  2 +-
 arch/metag/kernel/setup.c                        | 12 ++---
 arch/metag/kernel/time.c                         | 14 +++++-
 arch/metag/kernel/traps.c                        |  5 +-
 arch/metag/mm/cache.c                            |  2 +-
 drivers/clocksource/metag_generic.c              |  2 +
 13 files changed, 127 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/metag/meta.txt

Cc: Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

-- 
1.8.1.2
