From: <dongchun.zhu@mediatek.com>
Subject: [V2, 0/2] media: ov8856: DT bindings and sensor mode improvements
Date: Tue, 10 Sep 2019 21:04:44 +0800
Message-ID: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
References: <media: ov8856: DT bindings and sensor mode improvements>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <media: ov8856: DT bindings and sensor mode improvements>
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

This series adds DT bindings and some more sensor modes for users to use.

>From the latest ov8856 datasheet, it is proposed to adopt the resolution
of 1632*1224 and 3264*2448, together with Bayer Order of BGGR.
Thus here we try to provide two more scenarios.

In addition, the hardware revision of ov8856 is checked from one OTP SRAM register R700F.
PLL register R3614 requires to be correspondingly updated.
For instance, 0x20 is preferred for 1B module revision.

Mainly changes of v2 are addressing the comments from Sakari, Tomasz,
including,
 - Add clock-frequency and link-frequencies in DT
 - Re-define some macros like R3614, R3d84, n_shutdn
 - Rename OV8856_MCLK to OV8856_XVCLK per datasheet
 - Refine ov8856_update_otp_reg, ov8856_configure_regulators and ov8856_cal_delay
 - Set the bayer order in the mode struct, and directly links to register R3808, R3809
 - Remove or refine redundant log print
 - Fix other reviewed issues in v1

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Add bindings for ov8856
  media: i2c: Add more sensor modes for ov8856 camera sensor

 .../devicetree/bindings/media/i2c/ov8856.txt       |  51 ++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/ov8856.c                         | 654 ++++++++++++++++++++-
 3 files changed, 691 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt

-- 
2.9.2
