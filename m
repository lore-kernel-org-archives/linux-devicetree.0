From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/8] ARM: dts: bcm283x: Add a new EMMC pin group from
 the downstream tree.
Date: Thu, 08 Sep 2016 09:44:47 +0200
Message-ID: <1473320687.6698.25.camel@redhat.com>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
         <1473244289-20728-5-git-send-email-kraxel@redhat.com>
         <87650770.23554.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87650770.23554.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mi, 2016-09-07 at 20:13 +0200, Stefan Wahren wrote:
> > Gerd Hoffmann <kraxel@redhat.com> hat am 7. September 2016 um 12:31
> > geschrieben:
> > 
> > 
> > From: Eric Anholt <eric@anholt.net>
> > 
> > This will be used for having EMMC (sdhci-bcm2835.c) drive the
> > wireless.
> 
> sdhci-bcm2835.c has been replaced by sdhci-iproc.c

Ah, right, I'll update the commit msg for v2.

> How about adding pull defines to include/dt-bindings/pinctrl/bcm2835.h?

Already there (or do you mean something other than '#define
BCM2835_FSEL_*' ?)

cheers,
  Gerd
