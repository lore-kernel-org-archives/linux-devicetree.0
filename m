From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4 0/5] add some properties for Rockchip usb2-phy and add
 rv1108 SoCs' support
Date: Fri, 18 Aug 2017 16:27:54 +0530
Message-ID: <e0777596-cd2e-aef5-56a4-6caa18df3aac@ti.com>
References: <1502438871-9482-1-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1502438871-9482-1-git-send-email-frank.wang@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Wang <frank.wang@rock-chips.com>, heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org, wmc@rock-chips.com, linux-kernel@vger.kernel.org, kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org, william.wu@rock-chips.com, andy.yan@rock-chips.com, daniel.meng@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Friday 11 August 2017 01:37 PM, Frank Wang wrote:
> These series of patches add rockchip,usbgrf property and otg_mux interrupt for
> rockchip usb2-phy. In addition, this change also add rv1108 usb2-phy support.

merged, thanks!

-Kishon
> 
> Changes from v3:
>  - Updated the 'Acked-by' tag from Rob Herring <robh@kernel.org>.
>  - Matched the SoC specific compatible string instead of companion_grf_quirk.
> 
> Changes from v2:
>  - Amend otg-mux interrupt to be auto-detectable and update related dt-bindings.
> 
> Changes from v1:
>  - Send the dt-bindings as a separate patch and cc devicetree list.
> 
> Frank Wang (5):
>   phy: rockchip-inno-usb2: add support for rockchip,usbgrf property
>   dt-bindings: phy-rockchip-inno-usb2: add rockchip,usbgrf property
>   phy: rockchip-inno-usb2: add support for otg-mux interrupt
>   dt-bindings: phy-rockchip-inno-usb2: add otg-mux interrupt
>   phy: rockchip-inno-usb2: add support of usb2-phy for rv1108 SoCs
> 
>  .../bindings/phy/phy-rockchip-inno-usb2.txt        |  11 +-
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 215 ++++++++++++++++-----
>  2 files changed, 174 insertions(+), 52 deletions(-)
> 
