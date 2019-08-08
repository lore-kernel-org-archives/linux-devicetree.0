From: <dongchun.zhu@mediatek.com>
Subject: [V1, 0/2] media: ov8856: DT bindings and sensor mode improvements
Date: Thu, 8 Aug 2019 17:22:13 +0800
Message-ID: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
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
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, sakari.ailus@linux.intel.com, drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

Hello,

This series adds DT bindings and some more sensor modes for users to use.

>From the latest ov8856 datasheet, it is proposed to adopt the resolution of 1632*1224 and 3264*2448,
together with Bayer Order of BGGR. Thus here we provide two more scenarios.

In addition, the hardware version of ov8856 is also distinguished from one OTP SRAM register R700F.
PLL register R3614 requires to be correspondingly updated.
For instance, 0x20 is suggested for 1B camera module.

It is emphasized that I2C still actives while device is to runtime suspended.
This makes ov8856_suspend function need to remove the operation of stoping streaming.

Finally, ARM and device tree matching were added as an alternative.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Add bindings for OV8856
  media: i2c: Add more sensor mode for OV8856 camera sensor

 .../devicetree/bindings/media/i2c/ov8856.txt       |  41 ++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/ov8856.c                         | 624 ++++++++++++++++++++-
 3 files changed, 663 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt

-- 
2.9.2
