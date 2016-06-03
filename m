From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 7/9] ARM: bcm2835: Add devicetree for the Raspberry Pi 3.
Date: Fri, 03 Jun 2016 13:15:14 +0200
Message-ID: <5180618.AQqBrtra9C@wuerfel>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com> <3885625.kWfxlR3OJi@wuerfel> <1464950355.24775.143.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464950355.24775.143.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Scott Branden <sbranden@broadcom.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Friday, June 3, 2016 12:39:15 PM CEST Gerd Hoffmann wrote:
>   Hi,
> 
> > I tried
> > 
> > subdir-y += ../../../arm64/boot/dts/broadcom
> 
> Hmm, works for me too now, probably had a typo somewhere.
> 
> But it works for "make dtbs" only, "make dtbs_install" ignores it.

Right: this is no good ;-)

make -f /git/arm-soc/scripts/Makefile.dtbinst obj=arch/arm/boot/dts/../../../arm64/boot/dts/broadcom
  mkdir -p /tmp/boot//dtbs/4.7.0-rc1-00345-gd2a060ee0c24-dirty/../../../arm64/boot/dts/broadcom; cp arch/arm/boot/dts/../../../arm64/boot/dts/broadcom/ns2-svk.dtb /tmp/boot//dtbs/4.7.0-rc1-00345-gd2a060ee0c24-dirty/../../../arm64/boot/dts/broadcom

Maybe we can have a symlink there? I've tried that without success too,
but it shouldn't be that hard to get right.

	Arnd
