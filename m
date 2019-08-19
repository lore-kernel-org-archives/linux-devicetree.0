From: <dongchun.zhu@mediatek.com>
Subject: [V3, 0/2] media: Add support for OV02A10 sensor
Date: Mon, 19 Aug 2019 11:43:29 +0800
Message-ID: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
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

This patch adds driver and bindings for Omnivision's OV02A10 2 megapixel CMOS 1/5" sensor,
which has a single MIPI lane interface and output format of 10-bit Raw.

The driver is implemented wth V4L2 framework.
1. Async registered as a V4L2 I2C sub-device.
2. A media entity that can provide several source pads and sink pads to link with other device like Seninf, ISP one after another
   to create a default overall camera topology, image frame or meta-data from sensor can flow through particular path to output
   preview or capture image or 3A info.

Changes of v3 are mainly addressing comments from Rob, Sakari, Bingbu.
 - Fix coding style errors in dt-bindings
 - Use macro flag to describle basic line 1224 when updating v-blanking
 - Remove unnecessary debug log in driver

Mainly changes of v2 are addressing the comments from Nicolas, Bingbu, Sakari, Rob,
including,
 - Put dt binding before driver in series
 - Add MAINTAINERS entries
 - Squash the MAINTAINERS entry and Kconfig to driver patch
 - Add rotation support for driver
 - Fix other reviewed issues in v1

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Add bindings for OV02A10
  media: i2c: Add Omnivision OV02A10 camera sensor driver

 .../devicetree/bindings/media/i2c/ov02a10.txt      |   54 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1018 ++++++++++++++++++++
 5 files changed, 1092 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2
