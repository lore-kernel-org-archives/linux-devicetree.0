From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/2] dt-bindings: display: fix native-mode setting
Date: Sat,  5 Oct 2019 15:09:19 +0200
Message-ID: <20191005130921.12874-1-martin@kaiser.cx>
References: <20190918193853.25689-1-martin@kaiser.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918193853.25689-1-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Alexander Shiyan <shc_work@mail.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

According to
Documentation/devicetree/bindings/display/panel/display-timing.txt,
native-mode is a property of the display-timings node.

If it's located outside of display-timings, the native-mode setting is
ignored and the first display timing is used.

We've already fixed the board definitions which got this wrong. Fix the
examples in the device tree bindings as well.

Martin Kaiser (2):
  dt-bindings: display: imx: fix native-mode setting
  dt-bindings: display: clps711x-fb: fix native-mode setting

 Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt | 2 +-
 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.11.0
