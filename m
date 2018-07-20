From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 0/2] Add Mediatek X20 Development Board support
Date: Fri, 20 Jul 2018 17:47:54 +0200
Message-ID: <e0e5575f-345f-47a7-0d37-489fa23d1562@gmail.com>
References: <1531997690-6040-1-git-send-email-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531997690-6040-1-git-send-email-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, taiten.peng@linaro.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, manivannanece23@gmail.com
List-Id: devicetree@vger.kernel.org



On 19/07/18 12:54, Manivannan Sadhasivam wrote:
> Add devicetree support for Mediatek X20 Development Board by Archermind.
> This board is based on the Deca-Core MT6797 SoC from Mediatek and is
> one of the 96Boards Consumer Edition platform.
> 
> With this devicetree change, board can boot into initramfs.
> 
> More information about this board can be found in 96Boards product page:
> https://www.96boards.org/product/mediatek-x20/
> 

Pushed both to v4.18-next/dts64

Thanks a lot!
Matthias

> Thanks,
> Mani
> 
> Changes in v3:
> 
> * Modified the memory size to 2GB (0x80000000) in board DTS
> 
> Changes in v2:
> 
> * Added documentation for board compatible
> * Dropped vendor documetation patch since it got applied
> 
> Manivannan Sadhasivam (2):
>   dt-bindings: arm: mediatek: Document Mediatek X20 Development Board
>   arm64: dts: Add Mediatek X20 Development Board support
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |  3 ++
>  arch/arm64/boot/dts/mediatek/Makefile              |  1 +
>  arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts    | 33 ++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
> 
