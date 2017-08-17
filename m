From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: phy-rockchip-inno-usb2: add
 rockchip,usbgrf property
Date: Thu, 17 Aug 2017 10:28:56 -0500
Message-ID: <20170817152856.hg27hbmfxgatyzve@rob-hp-laptop>
References: <1502438871-9482-1-git-send-email-frank.wang@rock-chips.com>
 <1502438871-9482-3-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502438871-9482-3-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: heiko@sntech.de, kishon@ti.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, kever.yang@rock-chips.com, andy.yan@rock-chips.com, wmc@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 11, 2017 at 04:07:48PM +0800, Frank Wang wrote:
> Add rockchip,usbgrf property to support the registers of usb-phy
> that are distributed in grf and usbgrf on some special Rockchip
> SoCs (e.g RV1108).
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
