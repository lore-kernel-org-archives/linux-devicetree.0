Return-Path: <SRS0=S2P+=H6=gmail.com=matthias.bgg@kernel.org>
Subject: Re: [PATCH 0/2] Add basic support for Mediatek MT8183 SoC
References: <1526019083-20237-1-git-send-email-erin.lo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <782e13c1-057b-164b-9270-d37c151aa9b4@gmail.com>
Date: Fri, 11 May 2018 10:29:41 +0200
MIME-Version: 1.0
In-Reply-To: <1526019083-20237-1-git-send-email-erin.lo@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Erin Lo <erin.lo@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Hi Erin,

Please include the linux-mediatek and arm-linux-kernel mailinglists in the next
round.

Some comments in the patches.

Regards,
Matthias

On 05/11/2018 08:11 AM, Erin Lo wrote:
> MT8183 is a SoC based on 64bit ARMv8 architecture.
> It contains 4 CA53 and 4 CA73 cores.
> MT8183 share many HW IP with MT65xx series.
> This patchset was tested on MT8183 evaluation board, and boot to shell ok.
> 
> This series contains document bindings, device tree including interrupt, uart.
> 
> Ben Ho (1):
>   arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and
>     Makefile
> 
> Erin Lo (1):
>   dt-bindings: arm: Add bindings for Mediatek MT8183 SoC Platform
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
>  .../interrupt-controller/mediatek,sysirq.txt       |   1 +
>  .../devicetree/bindings/serial/mtk-uart.txt        |   1 +
>  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  31 ++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 178 +++++++++++++++++++++
>  6 files changed, 216 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183.dtsi
> 
> --
> 1.9.1
> 
