From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] arm64: dts: juno: drop unnecessary address-cells and
 size-cells properties
Date: Mon,  9 Apr 2018 16:09:20 +0100
Message-ID: <1523286560-30889-1-git-send-email-sudeep.holla@arm.com>
References: <1523270385-30461-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1523270385-30461-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

/smb@8000000/motherboard/gpio_keys node doesn't have "ranges" or "reg"
property in child nodes. So it's unnecessary to have address-cells
as well as size-cells properties which results in below warning.

Warning (avoid_unnecessary_addr_size):
/smb@8000000/motherboard/gpio_keys:
	unnecessary #address-cells/#size-cells without "ranges" or child "reg"
	property

This patch drops the unnecessary address+size-cell properties.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 2 --
 1 file changed, 2 deletions(-)

(Missed cc-ed people earlier)

diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index 2ac43221ddb6..69804c5f1197 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -56,8 +56,6 @@

 			gpio_keys {
 				compatible = "gpio-keys";
-				#address-cells = <1>;
-				#size-cells = <0>;

 				power-button {
 					debounce_interval = <50>;
--
2.7.4
