From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v6 0/4] ARM: dts: sun9i: Enable X-Powers AC100 RTC
Date: Fri, 19 Aug 2016 15:42:22 +0800
Message-ID: <20160819074226.16636-1-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCMILY6JWQBBB7EK3O6QKGQE5MVYQIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This was "mfd: ac100: Add support for X-Powers AC100 audio codec / RTC
combo IC". The driver bits have all been merged.

Changes since v5:

  - Driver bits merged and dropped from series.
  - Added fix to rtc-ac100 clock register code to honor the
    "clock-output-names" DT property.
  - Added "clk-div" and "clk-mult" to osc32k placeholder clock node

Changes since v4:

  - Style changes to DT bindings.
  - Added commit message to DT bindings commit.

Changes since v3:

  - bulk write support for regmaps without raw formatting patch merged
    and thus dropped from series.

  - sun9i device node re-ordering patches merged and thus dropped from
    series.

  - Fixed device node name and added labels to device tree binding example.

  - Moved 4M_adda clock to codec side, and added clock bindings to codec
    node.

  - Rename RTC clock output related prefixes from clk32k to clkout.

  - Rename default clock output names to cko{1,2,3}-rtc.

  - Move struct tm to/from RTC conversion offsets inline with reg[]
    assignments

  - Drop separate mutex and use rtc->ops_lock in interrupt handler.

  - Use platform_get_irq instead of of_get_irq.

  - Add struct of_device_id and .of_match_table to RTC driver.

Changes since v2:

  - Fix ac100_codec interrupt line in DT binding example.

  - Fix copy-paste errors in RTC set_alarm. Alarm now works.

  - Drop file name from MFD driver.

  - Add / update copyright notices.

  - Change license of RTC driver to GPL v2, matching MFD driver.

  - Fix MFD driver MODULE_LICENSE to match license declaration in header.

Changes since v1:

  - Complete register definitions and regmap regions.


Patch 1 adds a fix to rtc-ac100 clock register code to honor the
"clock-output-names" DT property.

Patch 2 adds the AC100 device nodes to the A80 Optimus board dts.

Patch 3 adds the AC100 device nodes to the Cubieboard4 board dts.

Patch 4 changes the fixed osc_32k clk to a fixed factor clk,
representing the 32k clk input pin on the SoC, and also hooks up the
ac100 rtc clk output to this clk in the board dts files.


Regards
ChenYu

Chen-Yu Tsai (4):
  rtc: ac100: support clock-output-names in device tree binding
  ARM: dts: sun9i: a80-optimus: Add device node for AC100
  ARM: dts: sun9i: cubieboard4: Add device node for AC100
  ARM: dts: sun9i: Switch to the AC100 RTC clock outputs for osc32k

 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 29 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun9i-a80-optimus.dts     | 29 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun9i-a80.dtsi            | 11 +++++------
 drivers/rtc/rtc-ac100.c                     |  2 ++
 4 files changed, 65 insertions(+), 6 deletions(-)

-- 
2.9.3

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
