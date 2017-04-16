From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v4 00/10] Add Basic SoC support for MT6797
Date: Sun, 16 Apr 2017 11:42:30 +0800
Message-ID: <1492314150.19878.2.camel@mtkswgap22>
References: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Kevin-CW Chen <kevin-cw.chen@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Stephen, Matthias

gentle ping. :-)

Thanks.

On Sat, 2017-04-08 at 09:20 +0800, Mars Cheng wrote:
> This patch set adds basic SoC support for mediatek's first 10-core
> chip, X20, also known as MT6797.
> 
> - based on 4.11-rc1
> - support common clk framework
> - apply patches about intpol just accepted to get full feature support:
> http://lists.infradead.org/pipermail/linux-mediatek/2017-March/008371.html
> http://lists.infradead.org/pipermail/linux-mediatek/2017-March/008375.html
> http://lists.infradead.org/pipermail/linux-mediatek/2017-March/008373.html
> 
> Changes since v3:
> - since intpol patches accepted in v3, remove them
> - clk ID header separated from original clk driver submit
> - clean up clk driver, including unnecessary header and fields in structure
> 
> Changes since v2:
> - prevent uncessary #intpol-bases for mtk-sysirq
> - add fast path for mtk-sysirq set_type when introducing multiple bases
> - add acked-by and tested-by
> - remove wrong usage for timer node
> 
> Changes since v1:
> - add multiple base addresses support, v1 only allow 2 bases
> - clean up clk driver
> 
> Kevin-CW Chen (2):
>   dt-bindings: arm: mediatek: document clk bindings for MT6797
>   clk: mediatek: add clk support for MT6797
> 
> Mars Cheng (8):
>   dt-bindings: mediatek: Add bindings for mediatek MT6797 Platform
>   arm64: dts: mediatek: add mt6797 support
>   clk: mediatek: add mt6797 clock IDs
>   soc: mediatek: avoid using fixed spm power status defines
>   soc: mediatek: add vdec item for scpsys
>   dt-bindings: mediatek: add MT6797 power dt-bindings
>   soc: mediatek: add MT6797 scpsys support
>   arm64: dts: mediatek: add clk and scp nodes for MT6797
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
>  .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    1 +
>  .../bindings/arm/mediatek/mediatek,imgsys.txt      |    1 +
>  .../bindings/arm/mediatek/mediatek,infracfg.txt    |    1 +
>  .../bindings/arm/mediatek/mediatek,mmsys.txt       |    1 +
>  .../bindings/arm/mediatek/mediatek,topckgen.txt    |    1 +
>  .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    1 +
>  .../bindings/arm/mediatek/mediatek,vencsys.txt     |    3 +-
>  .../interrupt-controller/mediatek,sysirq.txt       |    1 +
>  .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    |    6 +-
>  arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>  arch/arm64/boot/dts/mediatek/mt6797-evb.dts        |   36 +
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi           |  245 +++++++
>  drivers/clk/mediatek/Kconfig                       |   32 +
>  drivers/clk/mediatek/Makefile                      |    5 +
>  drivers/clk/mediatek/clk-mt6797-img.c              |   76 +++
>  drivers/clk/mediatek/clk-mt6797-mm.c               |  136 ++++
>  drivers/clk/mediatek/clk-mt6797-vdec.c             |   93 +++
>  drivers/clk/mediatek/clk-mt6797-venc.c             |   78 +++
>  drivers/clk/mediatek/clk-mt6797.c                  |  714 ++++++++++++++++++++
>  drivers/soc/mediatek/mtk-scpsys.c                  |  149 +++-
>  include/dt-bindings/clock/mt6797-clk.h             |  281 ++++++++
>  include/dt-bindings/power/mt6797-power.h           |   30 +
>  24 files changed, 1889 insertions(+), 8 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797.dtsi
>  create mode 100644 drivers/clk/mediatek/clk-mt6797-img.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6797-mm.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6797-vdec.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6797-venc.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6797.c
>  create mode 100644 include/dt-bindings/clock/mt6797-clk.h
>  create mode 100644 include/dt-bindings/power/mt6797-power.h
> 
> --
> 1.7.9.5


