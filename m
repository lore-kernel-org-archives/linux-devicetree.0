From: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH v2 0/3] reset: meson: add Meson-A1 SoC support
Date: Mon, 23 Sep 2019 16:34:18 +0800
Message-ID: <1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Xingyu Chen <xingyu.chen@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for Meson-A1 SoC Reset Controller. A new struct
meson_reset_param is introduced to describe the register differences between
Meson-A1 and previous SoCs.

This patchset is based on A1 DTBv4[0].

Changes since v1 at [1]:
- rebase on linux-next
- add Neil's Reviewed-by

[0] https://lore.kernel.org/linux-amlogic/1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com
[1] https://lore.kernel.org/linux-amlogic/1568808746-1153-1-git-send-email-xingyu.chen@amlogic.com

Xingyu Chen (3):
  arm64: dts: meson: add reset controller for Meson-A1 SoC
  dt-bindings: reset: add bindings for the Meson-A1 SoC Reset Controller
  reset: add support for the Meson-A1 SoC Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  6 +++
 drivers/reset/reset-meson.c                        | 35 ++++++++++---
 include/dt-bindings/reset/amlogic,meson-a1-reset.h | 59 ++++++++++++++++++++++
 4 files changed, 94 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h

-- 
2.7.4
