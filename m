From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 0/7]  add support USB for MT8183
Date: Wed, 4 Sep 2019 09:54:27 +0800
Message-ID: <1567562067.7317.52.camel@mhfsdcap03>
References: <1567150854-30033-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567150854-30033-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Greg,


  Please don't try to pick up this series, the dependent ones are still
under public review, I'll fix build warning and send out new version
after the dependent ones are applied
  Sorry for inconvenience

Thanks

On Fri, 2019-08-30 at 15:40 +0800, Chunfeng Yun wrote:
> This series support USB DRD controller and enable it's remote
> wakeup functoin for MT8183, they depend on the following
> series patches:
> 
> 1. this series add support MT6358 PMIC
>   [v5,01/10] mfd: mt6397: clean up code
>   https://patchwork.kernel.org/patch/11110487/
> 
> 2. this series add support pericfg syscon
>   [v2,1/2] dt-bindings: clock: mediatek: add pericfg for MT8183
>   https://patchwork.kernel.org/patch/11118183/
> 
> 3. add property mediatek,discth for tphy
>   [06/11] phy: phy-mtk-tphy: add a property for disconnect threshold
>   https://patchwork.kernel.org/patch/11110695/
> 
> v3 changes:
>   1. changes micros define
>   2. remove #reset-cell
>   3. update dependent series
> 
> v2 changes:
>   add patch [7/7]
> 
> Chunfeng Yun (7):
>   dt-bindings: usb: mtu3: support USB wakeup for MT8183
>   dt-bindings: usb: mtk-xhci: support USB wakeup for MT8183
>   usb: mtu3: support ip-sleep wakeup for MT8183
>   usb: mtk-xhci: support ip-sleep wakeup for MT8183
>   arm64: dts: mt8183: add usb and phy nodes
>   arm64: dts: mt8183: enable USB remote wakeup
>   arm64: dts: mt8183: tune disconnect threshold of u2phy
> 
>  .../bindings/usb/mediatek,mtk-xhci.txt        |  1 +
>  .../devicetree/bindings/usb/mediatek,mtu3.txt |  1 +
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 23 +++++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 63 +++++++++++++++++++
>  drivers/usb/host/xhci-mtk.c                   | 14 ++++-
>  drivers/usb/mtu3/mtu3_host.c                  | 14 ++++-
>  6 files changed, 114 insertions(+), 2 deletions(-)
> 
