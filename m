From: <dinguyen@opensource.altera.com>
Subject: [PATCHv2 0/2] ARM: dts: socfpga: fix booting with SD/MMC
Date: Mon, 20 Oct 2014 10:31:17 -0500
Message-ID: <1413819079-17120-1-git-send-email-dinguyen@opensource.altera.com>
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
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, jh80.chung@samsung.com, dianders@chromium.org
Cc: devicetree@vger.kernel.org, dinh.linux@gmail.com, atull@opensource.altera.com, Dinh Nguyen <dinguyen@opensource.altera.com>, s.trumtrar@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

The SOCFPGA dev kit was hanging during bootup on the SD/MMC driver loading.
The first patch fixes the booting and the 2nd patch adds a regulator node
for the SD/MMC driver to use.

v2 diff(s): Patch 2/2 ARM: dts: socfpga: Add a 3.3V fixed regulator node
	- Move the regulator nodes to their respective board dts file and
	  correctly rename the regulator to match the schematic

Dinh Nguyen (2):
  ARM: dts: socfpga: Fix SD card detect
  ARM: dts: socfpga: Add a 3.3V fixed regulator node

 arch/arm/boot/dts/socfpga_arria5.dtsi         |  2 +-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts    | 14 ++++++++++++++
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts  | 13 ++++++++++++-
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts | 14 ++++++++++++++
 4 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.0.3
