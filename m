From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Question] directory for SoC-related DT binding
Date: Thu, 11 Oct 2018 00:01:45 +0900
Message-ID: <CAK7LNASEEJw6Yp9HzSoEOwM4iKC=EEjTefE=VLv-wdNstsMriw@mail.gmail.com>
References: <CAK7LNATaD=G8BW316fkBWM2A+YXgP5tabaySR2Fs49Za_0p=3Q@mail.gmail.com>
 <20181010120751.GP30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010120751.GP30658@n2100.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2018 at 9:09 PM Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
>
> On Wed, Oct 10, 2018 at 08:07:52PM +0900, Masahiro Yamada wrote:
> > Hi,
> >
> >
> > I see a bunch of vendor (or SoC) names in
> > Documentation/device/bindings/arm/
> >
> > ./Documentation/devicetree/bindings/arm/altera
> > ./Documentation/devicetree/bindings/arm/amlogic
> > ./Documentation/devicetree/bindings/arm/apm
> > ./Documentation/devicetree/bindings/arm/bcm
> > ./Documentation/devicetree/bindings/arm/calxeda
> > ./Documentation/devicetree/bindings/arm/freescale
> > ./Documentation/devicetree/bindings/arm/hisilicon
> > ./Documentation/devicetree/bindings/arm/keystone
> > ./Documentation/devicetree/bindings/arm/marvell
> > ./Documentation/devicetree/bindings/arm/mediatek
> > ./Documentation/devicetree/bindings/arm/mrvl
> > ./Documentation/devicetree/bindings/arm/msm
> > ./Documentation/devicetree/bindings/arm/npcm
> > ./Documentation/devicetree/bindings/arm/nxp
> > ./Documentation/devicetree/bindings/arm/omap
> > ./Documentation/devicetree/bindings/arm/rockchip
> > ./Documentation/devicetree/bindings/arm/samsung
> > ./Documentation/devicetree/bindings/arm/stm32
> > ./Documentation/devicetree/bindings/arm/sunxi
> > ./Documentation/devicetree/bindings/arm/tegra
> > ./Documentation/devicetree/bindings/arm/ti
> > ./Documentation/devicetree/bindings/arm/uniphier
> > ./Documentation/devicetree/bindings/arm/ux500
> > ./Documentation/devicetree/bindings/arm/vt8500
>
> These are for arch/arm/mach-* and are the DT root descriptions for the
> various boards and SoCs.
>
> > I also see some vendor names in
> > Documentation/device/bindings/soc/
> >
> > ./Documentation/devicetree/bindings/soc/bcm
> > ./Documentation/devicetree/bindings/soc/dove
> > ./Documentation/devicetree/bindings/soc/fsl
> > ./Documentation/devicetree/bindings/soc/mediatek
> > ./Documentation/devicetree/bindings/soc/qcom
> > ./Documentation/devicetree/bindings/soc/rockchip
> > ./Documentation/devicetree/bindings/soc/ti
> > ./Documentation/devicetree/bindings/soc/xilinx
> > ./Documentation/devicetree/bindings/soc/zte
>
> These are for individual drivers in drivers/soc/

I see.

Thanks for helpful info!


-- 
Best Regards
Masahiro Yamada
