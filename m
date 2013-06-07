From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 00/14] MBus device tree binding
Date: Fri,  7 Jun 2013 13:47:37 -0300
Message-ID: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ezequiel Garcia <ezequiel-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ezequiel Garcia <ezequiel-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

This patchset introduces the MBus DT binding.

The MBus DT binding is in charge of several different tasks:

  1. Allows the MBus driver to be probed through the Device Tree.

  2. Allocates statically declared decoding windows, such as those
     needed to access the BootROM or for the Device Bus children.

  3. Add 'ranges' translation entries as needed, to avoid duplicating
     the whole 'ranges' property in each per-board DTS file.

For the window static allocation, the current driver does that by walking
through its children and for each first-level child it creates decoding
windows from the translation entries.

For this to work, we need to encode the window's target ID and attribute ID
somewhere. The current design encodes it in an ad-hoc cell in the ranges
entry. See the binding documentation for a complete rationale.

This proposal has been written in its entirety following directions made by
Arnd Bergmann and Jason Gunthorpe when the MBus driver was introduced.
However, I'm open to any feedback and/or suggestions and ready to re-write
the whole thing, if it's a too-wacky solution.

Based on v3.10-rc4, with Jason Cooper's mvebu/regmap branch applied,
and with the mvebu-devbus commit (3edad321b1 in linux-next):
"drivers: memory: Introduce Marvell EBU Device Bus driver"

Ezequiel Garcia (14):
  bus: mvebu-mbus: Use pr_fmt
  bus: mvebu-mbus: Factor out initialization details
  bus: mvebu-mbus: Introduce device tree binding
  bus: mvebu-mbus: Add static window allocation to the DT binding
  bus: mvebu-mbus: Update the mbus-compatible node's ranges property
  ARM: mvebu: Initialize MBus using the DT binding
  ARM: mvebu: Remove the harcoded BootROM window allocation
  memory: mvebu-devbus: Remove address decoding window workaround
  ARM: mvebu: Add MBus to Armada 370/XP device tree
  ARM: mvebu: Add BootROM to Armada 370/XP device tree
  ARM: mvebu: Relocate Armada 370/XP DeviceBus device tree nodes
  ARM: mvebu: Remove device tree unused properties on A370
  ARM: mvebu: Relocate Armada 370 PCIe device tree nodes
  ARM: mvebu: Relocate Armada XP PCIe device tree nodes

 .../devicetree/bindings/bus/mvebu-mbus.txt         | 151 +++++++++
 arch/arm/boot/dts/armada-370-mirabox.dts           |  32 +-
 arch/arm/boot/dts/armada-370-xp.dtsi               |  96 +++---
 arch/arm/boot/dts/armada-370.dtsi                  | 113 +++---
 arch/arm/boot/dts/armada-xp-db.dts                 |  66 ++--
 arch/arm/boot/dts/armada-xp-gp.dts                 | 101 +++---
 arch/arm/boot/dts/armada-xp-mv78230.dtsi           | 209 ++++++------
 arch/arm/boot/dts/armada-xp-mv78260.dtsi           | 245 ++++++-------
 arch/arm/boot/dts/armada-xp-mv78460.dtsi           | 377 +++++++++++----------
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts   |  77 ++---
 arch/arm/boot/dts/armada-xp.dtsi                   |  10 +
 arch/arm/mach-mvebu/armada-370-xp.c                |  34 +-
 arch/arm/mach-mvebu/platsmp.c                      |   1 -
 drivers/bus/mvebu-mbus.c                           | 332 ++++++++++++++++--
 drivers/memory/mvebu-devbus.c                      |  64 +---
 include/linux/mbus.h                               |   1 +
 16 files changed, 1129 insertions(+), 780 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/mvebu-mbus.txt

-- 
1.8.1.5
