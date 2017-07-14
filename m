From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH v2 0/3] USB Mux support for Chipidea
Date: Fri, 14 Jul 2017 14:40:02 -0700
Message-ID: <20170714214005.14967-1-stephen.boyd@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@nxp.com>, Andy Gross <andy.gross@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Rosin <peda@axentia.se>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the TC7USB40MU usb mux found on 
db410c 96boards platforms via the new multiplexer framework and
hooks that into the chipidea driver. This allows us to properly
control host or device mode on this board via the sysfs knob.

So far I've only tested this on db410c, so I need to test it on
db8974 and ifc6410 still. But role switching and cable connect/disconnect
on the micro-usb port and gadget looks to be working on db410c.

Changes from v1:
 * Dropped mux driver and used gpio-mux instead
 * Fixed role switch by moving mux selecting in udc.c to right place

TODO:

 1. The userspace side of things is murky. What is expected to go and toggle
    the host/gadget side of things in userspace at this very specific location
    for chipidea devices?

Stephen Boyd (3):
  mux: Add mux_control_get_optional() API
  usb: chipidea: Hook into mux framework to toggle usb switch
  arm64: dts: qcom: Collapse usb support into one node

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |  6 ++
 Documentation/driver-model/devres.txt              |  1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          | 38 +++++----
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 62 +++++++-------
 drivers/mux/mux-core.c                             | 98 +++++++++++++++++-----
 drivers/usb/chipidea/Kconfig                       |  1 +
 drivers/usb/chipidea/core.c                        |  5 ++
 drivers/usb/chipidea/host.c                        |  7 ++
 drivers/usb/chipidea/udc.c                         | 13 ++-
 include/linux/mux/consumer.h                       |  4 +
 include/linux/usb/chipidea.h                       |  2 +
 11 files changed, 166 insertions(+), 71 deletions(-)

-- 
2.10.0.297.gf6727b0
