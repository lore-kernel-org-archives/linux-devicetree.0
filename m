From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 7/7] ARM: dts: rockchip: Specify rk3288-veyron-minnie's display timings
Date: Thu, 28 Mar 2019 10:17:10 -0700
Message-ID: <20190328171710.31949-8-dianders@chromium.org>
References: <20190328171710.31949-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328171710.31949-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
Cc: linux-rockchip@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, =?UTF-8?q?Enric=20Balletb=C3=B2?= <enric.balletbo@collabora.com>, Rob Herring <robh+dt@kernel.org>, mka@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Just like rk3288-veyron-jerry, we want to be able to use one of the
fixed PLLs in the system to make the pixel clock for minnie.

Specifying these timings matches us with how the display is used on
the downstream Chrome OS kernel.  See https://crrev.com/c/323211.

Unlike jerry, this CL actually changes the timings (though not the
pixel clock) that is used when using the upstream kernel.  Booting up
a minnie shows that it ended up with a 66.67 MHz pixel clock but it
was still using the porches/blankings it would have wanted for a 72.5
MHz pixel clock.

NOTE: compared to the downstream kernel, this seems to cause a
slightly different result reported in the 'modetest' command on a
Chromebook.  The downstream kernel shows:
  1280x800 60 1280 1298 1330 1351 800 804 822 830 66667

With this patch we have:
  1280x800 59 1280 1298 1330 1351 800 804 822 830 66666

Specifically modetest was reporting 60 Hz on the downstream kernel but
the upstream kernel does the math and comesup with 59 (because we
actually achieve 59.45 Hz).  Also upstream doesn't round the Hz up
when converting to kHz--it seems to truncate.

ALSO NOTE: when I look at the EDID from the datasheet, I see:
  -hsync -vsync
...but it seems like we've never actually run with that so I've
continued leaving that out.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- rk3288-veyron-minnie patch new for v4.

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index ca7512ade222..8179cf9f6e98 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -144,6 +144,18 @@
 	power-supply= <&panel_regulator>;
 
 	/delete-node/ panel-timing;
+
+	panel-timing {
+		clock-frequency = <66666667>;
+		hactive = <1280>;
+		hfront-porch = <18>;
+		hback-porch = <21>;
+		hsync-len = <32>;
+		vactive = <800>;
+		vfront-porch = <4>;
+		vback-porch = <8>;
+		vsync-len = <18>;
+	};
 };
 
 &rk808 {
-- 
2.21.0.392.gf8f6787159e-goog
