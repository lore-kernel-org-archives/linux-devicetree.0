From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH 0/4] iio: adc: mediatek: add mt6765 driver support
Date: Thu, 16 May 2019 16:10:43 +0800
Message-ID: <1557994247-16739-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com, jg_poxu@mediatek.com, Chun-Hung Wu <chun-hung.wu@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch adds support of auxadc to MT6765 SoC.

Chun-Hung Wu (4):
  dt-bindings: iio: adc: mediatek: Add document for mt6765
  iio: adc: mediatek: mt6765 upstream driver
  iio: adc: mediatek: SET_LATE_SYSTEM_SLEEP_PM_OPS support
  iio: auxadc: mediatek: change to subsys_initcall

 .../devicetree/bindings/iio/adc/mt6577_auxadc.txt  |  1 +
 drivers/iio/adc/mt6577_auxadc.c                    | 75 +++++++++++++++++-----
 2 files changed, 59 insertions(+), 17 deletions(-)

-- 
1.9.1
