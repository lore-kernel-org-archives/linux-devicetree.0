From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 0/2] Add Mediatek X20 Development Board support
Date: Tue, 29 May 2018 08:38:27 +0200
Message-ID: <06dbc5ef-5bba-f3e0-1b57-3eaeab26ed68@gmail.com>
References: <20180529045258.1415-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529045258.1415-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, taiten.peng@linaro.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, manivannanece23@gmail.com, Mars Cheng <mars.cheng@mediatek.com>, Saber Rezvani <irsaber@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

it's nice to see that someone at Linaro cares about upstreaming the 96 board.
>From what I can see, your patches add the very same support to the board as
does the mt6797 evaluation board. Do you have plans to upstream more drivers for
the board? Do you have a roadmap or something?

I'm asking becuase I don't want to have just another dead devicetree in the
kernel which does nothing but provides a boot to rootfs. Especially as this can
be achieved on the same board with the EVB dts.

Regards,
Matthias

On 29/05/18 06:52, Manivannan Sadhasivam wrote:
> Add devicetree support for Mediatek X20 Development Board by Archermind.
> This board is based on the Deca-Core MT6797 SoC from Mediatek and is
> one of the 96Boards Consumer Edition platform.
> 
> With this devicetree change, board can boot into initramfs.
> 
> More information about this board can be found in 96Boards product page:
> https://www.96boards.org/product/mediatek-x20/
> 
> Manivannan Sadhasivam (2):
>   dt-bindings: Add vendor prefix for ArcherMind
>   arm64: dts: Add Mediatek X20 Development Board support
> 
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>  .../boot/dts/mediatek/mt6797-x20-dev.dts      | 33 +++++++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
> 
