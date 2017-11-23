From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH 5/5] ARM: imx_v6_v7_defconfig: Enable DA0963 PMIC support.
Date: Thu, 23 Nov 2017 13:55:55 +0100
Message-ID: <20171123125600.41562-6-jan.tuerk@emtrion.com>
References: <20171123125600.41562-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4300996765585511368=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171123125600.41562-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Jan Tuerk <jan.tuerk@emtrion.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, SZ Lin <sz.lin@moxa.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============4300996765585511368==
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

All recent emtrion modules based on i.mx6 make use of the DA0963.
Therefore enable it with the following defaults:
        - CONFIG_MFD_DA9063=3Dy
        - CONFIG_REGULATOR_DA9063=3Dy
        - CONFIG_DA9063_WATCHDOG=3Dm
        - CONFIG_RTC_DRV_DA9063=3Dm
MFD and REGULATOR are built-in to have it at Kernel boot-time.
The WATCHDOG and RTC are optional and could be loaded from userspace.

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6=
_v7_defconfig
index 0d4494922561..09cd8048b0c1 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -215,8 +215,10 @@ CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
 CONFIG_CPU_THERMAL=3Dy
 CONFIG_IMX_THERMAL=3Dy
 CONFIG_WATCHDOG=3Dy
+CONFIG_DA9063_WATCHDOG=3Dm
 CONFIG_IMX2_WDT=3Dy
 CONFIG_MFD_DA9052_I2C=3Dy
+CONFIG_MFD_DA9063=3Dy
 CONFIG_MFD_MC13XXX_SPI=3Dy
 CONFIG_MFD_MC13XXX_I2C=3Dy
 CONFIG_MFD_STMPE=3Dy
@@ -224,6 +226,7 @@ CONFIG_REGULATOR=3Dy
 CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
 CONFIG_REGULATOR_ANATOP=3Dy
 CONFIG_REGULATOR_DA9052=3Dy
+CONFIG_REGULATOR_DA9063=3Dy
 CONFIG_REGULATOR_GPIO=3Dy
 CONFIG_REGULATOR_MC13783=3Dy
 CONFIG_REGULATOR_MC13892=3Dy
@@ -349,6 +352,7 @@ CONFIG_RTC_DRV_PCF8563=3Dy
 CONFIG_RTC_DRV_M41T80=3Dy
 CONFIG_RTC_DRV_MC13XXX=3Dy
 CONFIG_RTC_DRV_MXC=3Dy
+CONFIG_RTC_DRV_DA9063=3Dm
 CONFIG_RTC_DRV_SNVS=3Dy
 CONFIG_DMADEVICES=3Dy
 CONFIG_FSL_EDMA=3Dy
--
2.11.0


emtrion GmbH
Kreativpark - Alter Schlachthof 45
76131 Karlsruhe
GERMANY
http://www.emtrion.de
_______________________________________

Amtsgericht Mannheim
HRB 110 300
Gesch=E4ftsf=FChrer: Dieter Baur, Ramona Maurer
_______________________________________


--===============4300996765585511368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4300996765585511368==--
