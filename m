From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 0/3] Add power domain driver support for i.mx8m family
Date: Wed, 17 Apr 2019 05:27:24 +0000
Message-ID: <20190417053211.2195-1-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The i.MX8M family is a set of NXP product focus on delivering
the latest and greatest video and audio experience combining
state-of-the-art media-specific features with high-performance
processing while optimized for lowest power consumption.
i.MX8MQ, i.MX8MM, i.MX8MN, even the furture i.MX8MP are all
belong to this family.

The GPC module is used to manage the PU power domains' power
on/off. For the whole i.MX8M family, different SoC has differnt
power domain design. the power up sequence has significant difference.
all the power sequence must be guaranteed by SW. Some domains' power
up sequence need to access the SRC module or sub-system specific GPR.
the SRC register & SS's register are not in in the GPC's memory range.

it makes us hard to use the GPCv2 driver to cover all the different
power up requirement. Each time, a new SoC is added, we must modify
the GPCv2 driver to make it resuable for it. a lot of code need to
be added in GPCv2 to support it. we need to access the SRC & SS' GPR,
then the GPCv2 driver can NOT be self-contained. Accessing the non-driver
specific module's register is a bad practice. Although, the GPC module
provided the similar function for PU power domain, but it is not 100%
compatible with GPCv2.

The most important thing is that the GPC & SRC module is a security
critical resource that security permission must be considered when
building the security system. The GPC module is not only used by
PU power domain power on/off. It is also used by the TF-A PSCI code
to do the CPU core power management. the SRC module control the
CPU CORE reset and the CPU reset vector address. if we give the
non-secure world write permission to SRC. System can be easily
induced to malicious code.

This patchset add a more generic power domain driver that give
us the possibility to use one driver to cover the whole i.MX8M
family power domain in kernel side. kernel side doesn't need to
handle the power domain difference anymore, all the sequence can be
abstracted & handled in TF-A side. Most important, We don't need to
care if the GPC & SRC is security protected.

Jacky Bai (3):
  dt-bindings: power: Add power domain binding for i.mx8m family
  soc: imx: Add power domain driver support for i.mx8m family
  arm64: dts: freescale: Add power domain nodes for i.mx8mm

 .../bindings/power/fsl,imx8m-genpd.txt        |  46 ++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 103 ++++++++
 drivers/soc/imx/Kconfig                       |   6 +
 drivers/soc/imx/Makefile                      |   1 +
 drivers/soc/imx/imx8m_pm_domains.c            | 224 ++++++++++++++++++
 include/soc/imx/imx_sip.h                     |  12 +
 6 files changed, 392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
 create mode 100644 drivers/soc/imx/imx8m_pm_domains.c
 create mode 100644 include/soc/imx/imx_sip.h

-- 
2.21.0
