From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v4 0/5] Add ARM Mali Midgard device tree bindings and gpu node for rk3288
Date: Tue, 25 Apr 2017 14:16:15 +0100
Message-ID: <cover.1493125299.git.guillaume.tucker@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ARM Mali Midgard GPU kernel driver is only available
out-of-tree and is not going to be merged in its current form.
However, it would be useful to have its device tree bindings
merged.  In particular, this would enable distributions to create
working driver packages (dkms...) without having to patch the
kernel.

The bindings for the earlier Mali Utgard GPU family have already
been merged, so this is essentially the same scenario but for
newer GPUs (Mali-T604 ~ Mali-T880).

This series of patches first imports the bindings from the latest
driver release with some clean-up then adds a gpu node for the
rk3288 SoC.  This was successfully tested on Radxa Rock2 Square,
Firefly, Veyron Minnie and Jerry boards using Mali kernel driver
r16p0 and r12p0 user-space binary.


Changes since v1:
- enabled gpu on rk3288-veyron boards

Changes since v2:
- removed "clk-names" property and "clk_mali" name
- converted values of "interrupt-names" property to
  lower-case: "job", "mmu" and "gpu"
- replaced dt compatible strings with list of all Midgard GPU variants and
  optional vendors
- cleaned up gpu node example

Changes since v3:
- add "rockchip,rk3288-mali" vendor compatible string
- move gpu node at the right location in rk3288.dtsi
- use operating-points-v2 in documentation and rk3288.dtsi


Enric Balletbo i Serra (1):
  ARM: dts: rockchip: enable ARM Mali GPU on rk3288-veyron

Guillaume Tucker (4):
  dt-bindings: gpu: add bindings for the ARM Mali Midgard GPU
  ARM: dts: rockchip: add ARM Mali GPU node for rk3288
  ARM: dts: rockchip: enable ARM Mali GPU on rk3288-rock2-som
  ARM: dts: rockchip: enable ARM Mali GPU on rk3288-firefly

 .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 82 ++++++++++++++++++++++
 arch/arm/boot/dts/rk3288-firefly.dtsi              |  5 ++
 arch/arm/boot/dts/rk3288-rock2-som.dtsi            |  5 ++
 arch/arm/boot/dts/rk3288-veyron.dtsi               |  5 ++
 arch/arm/boot/dts/rk3288.dtsi                      | 43 ++++++++++++
 5 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt

--
2.11.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
