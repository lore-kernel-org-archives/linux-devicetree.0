From: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 0/6] omap-am33xx rtc dt support
Date: Fri, 27 Jul 2012 17:53:24 +0530
Message-ID: <cover.1343383616.git.afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, khilman-l0cyMroinI0@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This series makes rtc-omap driver DT capable, adds AM33xx
RTC DT support along with a few enchancments to the driver.

rtc-omap driver is made intelligent enough to handle kicker
mechanism. This helps in removing kicker mechanism support
done for DaVinci at platform level.

This has been tested on Beaglebone (AM33xx platform) and on
DaVinci DA850 EVM.

This series is based over linux-omap master and can be
directly applied over linux-next, except for
[PATCH 6/6] arm/dts: am33xx rtc node.

PATCH 6/6 should go through linux-omap tree and needs
http://www.mail-archive.com/linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg71644.html
(arm/dts: am33xx wdt node) to get applied cleanly

Regards
Afzal

v3:
 Remove unit address in DT node
 Use readb/writeb instead of __raw_* variants
 Remove unnecessary parens

v2:
 Use device name da830-rtc instead of am1808-rtc, similar change in
 compatible for DT
 Newly added register name made similar to that existing in the driver
 Better commit message description
 Modify Kconfig help, resolve checkpatch warning

Afzal Mohammed (5):
  rtc: omap: kicker mechanism support
  ARM: davinci: remove rtc kicker release
  rtc: omap: dt support
  rtc: omap: depend on am33xx
  arm/dts: am33xx rtc node

Vaibhav Hiremath (1):
  rtc: omap: Add runtime pm support

 Documentation/devicetree/bindings/rtc/rtc-omap.txt |   20 +++++
 arch/arm/boot/dts/am33xx.dtsi                      |    5 +
 arch/arm/mach-davinci/devices-da8xx.c              |   13 +---
 drivers/rtc/Kconfig                                |   10 ++-
 drivers/rtc/rtc-omap.c                             |   79 +++++++++++++++++++-
 5 files changed, 108 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-omap.txt
