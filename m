From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v3 0/9] ARM: mvebu: Enable LPAE support for Armada XP SoCs
Date: Tue,  9 Apr 2013 00:52:08 +0200
Message-ID: <1365461538-30702-1-git-send-email-gregory.clement@free-electrons.com>
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
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

Hello,

The Armada XP SoCs have LPAE support. This is the third patch set
which allows to run kernel on this SoCs with LPAE support.

The biggest changes are the conversion of the device tree file to 64
bits in order to be able to use more than 4GB of memory (without this
the LPAE is pointless).

They are two kinds of change:
- most of the change are on the commit log, according to Arnd
comments.

- the other change was made on the patch "ARM: dts: mvebu: Convert
  mvebu device tree files to 64 bits". I managed to not have to use
  the 64 bits format for the Armada 370 device tree files.

This patch set won't be the last one, as to ease the merge work of
Jason, I will rebase this series onto his dts branch once he will have
pull the pending commits. Beside this rebase nothing will be changed,
that why I would like to start to get the acked-by from Rob Herring
and Arnd Bergmann for this series(both of them made comments so they
must have an opinion on this last version). I am also submitting the
patch "ARM: mvebu: Enable pj4b on LPAE compilations" to Russell King's
patch system as I didn't receive any complaint about it, and it is a
pretty trivial patch.

This new patch set have been tested on a Armada XP GP board with 8GB
of DRAM with LPAE selected. It have been tested on Armada XP DB board
with 3GB of DRAM with and without LPAE. And also on the Armada 370 DB
board (without LPAE) to check that no regression appeared.

This patch set is based on 3.9-rc6 and is still 3.10 material. The git
branch called lpae-v3 is available at:

https://github.com/MISL-EBU-System-SW/mainline-public.git.

Thanks,

Changelog:
v2 -> v3:

* Pass all the arm architecture word in uppercase in the commit titles.

* Add a commit message to "ARM: dts: mvebu: move all peripherals
  inside soc" and move it at first patch of the series.

* Add a commit message to " ARM: dts: mvebu: move all peripherals
  inside soc"

* Add a commit message to "ARM: dts: mvebu: introduce internal-regs
   node"

* Add more explanation to "ARM: mvebu: Align the internal registers
  virtual base to support LPAE"

* In patch "ARM: dts: mvebu: Convert all the mvebu files to use the
  range property" thanks to the use of the overload capability of the
  device tree format, armada-370 now includes the 32 bit skeleton and
  all the armada 370 based dts can remain the same.

v1 -> v2:

* The patch to convert the mvebu device tree files to 64 bits was
  split in 3 parts:

    - "arm: dts: move all peripherals inside soc" from Thomas

	- then "arm: dts: Convert all the mvebu files to use the range
    property" which will allow to keep 32 bits addresses for the
    internal registers whereas the memory of the system will be 64
    bits

	- and finally "arm: dts: Convert mvebu device tree files to 64
      bits" which was the move to 64 bits itself.

* A new patch was added "arm: dts: introduce internal-regs node" based
  on the work of Thomas for the mvebu-mbus driver. It introduce a
  'internal-regs' subnode, under which all devices are moved. This is
  not really needed for now, but will be for the mvebu-mbus
  driver. This generates a lot of code movement since it's indenting
  by one more tab all the devices. So it was a good opportunity to fix
  all the bad indentation.

* New patch from Thomas "fix cpus section indentation" to finalize the
  fixing of the bad indentation

* For DMA transfer, DMA_ZONE was selected instead of DMABOUNCE: all
  the DMA transfer are restricted to the low 32 bits address space.

Gregory CLEMENT (4):
  ARM: mvebu: Limit the DMA zone when LPAE is selected
  ARM: dts: mvebu: Convert all the mvebu files to use the range
    property
  ARM: dts: mvebu: introduce internal-regs node
  ARM: dts: mvebu: Convert mvebu device tree files to 64 bits

Lior Amsalem (3):
  ARM: mvebu: Align the internal registers virtual base to support LPAE
  ARM: mvebu: Enable pj4b on LPAE compilations
  ARM: dts: Add a 64 bits version of the skeleton device tree

Thomas Petazzoni (2):
  ARM: dts: mvebu: fix cpus section indentation
  ARM: dts: mvebu: move all peripherals inside soc

 arch/arm/boot/dts/armada-370-db.dts              |  108 ++++-----
 arch/arm/boot/dts/armada-370-mirabox.dts         |   78 +++----
 arch/arm/boot/dts/armada-370-rd.dts              |   16 +-
 arch/arm/boot/dts/armada-370-xp.dtsi             |  253 +++++++++++-----------
 arch/arm/boot/dts/armada-370.dtsi                |  223 +++++++++----------
 arch/arm/boot/dts/armada-xp-db.dts               |  156 ++++++-------
 arch/arm/boot/dts/armada-xp-gp.dts               |  138 ++++++------
 arch/arm/boot/dts/armada-xp-mv78230.dtsi         |   84 +++----
 arch/arm/boot/dts/armada-xp-mv78260.dtsi         |  110 +++++-----
 arch/arm/boot/dts/armada-xp-mv78460.dtsi         |  136 ++++++------
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |  198 ++++++++---------
 arch/arm/boot/dts/armada-xp.dtsi                 |  191 ++++++++--------
 arch/arm/boot/dts/skeleton64.dtsi                |   13 ++
 arch/arm/include/debug/mvebu.S                   |    2 +-
 arch/arm/mach-mvebu/Kconfig                      |    1 +
 arch/arm/mach-mvebu/armada-370-xp.h              |    2 +-
 arch/arm/mm/proc-v7.S                            |    3 +-
 17 files changed, 877 insertions(+), 835 deletions(-)
 create mode 100644 arch/arm/boot/dts/skeleton64.dtsi

-- 
1.7.9.5
