From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH 0/4] arm-cci400: PMU monitoring support on ARM64
Date: Tue, 24 Feb 2015 13:17:39 +0000
Message-ID: <1424783863-9894-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

This series enables the PMU monitoring support for CCI400 on ARM64.
The existing CCI400 driver code is a mix of PMU driver and the MCPM
driver code. The MCPM driver is only used on ARM(32) and contains
arm32 assembly and hence can't be built on ARM64. This patch splits
the code to

 - ARM_CCI400_MCPM driver - depends on ARM && V7
 - ARM_CCI400_PMU driver

Accessing the Peripheral ID2 register(PID2) on CCI-400, to detect
the revision of the chipset, is a secure operation. Hence, it prevents
us from running this on non-secure platforms. The issue is overcome by
explicitly mentioning the revision number of the CCI PMU in the device tree
binding. The device-tree binding has been updated with the new bindings.

i.e,=09arm-cci-400-pmu,r0 =3D> revision 0
=09arm-cci-400-pmu,r1 =3D> revision 1
=09arm-cci-400-pmu =3D> (old) DEPRECATED

The old binding has been DEPRECATED and must be used only on ARM32
system with secure access. We don't have a reliable dynamic way to detect
if the system is running secure. This series tries to use the best safe
method by relying on the availability of MCPM(as it was prior to the series=
).
It is upto the MCPM platform driver to decide, if the system is secure befo=
re
it goes ahead and registers its drivers and pokes the CCI. This series does=
n't
address/solve the problem of MCPM. I will be happy to use a better approach=
,
if there is any.

Tested on (non-secure)TC2 and Juno.

Suzuki K. Poulose (4):
  arm-cci: Rearrange code for splitting PMU vs driver code
  arm-cci: Get rid of secure transactions for PMU driver
  arm-cci: Split the code for PMU vs driver support
  arm-cci: Fix CCI PMU event validation

 Documentation/devicetree/bindings/arm/cci.txt |    7 +-
 arch/arm/include/asm/arm-cci.h                |   42 +++
 arch/arm/mach-exynos/Kconfig                  |    2 +-
 arch/arm/mach-vexpress/Kconfig                |    4 +-
 arch/arm64/include/asm/arm-cci.h              |   27 ++
 drivers/bus/Kconfig                           |   28 +-
 drivers/bus/arm-cci.c                         |  483 ++++++++++++++-------=
----
 include/linux/arm-cci.h                       |    9 +-
 8 files changed, 383 insertions(+), 219 deletions(-)
 create mode 100644 arch/arm/include/asm/arm-cci.h
 create mode 100644 arch/arm64/include/asm/arm-cci.h

--=20
1.7.9.5
