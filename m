From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v4 0/5]  LPAE remaining device tree file
Date: Fri, 12 Apr 2013 16:29:05 +0200
Message-ID: <1365776950-30094-1-git-send-email-gregory.clement@free-electrons.com>
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

Hi Jason,

I have just rebased the commits that you haven't applied yet. They are
rebased on mvebu/dt. I check that all the dtb can be built.

Thanks,

Gregory CLEMENT (3):
  ARM: dts: mvebu: Convert all the mvebu files to use the range
    property
  ARM: dts: mvebu: introduce internal-regs node
  ARM: dts: mvebu: Convert mvebu device tree files to 64 bits

Thomas Petazzoni (2):
  ARM: dts: mvebu: fix cpus section indentation
  ARM: dts: mvebu: move all peripherals inside soc

 arch/arm/boot/dts/armada-370-db.dts              |  134 +++---
 arch/arm/boot/dts/armada-370-mirabox.dts         |  176 ++++----
 arch/arm/boot/dts/armada-370-rd.dts              |   96 ++---
 arch/arm/boot/dts/armada-370-xp.dtsi             |  336 +++++++--------
 arch/arm/boot/dts/armada-370.dtsi                |  330 +++++++--------
 arch/arm/boot/dts/armada-xp-db.dts               |  202 ++++-----
 arch/arm/boot/dts/armada-xp-gp.dts               |  222 +++++-----
 arch/arm/boot/dts/armada-xp-mv78230.dtsi         |  284 ++++++-------
 arch/arm/boot/dts/armada-xp-mv78260.dtsi         |  342 +++++++--------
 arch/arm/boot/dts/armada-xp-mv78460.dtsi         |  484 +++++++++++-----------
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |  262 ++++++------
 arch/arm/boot/dts/armada-xp.dtsi                 |  202 ++++-----
 12 files changed, 1549 insertions(+), 1521 deletions(-)

-- 
1.7.9.5
