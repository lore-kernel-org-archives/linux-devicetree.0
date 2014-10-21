From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5 1/6] ARM: cygnus: Initial support for Broadcom Cygnus SoC
Date: Tue, 21 Oct 2014 07:48:37 +0200
Message-ID: <38587325.kaAxCWAsmL@wuerfel>
References: <1413341936-17606-2-git-send-email-sbranden@broadcom.com> <4779079.vI0gT0iWvg@wuerfel> <544593E1.90608@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544593E1.90608-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 20 October 2014 15:59:45 Scott Branden wrote:
> On 14-10-20 12:55 PM, Arnd Bergmann wrote:
> > On Tuesday 14 October 2014 19:58:51 Scott Branden wrote:
> >>   if ARCH_BCM
> >>
> >> +menu "iProc SoC based Machine types"
> >> +       config ARCH_BCM_IPROC
> >> +               bool
> >> +               select ARM_GIC
> >> +               select CACHE_L2X0
> >> +               select HAVE_ARM_SCU if SMP
> >> +               select HAVE_ARM_TWD if SMP
> >> +               select ARM_GLOBAL_TIMER
> >> +
> >> +               select CLKSRC_MMIO
> >> +               select ARCH_REQUIRE_GPIOLIB
> >> +               select ARM_AMBA
> >> +               select PINCTRL
> >> +               help
> >> +                 This enables support for systems based on Broadcom IPROC architected SoCs.
> >> +                 The IPROC complex contains one or more ARM CPUs along with common
> >> +                 core periperals. Application specific SoCs are created by adding a
> >> +                 uArchitecture containing peripherals outside of the IPROC complex.
> >> +                 Currently supported SoCs are Cygnus.
> >> +
> >> +       config ARCH_BCM_CYGNUS
> >> +               bool "Broadcom Cygnus Support" if ARCH_MULTI_V7
> >
> > You still have a three-level menu structure. Please fix.
> 
> Hi Arnd, we have ARCH_BCM->ARCH_BCM_CYGNUS.
> 
> ARCH_BCM_IPROC is silent and selected by ARCH_BCM_CYGNUS.  This was the 
> change made between v3 and v5.
> 
> Is there something else to be done here?
> 

You have

	"Broadcom SoC Support" 
		"iProc SoC based Machine types"
			 "Broadcom Cygnus Support"

Get rid of one of them.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
