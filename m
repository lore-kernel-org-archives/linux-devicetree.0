From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v3 0/4] watchdog: core: dt: add support for the
 timeout-sec dt property
Date: Fri,  5 Oct 2012 12:16:05 +0200
Message-ID: <1349432169-13006-1-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,
this patchset add the timeout-sec property to the watchdog core,
in the next revision i will add the s3c2410 driver.

changes:
v3:
  - rename watchdog_probe_dt_timeout ->  watchdog_init_timeout
  - move the watchdog_init_timeout function from inline to watchdog_core.c
  - add timeout parameter handling code to watchdog_init_timeout
  - add timeout-sec property to the pnx4008-wdt driver
  - add two small commit for fixup and cleanup
v2:
  - change "timeout" to "timeout-sec" as asked by Jean-Christophe
  - at91sam9_wdt: use the new helper function
  - at91sam9_wdt: add bounds checking
  - watchdog.h: add bounds checking 



Fabio Porcedda (4):
  watchdog: core: dt: add support for the timeout-sec dt property
  watchdog: add timeout-sec property binding to some drivers
  watchdog: orion_wdt: litte cleanup
  watchdog: WatchDog Timer Driver Core: fix comment

 .../devicetree/bindings/watchdog/atmel-wdt.txt     |  4 ++++
 .../devicetree/bindings/watchdog/marvel.txt        |  5 ++++
 .../devicetree/bindings/watchdog/pnx4008-wdt.txt   |  4 ++++
 Documentation/watchdog/watchdog-kernel-api.txt     |  4 ++++
 drivers/watchdog/Kconfig                           |  1 +
 drivers/watchdog/at91sam9_wdt.c                    | 17 ++++++++++----
 drivers/watchdog/orion_wdt.c                       | 13 ++++-------
 drivers/watchdog/pnx4008_wdt.c                     |  7 +++---
 drivers/watchdog/watchdog_core.c                   | 27 ++++++++++++++++++++++
 include/linux/watchdog.h                           |  6 ++++-
 10 files changed, 71 insertions(+), 17 deletions(-)

-- 
1.7.11.3
