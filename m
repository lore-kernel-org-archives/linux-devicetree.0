From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCH 1/3] ARM: dts: rk3288 Tinker Board (S) sdcard changes
Date: Sun, 17 Feb 2019 12:15:11 +0000
Message-ID: <20190217121513.22965-2-beagleboard@davidjohnsummers.uk>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rockchip@lists.infradead.org, David Summers <beagleboard@davidjohnsummers.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch makes some minor changes to how the sd card is
described in the device tree for the ASUS Tinker Board (S). In
particular on the Tinker Board S, when booted from the eMMC, and with
no card in the sd slot, and the log has endless messages about not
being able to detect the card.

Several methods to remove this error have been tried, the only one
that works is the broken-cd and so that is what is applied here.

Alas the ASUS schematic is not clear enough to indicate if the card
detect is wired up to the cpu, the schematic does not show internal
wiring on the Tinker Board!

Now this error didn't show up on the Tinker Board, as that machine
only boots where there is a sd card installed. However as the TB and
TBS are so similar it is expected that the Tinker Board also doesn't
have a functioning card detect. Hence the change here is made to the
dtsi file, so it applies to both TB and TBS.

The disable-wp is also removed, it doesnt seem needed on the micro
sdcard slots, and without thisn the card can still be written
to. Hence this flag is also removed.

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 arch/arm/boot/dts/rk3288-tinker.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index 2b38075a2917..fceaeed44e34 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -432,9 +432,7 @@
 	bus-width = <4>;
 	cap-mmc-highspeed;
 	cap-sd-highspeed;
-	card-detect-delay = <200>;
-	disable-wp;			/* wp not hooked up */
+	broken-cd;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
 	status = "okay";
-- 
beagleboard@davidjohnsummers.uk
