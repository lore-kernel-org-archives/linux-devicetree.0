Return-Path: <SRS0=dbRL=LU=wavecomp.com=pburton@kernel.org>
Date: Thu, 6 Sep 2018 14:49:55 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v5 08/12] MIPS: BMIPS: add PCI bindings for 7425, 7435
Message-ID: <20180906214955.2yzyj6tkmflnnvdx@pburton-laptop>
References: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
 <1536266581-7308-9-git-send-email-jim2101024@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536266581-7308-9-git-send-email-jim2101024@gmail.com>
To: Jim Quinlan <jim2101024@gmail.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Russell King <linux@armlinux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Kees Cook <keescook@chromium.org>, Jinbum Park <jinb.park7@gmail.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Palmer Dabbelt <palmer@sifive.com>, Stefan Agner <stefan@agner.ch>, Eric Anholt <eric@anholt.net>, Simon Horman <horms+renesas@verge.net.au>, Tony Lindgren <tony@atomide.com>, Stefan Wahren <stefan.wahren@i2se.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Olof Johansson <olof@lixom.net>, Thomas Hellstrom <thellstrom@vmware.com>, Alex Deucher <alexander.deucher@amd.com>, "Dirk Hohndel (VMware)" <dirk@hohndel.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, Justin Chen <justinpopo6@gmail.com>, Markus Mayer <markus.mayer@broadcom.com>, Gareth Powell <gpowell@broadcom.com>, Doug Berger <opendmb@gmail.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Christoph Hellwig <hch@lst.de>
List-ID: <devicetree@vger.kernel.org>

Hi Jim,

On Thu, Sep 06, 2018 at 04:42:57PM -0400, Jim Quinlan wrote:
> Adds the PCIe nodes for the Broadcom STB PCIe root complex.
> 
> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> ---
>  arch/mips/boot/dts/brcm/bcm7425.dtsi     | 28 ++++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7435.dtsi     | 28 ++++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm97425svmb.dts |  4 ++++
>  arch/mips/boot/dts/brcm/bcm97435svmb.dts |  4 ++++
>  4 files changed, 64 insertions(+)

Do you have a preference for how this gets merged? If it goes via the
PCI tree then for patches 8 & 9:

    Acked-by: Paul Burton <paul.burton@mips.com>

Still looking at patch 6.

Thanks,
    Paul
