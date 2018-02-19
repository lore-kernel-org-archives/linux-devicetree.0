From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/2] arm64: dts: rockchip: move rk3399-sapphire sdio to
 excavator baseboard
Date: Mon, 19 Feb 2018 09:15:16 +0100
Message-ID: <3840224.sEPfbROKII@phil>
References: <CAAMcf8CY1m+998+GpD2wOfAZb=oZNkL2GqYu_o5piGEh76uoYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAAMcf8CY1m+998+GpD2wOfAZb=oZNkL2GqYu_o5piGEh76uoYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Vicente Bergas <vicencb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The sdio signals are routed through the connector to the baseboard,
where the wifi module is also located. So move the sdio node to
the excavator as well.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
Hi Vicente,

after looking at the issue, I guess something like this and the following
patch should help your situation?
I've heared about the sapphire being used standalone some times and
thus think it can be justified to add that standalone version.


Heiko

 .../boot/dts/rockchip/rk3399-sapphire-excavator.dts      | 16 ++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi        | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index b7bd88fb3ae3..68416fae4fea 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -232,6 +232,22 @@
 	};
 };
 
+&sdio0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	clock-frequency = <50000000>;
+	disable-wp;
+	keep-power-in-suspend;
+	max-frequency = <50000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &spdif {
 	i2c-scl-rising-time-ns = <450>;
 	i2c-scl-falling-time-ns = <15>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
index 46c95ccfd5cb..31568b4e8aa1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
@@ -520,22 +520,6 @@
 	status = "okay";
 };
 
-&sdio0 {
-	bus-width = <4>;
-	cap-sd-highspeed;
-	cap-sdio-irq;
-	clock-frequency = <50000000>;
-	disable-wp;
-	keep-power-in-suspend;
-	max-frequency = <50000000>;
-	mmc-pwrseq = <&sdio_pwrseq>;
-	non-removable;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
-	sd-uhs-sdr104;
-	status = "okay";
-};
-
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.15.1
