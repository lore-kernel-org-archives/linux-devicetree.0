From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 4/5] arm: mvebu: update DT to support local timers
Date: Fri, 25 Jan 2013 18:32:44 +0100
Message-ID: <1359135165-32108-5-git-send-email-gregory.clement@free-electrons.com>
References: <1359135165-32108-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1359135165-32108-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, John Stultz <johnstul@us.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@arm.linux.org.uk>
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Now that the time-armada-370-xp support local timers, updated the
device tree to take it into account.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-370-xp.dtsi |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 4c0abe8..aa6a187 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -68,8 +68,9 @@
 
 		timer@d0020300 {
 			       compatible = "marvell,armada-370-xp-timer";
-			       reg = <0xd0020300 0x30>;
-			       interrupts = <37>, <38>, <39>, <40>;
+			       reg = <0xd0020300 0x30>,
+			       <0xd0021040 0x30>;
+			       interrupts = <37>, <38>, <39>, <40>, <5>, <6>;
 			       clocks = <&coreclk 2>;
 		};
 
-- 
1.7.9.5
