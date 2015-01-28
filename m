From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH 0/2] Add Mediatek RTC driver
Date: Wed, 28 Jan 2015 17:27:54 +0800
Message-ID: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, rtc-linux@googlegroups.com, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, yingjoe.chen@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RTC is one submodule of Mediatek MT6397 PMIC chip[1]. This series 
support RTC driver that work with Mediatek SoC like MT8135, MT8173.
It implements second counter and also provide alarm function.

This series base on 3.19-rc1, and Sascha's PMIC mfd patch[1]. Test ok 
on MT8135 platform.

[1] https://lkml.org/lkml/2015/1/23/325

Eddie Huang (1):
  dt: bindings: Add Mediatek RTC driver binding document

Tianping Fang (1):
  rtc: mediatek: Add MT63xx RTC driver

 .../bindings/rtc/mediatek,mt63xx-rtc.txt           |  18 ++
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-mt6397.c                           | 352 +++++++++++++++++++++
 4 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt63xx-rtc.txt
 create mode 100644 drivers/rtc/rtc-mt6397.c

-- 
1.8.1.1.dirty
