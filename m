From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 7/9] ARM: bcm2835: Add devicetree for the Raspberry Pi 3.
Date: Fri, 3 Jun 2016 11:17:51 -0500
Message-ID: <CAL_JsqL2RgTLq9R3v4LDiV6Wa7totbzJBgmzVDgUv_keoS52vA@mail.gmail.com>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com>
 <5490184.9quKRk1Imx@wuerfel> <1464943546.24775.131.camel@redhat.com>
 <3885625.kWfxlR3OJi@wuerfel> <1464950355.24775.143.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464950355.24775.143.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 3, 2016 at 5:39 AM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>   Hi,
>
>> I tried
>>
>> subdir-y += ../../../arm64/boot/dts/broadcom
>
> Hmm, works for me too now, probably had a typo somewhere.

What directory does the dtb end up in? Because as it was, it ended up
in arch/arm64/boot/dts/broadcom. I'm not sure all this hackery is
worth it if the dtb doesn't end up in arch/arm/boot/dts/.

> But it works for "make dtbs" only, "make dtbs_install" ignores it.

That will be fun for users to debug...

Rob
