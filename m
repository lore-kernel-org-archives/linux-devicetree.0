From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] ARM: at91/tc: DT support
Date: Thu, 19 Jan 2012 19:05:09 +0100
Message-ID: <1326996312-9244-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds the device tree support to the Timer Counter library and
user. The only mainlined user is the clocksource tcb_clksrc.

This series goes on top of current work-in-progress for AIC irqdomain/DT support:
"[PATCH 0/6] ARM: at91: irqdomain and device tree for AIC and GPIO"
and particularly:
"[PATCH v4 1/6] ARM: at91/aic: add irq domain and device tree support"

Uwe, I have added you to the recipient list because you have already seen
a previous revision of the "32 bit enablement" patch ;-)

Nicolas Ferre (3):
      ARM: at91/tclib: take iomem size from resource
      ARM: at91/tc: add device tree support to atmel_tclib
      ARM: at91/tc/clocksource: Add 32 bit variant to Timer Counter

 arch/arm/boot/dts/at91sam9g20.dtsi       |   14 +++++
 arch/arm/boot/dts/at91sam9g45.dtsi       |   15 +++++
 arch/arm/mach-at91/at91sam9260.c         |    7 ++
 arch/arm/mach-at91/at91sam9260_devices.c |   21 ++++++-
 arch/arm/mach-at91/at91sam9g45.c         |    3 +
 arch/arm/mach-at91/at91sam9g45_devices.c |   21 ++++++-
 drivers/clocksource/tcb_clksrc.c         |   90 ++++++++++++++++++++---------
 drivers/misc/atmel_tclib.c               |   64 ++++++++++++++++++---
 include/linux/atmel_tc.h                 |   10 +++
 9 files changed, 203 insertions(+), 42 deletions(-)

Best regards,
-- 
Nicolas Ferre
