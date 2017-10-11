From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH v3 00/10] update MT7623 and MT2701 dts
Date: Wed, 11 Oct 2017 17:02:31 +0800
Message-ID: <1507712551.13764.7.camel@mtkswgap22>
References: <cover.1506908511.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506908511.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Erin Lo <erin.lo@mediatek.com>, YT Shen <yt.shen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

How does this series look to you?


On Mon, 2017-10-02 at 09:54 +0800, Ryder Lee wrote:
> Hi Matthias,
> 
> This patch series adds/corrects some device nodes for both MT7623 and MT2701.
> 
> changes since v3:
> - revert PIO register space.
> 
> changes since v2:
> - move non-common part and non-display related nodes to different patches.
> - remove unused wdma node.
> - add display related nodes for MT2701.
> 
> changes since v1:
> - rebase to v4.14.
> - sort nodes in alphabetical order
> 
> Ryder Lee (7):
>   arm: dts: mediatek: update audio node for mt2701 and mt7623
>   arm: dts: mt7623: update pio, usb and crypto nodes
>   arm: dts: mt7623: add subsystem clock controller nodes
>   arm: dts: mt7623: add iommu and jpecdec nodes
>   arm: dts: mt7623: add display subsystem related nodes
>   arm: dts: mt7623: enable bananapi-r2 display function
>   arm: dts: mt7623: add PCIe related nodes
> 
> Weiqing Kong (2):
>   arm: dts: mt2701: add pwm backlight device node
>   arm: dts: mt2701: enable display pwm backlight
> 
> YT Shen (1):
>   arm: dts: mt2701: add display subsystem related nodes
> 
>  arch/arm/boot/dts/mt2701-evb.dts              |  23 ++
>  arch/arm/boot/dts/mt2701.dtsi                 |  88 ++++++-
>  arch/arm/boot/dts/mt7623.dtsi                 | 338 +++++++++++++++++++++++++-
>  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  71 +++++-
>  include/dt-bindings/pinctrl/mt7623-pinfunc.h  |  12 +
>  5 files changed, 516 insertions(+), 16 deletions(-)
> 
