From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 08/14] ARM: dts: at91: sama5d27_som1_ek: remove pull-up on
 SD/MMC lines
Date: Tue, 10 Oct 2017 13:09:43 +0300
Message-ID: <1507630189-15504-9-git-send-email-claudiu.beznea@microchip.com>
References: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>

As the board have the proper pull-ups soldered on the data
and CMD lines we don't need them specified in the PADs. So remove
the "bias-pull-up" property and set "bias-disable".

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
[claudiu.beznea@microchip.com: change subject to match the desired prefix]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
index 651ed5d4defc..e72036fa8ddb 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
@@ -349,7 +349,7 @@
 							 <PIN_PA7__SDMMC0_DAT5>,
 							 <PIN_PA8__SDMMC0_DAT6>,
 							 <PIN_PA9__SDMMC0_DAT7>;
-						bias-pull-up;
+						bias-disable;
 					};
 
 					ck_cd_vddsel {
@@ -367,7 +367,7 @@
 							 <PIN_PA19__SDMMC1_DAT1>,
 							 <PIN_PA20__SDMMC1_DAT2>,
 							 <PIN_PA21__SDMMC1_DAT3>;
-						bias-pull-up;
+						bias-disable;
 					};
 
 					conf-ck_cd {
-- 
2.7.4
