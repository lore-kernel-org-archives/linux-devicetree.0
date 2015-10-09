From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCH 0/2] arm: mvebu: disable unused rtc + cosmetic patch for
 ReadyNAS devices
Date: Sat, 10 Oct 2015 00:10:05 +0200
Message-ID: <cover.1444428035.git.arno@natisbad.org>
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
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, TuxOholic <tuxoholic@hotmail.de>
List-Id: devicetree@vger.kernel.org

Hi,

Here are two simple patches for Armada-based ReadyNAS devices.

The first one disables Armada 370/XP rtc in the .dts files of ReadyNAS
102, 104 and 2120 devices. Those use an Intersil ISL12057 I2C RTC chip
and do not use the internal Armada RTC. Because it is enabled in
included armada-370-xp.dtsi, it just pollutes logs during boot.

While writing the patches, I noticed RN2120 .dts file has nodes that
are badly ordered under internal-regs. This second patch fixes
that. Note that it depends on first patch. 

Arnaud Ebalard (2):
  arm: mvebu: disable unused Armada RTC on ReadyNAS 102, 104 and 2120
  arm: mvebu: reorder internal-regs nodes by address in RN2120 .dts file

 arch/arm/boot/dts/armada-370-netgear-rn102.dts |  6 ++
 arch/arm/boot/dts/armada-370-netgear-rn104.dts |  6 ++
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 86 ++++++++++++++------------
 3 files changed, 58 insertions(+), 40 deletions(-)

-- 
2.5.3
