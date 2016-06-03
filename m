From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 7/9] ARM: bcm2835: Add devicetree for the Raspberry
 Pi 3.
Date: Fri, 03 Jun 2016 10:45:46 +0200
Message-ID: <1464943546.24775.131.camel@redhat.com>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com>
	 <1464934708-24769-8-git-send-email-kraxel@redhat.com>
	 <5490184.9quKRk1Imx@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5490184.9quKRk1Imx@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fr, 2016-06-03 at 09:38 +0200, Arnd Bergmann wrote:
> On Friday, June 3, 2016 8:18:26 AM CEST Gerd Hoffmann wrote:
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 06b6c2d..71e2d36 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -66,7 +66,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
> >         bcm2835-rpi-b-rev2.dtb \
> >         bcm2835-rpi-b-plus.dtb \
> >         bcm2835-rpi-a-plus.dtb \
> > -       bcm2836-rpi-2-b.dtb
> > +       bcm2836-rpi-2-b.dtb \
> > +       ../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb
> >  dtb-$(CONFIG_ARCH_BCM_5301X) += \
> >         bcm4708-asus-rt-ac56u.dtb \
> >         bcm4708-asus-rt-ac68u.dtb \
> 
> Let's make this hunk a separate patch so we can discuss it on its
> own.

Hmm, I through we where in agreement to do it this way ...

> I'm not really happy about the way it looks (in general, using ../../../
> anywhere in the kernel looks hacky.
> 
> How about a separate
> 
> dtb-$(CONFIG_ARCH_BCM2835) +=
> 	../../../arm64/boot/dts/broadcom/

Not working.

Tried "subdir-$(CONFIG_ARCH_BCM) += ...".  Didn't work either.
Same for "dts-dirs += ...".

Running out of ideas.  Guess I have to leave this to someone who knows
kbuild better than me.

cheers,
  Gerd
