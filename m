From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 0/8] add dts nodes to MT2712 SoC
Date: Wed, 9 Jan 2019 18:20:47 +0100
Message-ID: <98d0fefa-6331-da37-414e-3639ff4df97c@gmail.com>
References: <1543836962-18293-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543836962-18293-1-git-send-email-yt.shen@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YT Shen <yt.shen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 03/12/2018 12:35, YT Shen wrote:
> This patch series based on v4.20-rc1, include MT2712 usb/iommu/smi/i2c/spi/pwm/mmc/nand/pcie device nodes
> 
> Chunfeng Yun (1):
>   arm64: dts: Add USB3 related nodes for MT2712
> 
> Honghui Zhang (1):
>   arm64: dts: add pcie nodes for MT2712
> 
> YT Shen (6):
>   arm64: dts: add iommu/smi nodes for MT2712
>   arm64: dts: add i2c nodes for MT2712
>   arm64: dts: add spi nodes for MT2712
>   arm64: dts: add pwm nodes for MT2712
>   arm64: dts: add mmc nodes for MT2712
>   arm64: dts: add nand nodes for MT2712
> 

All pushed to v5.0-next/dts64

Thanks,
Matthias

>  arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  98 +++++
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 555 ++++++++++++++++++++++++++++
>  2 files changed, 653 insertions(+)
> 
