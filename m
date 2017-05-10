From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/30] arm: dts: extend mt7623 support
Date: Wed, 10 May 2017 11:58:39 +0200
Message-ID: <dbaa57bc-f8cf-c7bb-bafd-505a87b5702b@gmail.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

I queued patch 03/30 to 23/30 of this series in v4.11-next/dts32
Please resend the rest taking into account the comment from Rob.

Thanks and sorry for the delay.
Matthias

On 26/04/17 11:25, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Changes since v1:
> Continue the upstream journey based on the previous John Crispin's good work.
> - add fixes for the v1 suggestion
> - fix typo in the commit log
> - add missing pinctrl bindings for mt7623
> - reuse pinctrl driver for mt7623
> - enhance existing nodes since the way for binding is changed e.g USB
> - add more nodes which already gets support from the latest tree e.g MT7530 DSA
> - add the dts file for Bananapi R2 (BPI-R2) board
> 
> This series extends the dts files used for booting mt7623 base boards.
> Since support for mt7623 was added around v4.6, many new drivers have
> been accepted upstream. The contained patches add several of these to
> the devicetree.
> 
> Additionally the series does a bit of refactoring. Mediatek pointed out
> that the evaluation board is infact a reference design and asked the the
> evb files be renamed to rfb.
> 
> As with all of the current ARM bases MTK silicon, these boards also have
> a PMIC. Instead of adding the nodes to all of the dts files, we add an
> intermediate dtsi file that contains the required nodes. This allows us
> to reduce the size of the top most dts files.
> 
> The RFB comes in various versions and asiarf has even done a crowdfunder
> to sell them. We should try to reduce the duplication. This series adds
> a common dtsi file for these boards. This results in the topmost dts files
> only needing to specify the compatible string, MTD nodes and ethernet setup.
> 
> John Crispin (14):
>    arm: dts: mt7623: add clock controller device nodes
>    arm: dts: mt7623: add subsystem clock controller device nodes
>    arm: dts: mt7623: add power domain controller device node
>    arm: dts: mt7623: add clock-frequency to the a7 timer node to
>      mt7623.dtsi
>    arm: dts: mt7623: add pinctrl nodes to the mt7623 dtsi file
>    arm: dts: mt7623: add pmic wrapper nodes to the mt7623 dtsi file
>    arm: dts: mt7623: add i2c nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add nand nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add mmc nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add usb nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add mt7623-mt6323.dtsi file
>    arm: dts: mt7623: cleanup the mt7623n rfb uart nodes
>    arm: dts: mt7623: enable the usb device on the mt7623n rfb
>    arm: dts: mt7623: enable the nand device on the mt7623n nand rfb
> 
> Sean Wang (16):
>    pinctrl: mediatek: Add missing pinctrl bindings for mt7623
>    pinctrl: mediatek: reuse pinctrl driver for mt7623
>    arm: dts: mt7623: add spi nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add pwm nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add ethernet nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add crypto engine nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add ir nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add afe nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add rng nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add auxadc nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add thermal nodes to the mt7623.dtsi file
>    arm: dts: mt7623: add Sean as one of authors for mt7623.dtsi files
>    arm: dts: mt7623: rename mt7623-evb.dts to
>      arch/arm/boot/dts/mt7623n-rfb.dtsi
>    dt-bindings: add vendor prefix for bananapi
>    arm: dts: mt7623: add dts file for Bananapi R2 (BPI-R2) board
> 
>   Documentation/devicetree/bindings/arm/mediatek.txt |    8 +-
>   .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 -
>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>   arch/arm/boot/dts/Makefile                         |    3 +-
>   arch/arm/boot/dts/mt7623-evb.dts                   |   33 -
>   arch/arm/boot/dts/mt7623-mt6323.dtsi               |  269 +++
>   arch/arm/boot/dts/mt7623.dtsi                      |  556 +++++-
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      |  478 +++++
>   arch/arm/boot/dts/mt7623n-rfb-nand.dts             |  109 ++
>   arch/arm/boot/dts/mt7623n-rfb.dtsi                 |   61 +
>   arch/arm/mach-mediatek/mediatek.c                  |    4 +-
>   arch/arm/mach-mediatek/platsmp.c                   |    2 +-
>   drivers/pinctrl/mediatek/Kconfig                   |    9 +-
>   drivers/pinctrl/mediatek/Makefile                  |    1 -
>   drivers/pinctrl/mediatek/pinctrl-mt7623.c          |  379 ----
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h      | 1936 --------------------
>   include/dt-bindings/pinctrl/mt7623-pinfunc.h       |   30 +-
>   17 files changed, 1497 insertions(+), 2383 deletions(-)
>   delete mode 100644 arch/arm/boot/dts/mt7623-evb.dts
>   create mode 100644 arch/arm/boot/dts/mt7623-mt6323.dtsi
>   create mode 100644 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
>   create mode 100644 arch/arm/boot/dts/mt7623n-rfb-nand.dts
>   create mode 100644 arch/arm/boot/dts/mt7623n-rfb.dtsi
>   delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7623.c
>   delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
