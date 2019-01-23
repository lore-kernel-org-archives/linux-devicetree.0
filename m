From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V2 0/5] dt-binding: clk: prepare for imx8qm clock support
Date: Wed, 23 Jan 2019 08:16:39 +0000
Message-ID: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

After a bit more investigation on IMX8QM, it seemed SCU clock can be used
in a similar way as IMX8QXP. So update the binding and driver to be a bit
generic for easily extension of IMX8QM support later.

Dong Aisheng (5):
  dt-bindings: fsl: scu: add fallback compatible string for clock
  dt-bindings: fsl: scu: add imx8qm scu clock support
  dt-bindings: clock: update CPU clock ID name
  dt-bindings: imx8-clock: add a53 and a72 clock id
  clk: imx: scu: add fallback compatible string support

 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 7 +++++--
 drivers/clk/imx/clk-imx8qxp.c                               | 1 +
 include/dt-bindings/clock/imx8-clock.h                      | 8 +++++---
 3 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.7.4
