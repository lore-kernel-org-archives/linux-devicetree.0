From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/4] usb: atmel_usba_udc: Rework errata handling
Date: Mon, 15 Dec 2014 14:03:04 +0100
Message-ID: <1418648588-17872-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Here is a set of patches porting existing at91sam9rl erratum handling to
DT and adding new code to handle at91sam9g45/9x5 erratum.
It also adds several compatible strings to differentiate those errata.

These patches should be backported to 3.17 and 3.18 stable releases but
they do not apply cleanly on those stable branches.
I'll send a backport of this series once it is merged in mainline.

Regards,

Boris


Boris Brezillon (4):
  usb: atmel_usba_udc: Rework at91sam9rl errata handling
  usb: atmel_usba_udc: Add at91sam9g45 and at91sam9x5 errata handling
  ARM: at91/dt: update udc compatible strings
  usb: atmel_usba_udc: mask status with enabled irqs

 .../devicetree/bindings/usb/atmel-usb.txt          |   5 +-
 arch/arm/boot/dts/at91sam9g45.dtsi                 |   2 +-
 arch/arm/boot/dts/at91sam9x5.dtsi                  |   2 +-
 arch/arm/boot/dts/sama5d3.dtsi                     |   2 +-
 arch/arm/boot/dts/sama5d4.dtsi                     |   2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c            | 104 ++++++++++++++-------
 drivers/usb/gadget/udc/atmel_usba_udc.h            |   7 ++
 7 files changed, 86 insertions(+), 38 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
