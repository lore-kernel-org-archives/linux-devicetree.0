From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [SPAM][PATCH v2 0/4] Add MediaTek MUSB Controller Driver
Date: Tue, 15 Jan 2019 13:18:44 +0800
Message-ID: <1547529524.13961.2.camel@mtkswgap22>
References: <1547516626-5084-1-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547516626-5084-1-git-send-email-min.guo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: min.guo@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-01-15 at 09:43 +0800, min.guo@mediatek.com wrote:
> From: Min Guo <min.guo@mediatek.com>
> 
> These patches introduce the MediaTek MUSB controller driver.
> 
> The driver can be configured as Dual-Role Device (DRD),
> Peripheral Only and Host Only modes. This has beed tested on
> MT2701 with a variety of devices in host mode and with the 
> f_mass gadget driver in peripheral mode, plugging otg cables
> in/out a lot of times in all possible imaginable plug orders.
> 
> changes in v2:
> changes of dt-bindings suggested by Rob and Bin:
> 1. Modify DRC to DRD
> 2. Drop the "<soc-model>-musb" in compatible
> 3. Remove phy-names
> 4. Add space after comma in clock-names
> dtsi:
> 1. Remove phy-names
> changes of driver suggested by Bin:
> 1. Add a new patch for musb_set_toggle
> 2. Add summarize of MediaTek musb controller differences in the commit log
> 3. Abondon patch "usb: musb: Move musbhsdma macro definition to musb_dma.h"
> 4. Add "|| COMPILE_TEST" in Kconfig
> 5. Add musb_clearb() and musb_clearw() hooks
> 6. Add get_toggle() and set_toggle() hooks
> 7. Replace musb_readl() with musb_readw() to read 16bit toggle register
> 8. Move MediaTek's private toggle registers from musb_regs.h to mediatek.c
> 9. Create musbhs_dma_controller_create_noirq()
> 
> Min Guo (4):
>   dt-bindings: usb: musb: Add support for MediaTek musb controller
>   arm: dts: mt2701: Add usb2 device nodes
>   usb: musb: Extract set toggle as a separate interface
>   usb: musb: Add support for MediaTek musb controller
> 
>  .../devicetree/bindings/usb/mediatek,musb.txt      |  43 ++
>  arch/arm/boot/dts/mt2701-evb.dts                   |  21 +
>  arch/arm/boot/dts/mt2701.dtsi                      |  33 ++
>  drivers/usb/musb/Kconfig                           |   8 +-
>  drivers/usb/musb/Makefile                          |   1 +
>  drivers/usb/musb/mediatek.c                        | 617 +++++++++++++++++++++
>  drivers/usb/musb/musb_core.c                       |  69 +++
>  drivers/usb/musb/musb_core.h                       |   9 +
>  drivers/usb/musb/musb_dma.h                        |   9 +
>  drivers/usb/musb/musb_host.c                       |  35 +-
>  drivers/usb/musb/musb_io.h                         |   6 +
>  drivers/usb/musb/musbhsdma.c                       |  55 +-
>  12 files changed, 868 insertions(+), 38 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
>  create mode 100644 drivers/usb/musb/mediatek.c
> 

I tried the series on my mt7623

Tested-by: Ryder Lee <ryder.lee@mediatek.com>
