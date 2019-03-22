From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: Add rk3288-veyron-jerry rev 10-15
Date: Fri, 22 Mar 2019 12:59:24 -0700
Message-ID: <20190322195924.70448-2-dianders@chromium.org>
References: <20190322195924.70448-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190322195924.70448-1-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, ryandcase-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

As far as I can tell/remember rev10 was originally created to support
making a SKU of jerry that had a different LCD.  rev11-rev15 were
added to give some wiggle room for future builds.  Downstream has a
separate device tree for rev10-rev15 (compared to rev3-rev7) with the
expectation that differences relating to the LCD would be accounted
for there but nothing was ever added to the rev10-rev15 making it
identical to the rev3-rev7 one.

It's likely nothing actually shipped with rev10-rev15 but they are
listed in the downstream kernel's device tree and it seems like it
should add a little safety if we match them here just in case
something actually shipped with one of these revisions and that device
will break if we don't claim support.

Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 arch/arm/boot/dts/rk3288-veyron-jerry.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
index 2ba89895c33a..517c6999a978 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
@@ -11,7 +11,10 @@
 
 / {
 	model = "Google Jerry";
-	compatible = "google,veyron-jerry-rev7", "google,veyron-jerry-rev6",
+	compatible = "google,veyron-jerry-rev15", "google,veyron-jerry-rev14",
+		     "google,veyron-jerry-rev13", "google,veyron-jerry-rev12",
+		     "google,veyron-jerry-rev11", "google,veyron-jerry-rev10",
+		     "google,veyron-jerry-rev7", "google,veyron-jerry-rev6",
 		     "google,veyron-jerry-rev5", "google,veyron-jerry-rev4",
 		     "google,veyron-jerry-rev3", "google,veyron-jerry",
 		     "google,veyron", "rockchip,rk3288";
-- 
2.21.0.392.gf8f6787159e-goog
