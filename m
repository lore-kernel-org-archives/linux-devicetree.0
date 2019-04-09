From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH v2 3/3] ARM: multi_v7_defconfig: Enable support for STPMIC1
Date: Tue, 9 Apr 2019 09:07:04 +0000
Message-ID: <1554800820-5412-4-git-send-email-p.paillet@st.com>
References: <1554800820-5412-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554800820-5412-1-git-send-email-p.paillet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.i>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

STPMIC1 is a PMIC from STMicroelectronics. The STPMIC1 integrates 10
regulators, 3 power switches, a watchdog and an input for a power on key.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v=
7_defconfig
index c75051b..2e9fa53 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -299,6 +299,7 @@ CONFIG_INPUT_MAX8997_HAPTIC=3Dm
 CONFIG_INPUT_CPCAP_PWRBUTTON=3Dm
 CONFIG_INPUT_AXP20X_PEK=3Dm
 CONFIG_INPUT_ADXL34X=3Dm
+CONFIG_INPUT_STPMIC1_ONKEY=3Dy
 CONFIG_SERIO_AMBAKMI=3Dy
 CONFIG_SERIAL_8250=3Dy
 CONFIG_SERIAL_8250_CONSOLE=3Dy
@@ -486,6 +487,7 @@ CONFIG_TEGRA_WATCHDOG=3Dm
 CONFIG_MESON_WATCHDOG=3Dy
 CONFIG_DIGICOLOR_WATCHDOG=3Dy
 CONFIG_RENESAS_WDT=3Dm
+CONFIG_STPMIC1_WATCHDOG=3Dy
 CONFIG_BCM47XX_WDT=3Dy
 CONFIG_BCM2835_WDT=3Dy
 CONFIG_BCM_KONA_WDT=3Dy
@@ -527,6 +529,7 @@ CONFIG_MFD_TPS65218=3Dy
 CONFIG_MFD_TPS6586X=3Dy
 CONFIG_MFD_TPS65910=3Dy
 CONFIG_MFD_STM32_LPTIMER=3Dm
+CONFIG_MFD_STPMIC1=3Dy
 CONFIG_REGULATOR_ACT8865=3Dy
 CONFIG_REGULATOR_ACT8945A=3Dy
 CONFIG_REGULATOR_ANATOP=3Dy
@@ -559,6 +562,7 @@ CONFIG_REGULATOR_RN5T618=3Dy
 CONFIG_REGULATOR_S2MPS11=3Dy
 CONFIG_REGULATOR_S5M8767=3Dy
 CONFIG_REGULATOR_STM32_VREFBUF=3Dm
+CONFIG_REGULATOR_STPMIC1=3Dy
 CONFIG_REGULATOR_TI_ABB=3Dy
 CONFIG_REGULATOR_TPS51632=3Dy
 CONFIG_REGULATOR_TPS62360=3Dy
--=20
1.9.1
