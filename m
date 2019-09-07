From: <dongchun.zhu@mediatek.com>
Subject: [V4, 0/2] media: i2c: Add support for OV02A10 sensor
Date: Sat, 7 Sep 2019 17:27:26 +0800
Message-ID: <20190907092728.23897-1-dongchun.zhu@mediatek.com>
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
To: mchehab@kernel.org, andriy.shevchenko@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, sakari.ailus@linux.intel.com, drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com
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

Changes of v4 mainly address the comments from Sakari, Rob, Tomasz.
 - Remove data-lanes property in DT
 - Add link frequencies in DT to match the expect value that driver requires
 - Omit open callback as int_cfg is implemented
 - Use i2c_smbus_write_byte_data/i2c_smbus_read_byte_data instead of customed APIs
 - Use do_div to calculate pixel rate
 - Use usleep_range directly for shoter sleep case
 - Re-adjust sensor power up/off sequence
 - Re-set pd/rst GPIO inverter property according to the datasheet
 - Refine set_exposure/set_gain/set_vblanking/set_test_pattern functions
 - Fix other reviewed issues in v3

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

 .../devicetree/bindings/media/i2c/ov02a10.txt      |   54 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1062 ++++++++++++++++++++
 5 files changed, 1136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2
