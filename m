From: <dongchun.zhu@mediatek.com>
Subject: [PATCH 0/3] media: suppport ov02a10 sensor driver
Date: Thu, 23 May 2019 18:22:01 +0800
Message-ID: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
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
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, bingbu.cao@intel.com
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, menghui.lin@mediatek.com, shengnan.wang@mediatek.com, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

Hello,

This is the OV02A10 sensor driver, which would be used in camera features on CrOS application.

The driver is implemented wth V4L2 framework.
1. Async registered as a V4L2 I2C sub-device.
2. A media entity that can provide several source pads and sink pads to link with other device like Seninf, ISP one after another
   to create a default overall camera topology, image frame or meta-data from sensor can flow through particular path to output
   preview or capture image or 3A info.

Dongchun Zhu (3):
  media: i2c: ov02a10: Add ov02a10 camera sensor driver
  media: i2c: ov02a10: Add CONFIG_VIDEO_OV02A10
  media: dt-bindings: media: i2c: Add bindings for ov02a10

 .../devicetree/bindings/media/i2c/ov02a10.txt      |   43 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1067 ++++++++++++++++++++
 4 files changed, 1123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2
