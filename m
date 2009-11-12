From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: [PATCHv2 3/3] mpc52xx/wdt: remove obsolete old WDT implementation
Date: Thu, 12 Nov 2009 19:45:20 +0100
Message-ID: <1258051520.2280.3@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: "Likely, Grant" <grant.likely@secretlab.ca>, Linux PPC Development <linuxppc-dev@ozlabs.org>, Devicetree Discussions <devicetree-discuss@lists.ozlabs.org>, Wim Van Sebroeck <wim@iguana.be>
List-Id: devicetree@vger.kernel.org

Remove the old WDT implementation.

Signed-off-by: Albrecht Dre=DF <albrecht.dress@arcor.de>
---

Change against v1: WDT stuff now fully merged into the file
arch/powerpc/platforms/52xx/mpc52xx_gpt.c.

Note: The file drivers/watchdog/mpc5200_wdt.c is now obsolete and should be=
 removed.

 drivers/watchdog/Kconfig  |    4 +++-
 drivers/watchdog/Makefile |    1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 3711b88..d958b76 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -861,8 +861,10 @@ config GEF_WDT
 	  Watchdog timer found in a number of GE Fanuc single board computers.
 =

 config MPC5200_WDT
-	tristate "MPC5200 Watchdog Timer"
+	bool "MPC52xx Watchdog Timer"
 	depends on PPC_MPC52xx
+	help
+	  Use General Purpose Timer (GPT) 0 on the MPC5200 as Watchdog.
 =

 config 8xxx_WDT
 	tristate "MPC8xxx Platform Watchdog Timer"
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 699199b..89c045d 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -118,7 +118,6 @@ obj-$(CONFIG_TXX9_WDT) +=3D txx9wdt.o
 =

 # POWERPC Architecture
 obj-$(CONFIG_GEF_WDT) +=3D gef_wdt.o
-obj-$(CONFIG_MPC5200_WDT) +=3D mpc5200_wdt.o
 obj-$(CONFIG_8xxx_WDT) +=3D mpc8xxx_wdt.o
 obj-$(CONFIG_MV64X60_WDT) +=3D mv64x60_wdt.o
 obj-$(CONFIG_PIKA_WDT) +=3D pika_wdt.o
