From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH 00/11] ARM: dts: NSP: define SATA, Reboot,
 RAM and new device tree files
Date: Wed,  3 Aug 2016 14:38:55 -0400
Message-ID: <1470249546-12440-1-git-send-email-jon.mason@broadcom.com>
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
To: f.fainelli@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series adds SATA and RAM for the existing HR and XMC device
tree files (as they were missed when those peices were originally
added).  It also adds GPIO rebooting to the platforms that support that
feature.  Finally, add device tree files for all known NSP based
reference boards.

The only outstanding HW that isn't fully supported on all NSP boards is
USB and sound.  So, we're getting close :)

NOTE: SATA is not in the NSP DTSI in Florian's git tree, but it is
currently in Linus' (due to it going through another maintainer).  So,
it won't build until the merge with Linus' tree is done.  I thought it
better to do it this way instead of splitting it off and sending it as
a follow-on in a couple of weeks.  Let me know if it is preferred I do
it that way.

Thanks,
Jon

Jon Mason (11):
  ARM: dts: NSP: Enable SATA on bcm958625hr
  ARM: dts: NSP: Enable SATA and add i2c devices on XMC
  ARM: dts: NSP: Specify RAM amount for BCM958625K board
  ARM: dts: NSP: Specify RAM amount for BCM958525XMC board
  ARM: dts: NSP: Add GPIO reboot method to bcm958625hr DTS file
  ARM: dts: NSP: Add GPIO reboot method to bcm958625xmc DTS file
  ARM: dts: NSP: Add new DT file for bcm958525er
  ARM: dts: NSP: Add new DT file for bcm958522er
  ARM: dts: NSP: Add new DT file for bcm988312hr
  ARM: dts: NSP: Add new DT file for bcm958623hr
  ARM: dts: NSP: Add new DT file for bcm958622hr

 arch/arm/boot/dts/Makefile         |   5 +
 arch/arm/boot/dts/bcm958522er.dts  | 130 ++++++++++++++++++++++++++
 arch/arm/boot/dts/bcm958525er.dts  | 142 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/bcm958525xmc.dts |  44 ++++++++-
 arch/arm/boot/dts/bcm958622hr.dts  | 170 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/bcm958623hr.dts  | 178 ++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/bcm958625hr.dts  |  19 ++++
 arch/arm/boot/dts/bcm958625k.dts   |   5 +
 arch/arm/boot/dts/bcm988312hr.dts  | 182 +++++++++++++++++++++++++++++++++++++
 9 files changed, 874 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm958522er.dts
 create mode 100644 arch/arm/boot/dts/bcm958525er.dts
 create mode 100644 arch/arm/boot/dts/bcm958622hr.dts
 create mode 100644 arch/arm/boot/dts/bcm958623hr.dts
 create mode 100644 arch/arm/boot/dts/bcm988312hr.dts

-- 
2.7.4
