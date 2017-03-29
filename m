From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 0/4] Add ARM Mali Midgard device tree bindings and gpu node for rk3288
Date: Wed, 29 Mar 2017 13:44:57 +0100
Message-ID: <cover.1490789802.git.guillaume.tucker@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
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
rk3288 SoC.  This was successfully tested on a Radxa Rock2 Square
board using Mali kernel driver r16p0 and r12p0 user-space binary.

Guillaume Tucker (4):
  dt-bindings: gpu: add bindings for the ARM Mali Midgard GPU
  ARM: dts: rockchip: add ARM Mali GPU node for rk3288
  ARM: dts: rockchip: enable ARM Mali GPU on rk3288-rock2-som
  ARM: dts: rockchip: enable ARM Mali GPU on rk3288-firefly

 .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 53 ++++++++++++++++++++++
 arch/arm/boot/dts/rk3288-firefly.dtsi              |  5 ++
 arch/arm/boot/dts/rk3288-rock2-som.dtsi            |  5 ++
 arch/arm/boot/dts/rk3288.dtsi                      | 23 ++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt

--
2.11.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
