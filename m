From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [Question] directory for SoC-related DT binding
Date: Wed, 10 Oct 2018 13:07:51 +0100
Message-ID: <20181010120751.GP30658@n2100.armlinux.org.uk>
References: <CAK7LNATaD=G8BW316fkBWM2A+YXgP5tabaySR2Fs49Za_0p=3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNATaD=G8BW316fkBWM2A+YXgP5tabaySR2Fs49Za_0p=3Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2018 at 08:07:52PM +0900, Masahiro Yamada wrote:
> Hi,
> 
> 
> I see a bunch of vendor (or SoC) names in
> Documentation/device/bindings/arm/
> 
> ./Documentation/devicetree/bindings/arm/altera
> ./Documentation/devicetree/bindings/arm/amlogic
> ./Documentation/devicetree/bindings/arm/apm
> ./Documentation/devicetree/bindings/arm/bcm
> ./Documentation/devicetree/bindings/arm/calxeda
> ./Documentation/devicetree/bindings/arm/freescale
> ./Documentation/devicetree/bindings/arm/hisilicon
> ./Documentation/devicetree/bindings/arm/keystone
> ./Documentation/devicetree/bindings/arm/marvell
> ./Documentation/devicetree/bindings/arm/mediatek
> ./Documentation/devicetree/bindings/arm/mrvl
> ./Documentation/devicetree/bindings/arm/msm
> ./Documentation/devicetree/bindings/arm/npcm
> ./Documentation/devicetree/bindings/arm/nxp
> ./Documentation/devicetree/bindings/arm/omap
> ./Documentation/devicetree/bindings/arm/rockchip
> ./Documentation/devicetree/bindings/arm/samsung
> ./Documentation/devicetree/bindings/arm/stm32
> ./Documentation/devicetree/bindings/arm/sunxi
> ./Documentation/devicetree/bindings/arm/tegra
> ./Documentation/devicetree/bindings/arm/ti
> ./Documentation/devicetree/bindings/arm/uniphier
> ./Documentation/devicetree/bindings/arm/ux500
> ./Documentation/devicetree/bindings/arm/vt8500

These are for arch/arm/mach-* and are the DT root descriptions for the
various boards and SoCs.

> I also see some vendor names in
> Documentation/device/bindings/soc/
> 
> ./Documentation/devicetree/bindings/soc/bcm
> ./Documentation/devicetree/bindings/soc/dove
> ./Documentation/devicetree/bindings/soc/fsl
> ./Documentation/devicetree/bindings/soc/mediatek
> ./Documentation/devicetree/bindings/soc/qcom
> ./Documentation/devicetree/bindings/soc/rockchip
> ./Documentation/devicetree/bindings/soc/ti
> ./Documentation/devicetree/bindings/soc/xilinx
> ./Documentation/devicetree/bindings/soc/zte

These are for individual drivers in drivers/soc/

> Confusingly, I see bcm, mediatek, rockchip
> in both locations.

Correct, because one is for the SoC and board as a whole, the other is
for some subset of the SoC handled via drivers/soc - for example, with
Broadcom, there's a Raspberry PI power domain driver in drivers/soc,
which is described by

 Documentation/devicetree/bindings/soc/bcm/raspberrypi,bcm2835-power.txt

whereas

 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt

describes the bindings for the root DT node BCM2835 as used on the
Raspberry Pi amongst other boards.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
