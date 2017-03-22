From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/7] rtc: Reuse rtc-sh driver to support RZ/A1
Date: Wed, 22 Mar 2017 10:27:47 -0400
Message-ID: <20170322142754.30888-1-chris.brandt@renesas.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDXOFUXT2UGBBIUUZLDAKGQEH6OUQVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Basically, the same RTC that was used in SuperH devices is now used in
RZ/A1 devices. Therefore with some slight changes, that driver can be
reused.

Additionally, since ARM architectures require Device Tree configurations,
device tree support has been added.

This was tested on RZ/A1H RSK board. Once the correct time was programmed
into the RTC running off a 32.768kHz crystal, you can retain an accurate
system clock between reboots (hard and soft) until power is finally removed
from the board (there is no batter backup on the RSK board).

v2:
* removed HAVE_CLK from Kconfig
* when using DT, look for "fck" instead of "rtc0"
* changed (res == NULL) to (!res)
* added Reviewed-by for rtc-sh.c
* added interrupt-names and clock-names
* clocks now include counting sources
* added clock-names "fck", "rtc_x1", "rtc_x3", "extal"
* changed 'is a RTC' to 'is an RTC' in commit message
* changed "rtc0" to "rtc"
* Added clock nodes for RTC_X1 and RTC_X3 pin inputs
* each commit now has a log message


Chris Brandt (7):
  rtc: rtc-sh: add support for rza series
  rtc: Add rtc-sh
  ARM: dts: r7s72100: add rtc clock to device tree
  ARM: dts: r7s72100: add RTC_X clock inputs to device tree
  ARM: dts: r7s72100: add rtc to device tree
  ARM: dts: rskrza1: set rtc_x1 clock value
  ARM: dts: rskrza1: add rtc DT support

 Documentation/devicetree/bindings/rtc/rtc-sh.txt | 29 +++++++++++++++++++
 arch/arm/boot/dts/r7s72100-rskrza1.dts           |  8 +++++
 arch/arm/boot/dts/r7s72100.dtsi                  | 37 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                              |  4 +--
 drivers/rtc/rtc-sh.c                             | 33 +++++++++++++++++----
 include/dt-bindings/clock/r7s72100-clock.h       |  3 ++
 6 files changed, 107 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt

-- 
2.10.1


-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
