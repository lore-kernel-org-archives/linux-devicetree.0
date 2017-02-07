From: Jayachandran C <jnair@caviumnetworks.com>
Subject: [PATCH v3 0/5] Add Cavium ARCH_THUNDER2 platform
Date: Tue, 7 Feb 2017 21:19:54 +0000
Message-ID: <1486502399-2950-1-git-send-email-jnair@caviumnetworks.com>
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
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Here's another revision of the patchset, updated based on the last
discussion.

This patchset adds support for the new ThunderX2 CN99XX processor
family.

Changes are to add: the config option, the required device tree files,
the device tree bindings documentation and the defconfig entry.

Changes from v2 -> v3:
* drop thunder-99xx.dtsi which was a copy of vulcan.dtsi, include file
  instead
* Don't add cavium,thunder2 processor compat ID, not needed until vulcan.dtsi
  moves to dts/cavium/
* select ARCH_VULCAN when ARCH_THUNDER2 is selected (for now)
* dropped Ack from Rob H due to change in specific patch

Changes from v1 -> v2:
* split Kconfig.platforms changes and device tree changes
* Added MAINTAINERS entry

JC.

Jayachandran C (5):
  arm64: add THUNDER2 processor family
  MAINTAINERS: Add Cavium ThunderX2 entry
  arm64: dts: add device tree for ARCH_THUNDER2
  dt-bindings: arm64 ARCH_THUNDER2 platform documentation
  arm64: add ARCH_THUNDER2 to defconfig

 .../devicetree/bindings/arm/cavium-thunder2.txt    |  5 ++++
 MAINTAINERS                                        |  7 +++++
 arch/arm64/Kconfig.platforms                       |  8 +++++
 arch/arm64/boot/dts/cavium/Makefile                |  1 +
 arch/arm64/boot/dts/cavium/thunder-99xx.dts        | 34 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 6 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder2.txt
 create mode 100644 arch/arm64/boot/dts/cavium/thunder-99xx.dts

-- 
2.7.4
