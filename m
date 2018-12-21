From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] ARM: dts: imx: replace gpio-key,
 wakeup with wakeup-source property
Date: Fri, 21 Dec 2018 18:12:03 +0000
Message-ID: <20181221181203.6764-1-sudeep.holla@arm.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Most of the legacy "gpio-key,wakeup" and "enable-sdio-wakeup" boolean
properties are already replaced with "wakeup-source". However few
occurrences of old property has popped up again, probably from the
remnants in downstream trees. Almost all of those were remove couple
of years back.

Replace the legacy properties with the unified "wakeup-source" property
introduced in the commit 700a38b27eef ("Input: gpio_keys - switch to using
generic device properties") and commit 0dbcdc0622ea ("mmc: core: enable
support for the standard "wakeup-source" property")

Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/imx6q-pistachio.dts | 2 +-
 arch/arm/boot/dts/imx6sll-evk.dts     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Hi Fabio,

Olof requested to slipt the patch and send it via platform maintainers.
I totally forgot to follow up on this. You had acked this previously but
please pick this up and submit via your tree to ARM SoC. Sorry for the
confusion.

Regards,
Sudeep

diff --git a/arch/arm/boot/dts/imx6q-pistachio.dts b/arch/arm/boot/dts/imx6q-pistachio.dts
index a31e83cd07a3..8f4b60dd819c 100644
--- a/arch/arm/boot/dts/imx6q-pistachio.dts
+++ b/arch/arm/boot/dts/imx6q-pistachio.dts
@@ -102,7 +102,7 @@
 		power {
 			label = "Power Button";
 			gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
-			gpio-key,wakeup;
+			wakeup-source;
 			linux,code = <KEY_POWER>;
 		};
 	};
diff --git a/arch/arm/boot/dts/imx6sll-evk.dts b/arch/arm/boot/dts/imx6sll-evk.dts
index c8e115564ba2..30b5d63ed319 100644
--- a/arch/arm/boot/dts/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/imx6sll-evk.dts
@@ -296,7 +296,7 @@
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
 	cd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	keep-power-in-suspend;
-	enable-sdio-wakeup;
+	wakeup-source;
 	vmmc-supply = <&reg_sd3_vmmc>;
 	status = "okay";
 };
--
2.17.1
