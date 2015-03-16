From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/3] Documentation: devicetree: add binding doc for
 Broadcom NAND controller
Date: Mon, 16 Mar 2015 16:46:34 -0700
Message-ID: <20150316234634.GN32500@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-3-git-send-email-computersforpeace@gmail.com>
 <55076247.4070104@broadcom.com>
 <20150316233706.GL32500@ld-irv-0074>
 <550769DD.2020208@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <550769DD.2020208@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <sbranden@broadcom.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 16, 2015 at 04:40:13PM -0700, Scott Branden wrote:
> 
> On 15-03-16 04:37 PM, Brian Norris wrote:
> >On Mon, Mar 16, 2015 at 04:07:51PM -0700, Scott Branden wrote:
> >>On 15-03-06 05:18 PM, Brian Norris wrote:
> >>>Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >>>---
> >>>  .../devicetree/bindings/mtd/brcmstb_nand.txt       | 109 +++++++++++++++++++++
> >>>  1 file changed, 109 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/mtd/brcmstb_nand.txt
> >>>
> >>>diff --git a/Documentation/devicetree/bindings/mtd/brcmstb_nand.txt b/Documentation/devicetree/bindings/mtd/brcmstb_nand.txt
> >>>new file mode 100644
> >>>index 000000000000..933d44943cbb
> >>>--- /dev/null
> >>
> >>Could you change the binding document with the vendor prefix to
> >>match all the other drivers we have been submitting? ie.
> >>"brcm,brcmnand.txt"
> >
> >$ find Documentation/devicetree/ -name 'broadcom*'
> >Documentation/devicetree/bindings/net/broadcom-systemport.txt
> >Documentation/devicetree/bindings/net/broadcom-bcm87xx.txt
> >Documentation/devicetree/bindings/net/broadcom-mdio-unimac.txt
> >Documentation/devicetree/bindings/net/broadcom-bcmgenet.txt
> >Documentation/devicetree/bindings/net/broadcom-sf2.txt
> >
> >$ find Documentation/devicetree/ -name 'brcm[^,]*'
> >Documentation/devicetree/bindings/arm/brcm-brcmstb.txt
> >
> >$ find Documentation/devicetree/ -name 'brcm,*'
> >Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> >Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
> >Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
> >Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> >Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
> >Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
> >Documentation/devicetree/bindings/spi/brcm,bcm2835-spi.txt
> >Documentation/devicetree/bindings/rng/brcm,bcm2835.txt
> >Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
> >Documentation/devicetree/bindings/pinctrl/brcm,bcm11351-pinctrl.txt
> >Documentation/devicetree/bindings/bus/brcm,gisb-arb.txt
> >Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.txt
> >Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351-cpu-method
> >Documentation/devicetree/bindings/mmc/brcm,bcm2835-sdhci.txt
> >Documentation/devicetree/bindings/timer/brcm,bcm2835-system-timer.txt
> >
> >$ find Documentation/devicetree/bindings -name '*.txt' | grep -v ','| wc -l
> >1227
> >$ find Documentation/devicetree/bindings -name '*.txt' | grep ','| wc -l
> >352
> >
> >So, what's the standard? Company prefix? Long name? Commas? Hyphens?
> 
> The problem with devicetree binding is there is no standard for much
> of anything.  Some others use the vendor prefix for all their
> binding documentation.  We can try to do the same?

Ok, but we already have 3 versions for Broadcom. I can use 'brcm,' if
that helps...

Brian
