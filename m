From: Jayachandran C <jnair@caviumnetworks.com>
Subject: [PATCH RESEND 0/3] arm64: Add ARCH_THUNDER2
Date: Sat, 4 Feb 2017 18:37:38 +0000
Message-ID: <1486233461-2679-1-git-send-email-jnair@caviumnetworks.com>
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
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>
List-Id: devicetree@vger.kernel.org

I had send this out few weeks back (before -rc5), hoping that it
would be picked up for 4.11 thru arm-soc. Posting again with the Ack,
in case it fell thru the cracks.

This patchset adds support for the new ThunderX2 CN99XX processor
family.

Changes are to add the config option, the required device tree files,
the device tree bindings documentation and the defconfig entry.

JC.

Jayachandran C (3):
  arm64: add THUNDER2 processor family
  dt-bindings: arm64 ARCH_THUNDER2 platform documentation
  arm64: add ARCH_THUNDER2 to defconfig

 .../devicetree/bindings/arm/cavium-thunder2.txt    |   5 +
 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 arch/arm64/Kconfig.platforms                       |   7 +
 arch/arm64/boot/dts/cavium/Makefile                |   1 +
 arch/arm64/boot/dts/cavium/thunder-99xx.dts        |  34 +++++
 arch/arm64/boot/dts/cavium/thunder-99xx.dtsi       | 147 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder2.txt
 create mode 100644 arch/arm64/boot/dts/cavium/thunder-99xx.dts
 create mode 100644 arch/arm64/boot/dts/cavium/thunder-99xx.dtsi

-- 
2.7.4
