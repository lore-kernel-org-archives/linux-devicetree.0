From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 0/2] dts: arm64: imx8mq: Enable gpu passive throttling
Date: Wed, 11 Sep 2019 19:40:34 -0700
Message-ID: <cover.1568255903.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "To : Lucas Stach" <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, etnaviv@lists.freedesktop.org, dri-devel@
List-Id: devicetree@vger.kernel.org

Temperature and hysteresis were picked after the CPU.

Changes from v1:
 - Update dt bindings
 - Fix broken phandle

Guido Günther (2):
  dts: arm64: imx8mq: Enable gpu passive throttling
  dt-bindings: etnaviv: Add #cooling-cells

 .../bindings/display/etnaviv/etnaviv-drm.txt      |  1 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi         | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

-- 
2.23.0.rc1
