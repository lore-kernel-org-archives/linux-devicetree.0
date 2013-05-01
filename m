From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH v2] ARM CCI support
Date: Wed,  1 May 2013 17:18:27 +0100
Message-ID: <1367425108-4698-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Boyd <sboyd@codeaurora.org>, Javi Merino <javi.merino@arm.com>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Amit Kucheria <amit.kucheria@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

This patch is an updated of a previous posting:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-April/162539.html

Patch depends on commit:

id: 0c91e7e07ebf08092bf8e28d8cd8d420732fc716

"ARM: cacheflush: add synchronization helpers for mixed cache state accesses"

in RMK tree:

http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-arm.git

branch: devel-stable

main changes in v2:
 - Changed way masters are connected to CCI slave ports in DT
   # now every master has to declare a phandle to a CCI control IF
 - Fixed warning split on different lines
 - Added comments to disable function
 - Moved driver to non-hotpluggable API (registration and probing bundled
   together)
 - Upgraded cache flushing API
 - Reworked the driver to use devm primitives
 - Added disable/enable by index API
 - Fixed port enable and added macro for snoops/DVM control

ARM multi-cluster systems rely on the cache coherent interconnect (CCI) to
support inter-cluster cache coherency and distributed virtual memory (DVM)
messaging.

CCI kernel driver requires tweaks to the kernel and device tree
bindings in order to link specific resources to groups of logical CPUs
so that resources can be associated to specific cpu sets (slave ports can
be associated with a set of CPUs which are part of a cluster).

CCI slave ports must be associated with specific bus masters in the system so
that whenever a CCI operation is requested for a specific master (ie disable
its CCI slave port, read its PMU counters) the association can be carried out
dynamically in the OS through dynamically built data structures.
Bus masters in the system connected to CCI ports must define device tree
properties, as described in the documentation contained in the patch, in order
to explicitly connect ports and allow the OS to build up the required data
structures.

The current CCI DT bindings define the CCI address space as the same one
as the root device tree node, which means that the CCI bus can address the
entire address space visible to CPUs.

Lorenzo Pieralisi (1):
  drivers: bus: add ARM CCI support

 Documentation/devicetree/bindings/arm/cci.txt | 161 +++++++++++
 drivers/bus/Kconfig                           |   7 +
 drivers/bus/Makefile                          |   2 +
 drivers/bus/arm-cci.c                         | 372 ++++++++++++++++++++++++++
 include/linux/arm-cci.h                       |  59 ++++
 5 files changed, 601 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cci.txt
 create mode 100644 drivers/bus/arm-cci.c
 create mode 100644 include/linux/arm-cci.h

-- 
1.8.2.2
