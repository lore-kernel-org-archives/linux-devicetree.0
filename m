From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 0/7] ARM: rockchip: add power-domains for Cortex-A9 socs
Date: Tue, 23 Oct 2018 12:38:13 +0200
Message-ID: <20181023103820.6464-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Domain values are done by the book (aka soc documentation for pmu and
power-domain <-> ip block connections) and tested with the gpu and the
wip lima kernel driver as well as te new vop support on rk3188.

changes in v3:
- added spdx license header to dt-binding headers
- added Rob's Review for the added compatibles in patch 3
changes in v2:
- fix typos found by Julien
- adapt to changes happening in the power-domain driver since v1
- add vop power-domain links for rk3188
- drop already applied clock fixes

Heiko Stuebner (7):
  dt-bindings: add power-domain header for RK3188 SoCs
  dt-bindings: add power-domain header for RK3066 SoCs
  dt-bindings: add compatibles for rk3066/rk3188 power controllers
  soc: rockchip: power-domain: add rk3188 powerdomains
  soc: rockchip: power-domain: add rk3066 powerdomains
  ARM: dts: rockchip: add qos nodes found on rk3066 and rk3188
  ARM: dts: rockchip: add rk3066/rk3188 power-domains

 .../bindings/soc/rockchip/power_domain.txt    |  4 ++
 arch/arm/boot/dts/rk3066a.dtsi                | 52 +++++++++++++++++++
 arch/arm/boot/dts/rk3188.dtsi                 | 51 ++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi                 | 40 ++++++++++++++
 drivers/soc/rockchip/pm_domains.c             | 48 +++++++++++++++++
 include/dt-bindings/power/rk3066-power.h      | 22 ++++++++
 include/dt-bindings/power/rk3188-power.h      | 24 +++++++++
 7 files changed, 241 insertions(+)
 create mode 100644 include/dt-bindings/power/rk3066-power.h
 create mode 100644 include/dt-bindings/power/rk3188-power.h

-- 
2.18.0
