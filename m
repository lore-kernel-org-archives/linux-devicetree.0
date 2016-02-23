From: "jianqun.xu" <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/4] soc: rockchip: add bindings for Rockchip grf
Date: Tue, 23 Feb 2016 15:01:01 +0800
Message-ID: <1456210864-29037-2-git-send-email-jay.xu@rock-chips.com>
References: <1456210864-29037-1-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1456210864-29037-1-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Add devicetree bindings for Rockchip grf which found on
Rockchip SoCs.

Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
changes in v2:
- add grf.txt (Heiko)

 .../devicetree/bindings/soc/rockchip/grf.txt       | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
new file mode 100644
index 0000000..7fb0410
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
@@ -0,0 +1,35 @@
+* Rockchip General Register Files (GRF)
+
+The general register file will be used to do static set by software, which
+is composed of many registers for system control.
+
+From RK3368 SoCs, the GRF is divided into two sections,
+- GRF, used for general non-secure system,
+- PMUGRF, used for always on sysyem
+
+Required Properties:
+
+- compatible: GRF should be one of the followings
+   - "rockchip,rk3066-grf", "syscon": for rk3066
+   - "rockchip,rk3188-grf", "syscon": for rk3188
+   - "rockchip,rk3228-grf", "syscon": for rk3228
+   - "rockchip,rk3288-grf", "syscon": for rk3288
+   - "rockchip,rk3368-grf", "syscon": for rk3368
+   - "rockchip,rk3399-grf", "syscon": for rk3399
+- compatible: PMUGRF should be one of the followings
+   - "rockchip,rk3368-pmugrf", "syscon": for rk3368
+   - "rockchip,rk3399-pmugrf", "syscon": for rk3399
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+Example: GRF and PMUGRF of RK3399 SoCs
+
+	pmugrf: syscon@ff320000 {
+		compatible = "rockchip,rk3399-pmugrf", "syscon";
+		reg = <0x0 0xff320000 0x0 0x1000>;
+	};
+
+	grf: syscon@ff770000 {
+		compatible = "rockchip,rk3399-grf", "syscon";
+		reg = <0x0 0xff770000 0x0 0x10000>;
+	};
-- 
1.9.1
