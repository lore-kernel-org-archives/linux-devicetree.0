From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 7/9] ARM: bcm2835: Add devicetree for the Raspberry Pi
 3.
Date: Fri, 03 Jun 2016 10:55:17 +0200
Message-ID: <3885625.kWfxlR3OJi@wuerfel>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com>
 <5490184.9quKRk1Imx@wuerfel> <1464943546.24775.131.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1464943546.24775.131.camel@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Scott Branden <sbranden@broadcom.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday, June 3, 2016 10:45:46 AM CEST Gerd Hoffmann wrote:
> On Fr, 2016-06-03 at 09:38 +0200, Arnd Bergmann wrote:
> > On Friday, June 3, 2016 8:18:26 AM CEST Gerd Hoffmann wrote:
> > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > index 06b6c2d..71e2d36 100644
> > > --- a/arch/arm/boot/dts/Makefile
> > > +++ b/arch/arm/boot/dts/Makefile
> > > @@ -66,7 +66,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
> > >         bcm2835-rpi-b-rev2.dtb \
> > >         bcm2835-rpi-b-plus.dtb \
> > >         bcm2835-rpi-a-plus.dtb \
> > > -       bcm2836-rpi-2-b.dtb
> > > +       bcm2836-rpi-2-b.dtb \
> > > +       ../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb
> > >  dtb-$(CONFIG_ARCH_BCM_5301X) += \
> > >         bcm4708-asus-rt-ac56u.dtb \
> > >         bcm4708-asus-rt-ac68u.dtb \
> > 
> > Let's make this hunk a separate patch so we can discuss it on its
> > own.
> 
> Hmm, I through we where in agreement to do it this way ...

I think it's ok in principle, this is about the specific syntax.

> > I'm not really happy about the way it looks (in general, using ../../../
> > anywhere in the kernel looks hacky.
> > 
> > How about a separate
> > 
> > dtb-$(CONFIG_ARCH_BCM2835) +=
> >       ../../../arm64/boot/dts/broadcom/
> 
> Not working.
> 
> Tried "subdir-$(CONFIG_ARCH_BCM) += ...".  Didn't work either.
> Same for "dts-dirs += ...".
> 
> Running out of ideas.  Guess I have to leave this to someone who knows
> kbuild better than me.

I tried

subdir-y += ../../../arm64/boot/dts/broadcom

and it seemed to work fine, I got

  DTC     arch/arm/boot/dts/../../../arm64/boot/dts/broadcom/ns2-svk.dtb

in an allmodconfig build, which also includes CONFIG_ARCH_BCM_IPROC.

	Arnd
