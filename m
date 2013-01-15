From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH 0/6] arm: mvebu: Add support for USB host controllers in Armada
 370/XP
Date: Tue, 15 Jan 2013 06:59:57 -0300
Message-ID: <50F5289D.80903@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Arnd Bergmann <arnd@arndb.de>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Florian Fainelli <florian@openwrt.org>
List-Id: devicetree@vger.kernel.org

Hi,

This small patch set enables USB support on Armada 370 and Armada XP platfo=
rms.
It's based on Jason Cooper's mvebu/dt branch.

Any comments or feedback are welcome.

Ezequiel Garcia (6):
 arm: mvebu: Add support for USB host controllers in Armada 370/XP
 arm: mvebu: Enable USB controllers on Armada 370 evaluation board
 arm: mvebu: Enable USB controllers on Armada 370 Mirabox board
 arm: mvebu: Enable USB controllers on Armada XP evaluation board
 arm: mvebu: Enable USB controllers on Armada XP OpenBlocks AX3-4 board
 arm: mvebu: Update defconfig to select USB support

 arch/arm/boot/dts/armada-370-db.dts              |    8 ++++++++
 arch/arm/boot/dts/armada-370-mirabox.dts         |    8 ++++++++
 arch/arm/boot/dts/armada-370-xp.dtsi             |   15 +++++++++++++++
 arch/arm/boot/dts/armada-370.dtsi                |    9 +++++++++
 arch/arm/boot/dts/armada-xp-db.dts               |   12 ++++++++++++
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |    9 +++++++++
 arch/arm/boot/dts/armada-xp.dtsi                 |   17 +++++++++++++++++
 arch/arm/configs/mvebu_defconfig                 |    5 ++++-
 arch/arm/mach-mvebu/Kconfig                      |    1 +
 9 files changed, 83 insertions(+), 1 deletions(-)
 =

Thanks!

-- =

Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
