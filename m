From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/3] socfpga: dts: cleanups
Date: Wed, 11 Sep 2013 10:34:08 +0200
Message-ID: <1378888451-28096-1-git-send-email-s.trumtrar@pengutronix.de>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>, kernel@pengutronix.de, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org

Hi!

This series moves the cyclone5 specific DT stuff to a "new" dtsi file,
and adds a dts for the socfpga_cyclone5_socdk aka the previous socfpga_cyclone5.
This is in preparation for other cyclone5 based boards (e.g. SoCkit or Socrates)

Also, fix the clock names in the socfpga.dtsi and cleanup the indentation.

Regards,
Steffen


Steffen Trumtrar (3):
  ARM: socfpga: dts: Move common nodes to cyclone5 dtsi
  ARM: socfpga: dts: cleanup indentation
  ARM: socfpga: dts: fix s2f_* clock name

 arch/arm/boot/dts/Makefile                         |   2 +-
 arch/arm/boot/dts/socfpga.dtsi                     | 296 ++++++++++-----------
 ...{socfpga_cyclone5.dts => socfpga_cyclone5.dtsi} |  20 --
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |  40 +++
 4 files changed, 189 insertions(+), 169 deletions(-)
 rename arch/arm/boot/dts/{socfpga_cyclone5.dts => socfpga_cyclone5.dtsi} (78%)
 create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts

-- 
1.8.4.rc3
