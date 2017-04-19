From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH v3 4/5] ARM: dts: rockchip: enable ARM Mali GPU on
 rk3288-firefly
Date: Wed, 19 Apr 2017 09:06:20 +0100
Message-ID: <db2cd08e603735413175f32dc037abe78216cc6b.1492588180.git.guillaume.tucker@collabora.com>
References: <cover.1492588180.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1492588180.git.guillaume.tucker@collabora.com>
In-Reply-To: <cover.1492588180.git.guillaume.tucker@collabora.com>
References: <cover.1492588180.git.guillaume.tucker@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, Guillaume Tucker <guillaume.tucker@collabora.com>, Sjoerd Simons <sjoerd.simons@collabora.com>, Wookey <wookey@wookware.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, John Reitan <john.reitan@arm.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add reference to the Mali GPU device tree node on rk3288-firefly.
Tested on Firefly board.

Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 arch/arm/boot/dts/rk3288-firefly.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi b/arch/arm/boot/dts/rk3288-firefly.dtsi
index 10793ac18599..f520589493b4 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
@@ -594,3 +594,8 @@
 &wdt {
 	status = "okay";
 };
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
-- 
2.11.0
