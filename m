From: Gerald BAEZA <gerald.baeza@st.com>
Subject: [PATCH 4/5] ARM: configs: enable STM32_DDR_PMU
Date: Mon, 29 Apr 2019 10:03:38 +0000
Message-ID: <1556532194-27904-5-git-send-email-gerald.baeza@st.com>
References: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "arnd@arndb.de" <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gerald BAEZA <gerald.baeza@st.com>
List-Id: devicetree@vger.kernel.org

STM32_DDR_PMU enables the perf driver that
controls the DDR Performance Monitor (DDRPERFM)

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v=
7_defconfig
index c75051b..6bc6ffd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -979,6 +979,7 @@ CONFIG_PHY_UNIPHIER_USB2=3Dy
 CONFIG_OMAP_USB2=3Dy
 CONFIG_TI_PIPE3=3Dy
 CONFIG_TWL4030_USB=3Dm
+CONFIG_STM32_DDR_PMU=3Dm
 CONFIG_NVMEM_IMX_OCOTP=3Dy
 CONFIG_NVMEM_SUNXI_SID=3Dy
 CONFIG_NVMEM_VF610_OCOTP=3Dy
--=20
2.7.4
