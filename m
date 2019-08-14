From: Michael Kao <michael.kao@mediatek.com>
Subject: [PATCH 0/4] add dts for Mediatek MT8183 thermal functions
Date: Wed, 14 Aug 2019 18:06:45 +0800
Message-ID: <1565777209-21869-1-git-send-email-michael.kao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Splitting the dtsi part from [1] and sending it again.

Add tzts1~5 and tztsABB from thermal sensor in SoC for
another get temperatrue. They don't need to thermal throttle.
And we bind coolers for thermal zone nodes of cpu_thermal.

Refernece:
[1] [v2,0/8] Add Mediatek thermal dirver and dtsi (https://patchwork.kernel.org/cover/10938809/)

Matthias Kaehlcke (1):
  arm64: dts: mt8183: Configure CPU cooling

michael.kao (3):
  arm64: dts: mt8183: add thermal zone node
  arm64: dts: mt8183: add dynamic power coefficients
  arm64: dts: mt8183: Add #cooling-cells to CPU nodes

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 139 +++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)
