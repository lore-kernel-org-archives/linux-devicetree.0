From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 7/9] ARM: bcm2835: Add devicetree for the Raspberry
 Pi 3.
Date: Mon, 06 Jun 2016 09:47:25 +0200
Message-ID: <1465199245.24775.195.camel@redhat.com>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com>
	 <CAL_JsqL2RgTLq9R3v4LDiV6Wa7totbzJBgmzVDgUv_keoS52vA@mail.gmail.com>
	 <1465197612.24775.190.camel@redhat.com> <3265668.gGTUMSyXWi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3265668.gGTUMSyXWi@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

  Hi,

> > With the 2/7 patch at the start of this subthread the dtb ends up in
> > arch/arm64/boot/dts/broadcom for both arm and arm64 builds.
> > 
> > make "dtbs_install" places it in /boot/dtbs/$version/ for arm builds and
> > in /boot/dtbs/$version/broadcom/ for arm64 builds.
> 
> Ok, let's stay with that for now then, and solve it better when we
> need to do more of the same. Are you aware of any other boards using
> bcm2837?

No.

As far I know it has been created specifically for the rpi foundation,
so I expect we might see new members of the rpi family using the bcm2837
too, but probably no other devices.

Maybe Eric Anholt knows more details.

cheers,
  Gerd
