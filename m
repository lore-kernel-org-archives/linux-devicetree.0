From: Dehui Sun <dehui.sun@mediatek.com>
Subject: [PATCH v1 0/2] add systimer node for MT8183 SoC
Date: Tue, 11 Jun 2019 19:28:52 +0800
Message-ID: <1560252534-11412-1-git-send-email-dehui.sun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, erin.lo@mediatek.com, weiyi.lu@mediatek.com, dehui.sun@mediatek.com
List-Id: devicetree@vger.kernel.org

This series are based on 5.2-rc1 and add systimer node for MT8183,
and this timer will serve as a wakeup-up source for cpu-idle feature.

Dehui Sun (2):
  dt-bindings: mediatek: update bindings for MT8183 systimer
  arm64: dts: mt8183: add systimer0 device node

 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                       | 9 +++++++++
 2 files changed, 10 insertions(+)

-- 
2.1.0
