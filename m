From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] Documentation: bindings: add DT documentation for
 Rockchip USB2PHY
Date: Wed, 8 Jun 2016 15:04:19 -0500
Message-ID: <20160608200419.GA12468@rob-hp-laptop>
References: <1465290954-15852-1-git-send-email-frank.wang@rock-chips.com>
 <1465290954-15852-2-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465290954-15852-2-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: heiko@sntech.de, dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 05:15:53PM +0800, Frank Wang wrote:
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> ---
> 
> Changes in v4:
>  - Used 'phy-supply' instead of 'vbus_*-supply'.
> 
> Changes in v3:
>  - Added 'clocks' and 'clock-names' optional properties.
>  - Specified 'otg-port' and 'host-port' as the sub-node name.
> 
> Changes in v2:
>  - Changed vbus_host optional property from gpio to regulator.
>  - Specified vbus_otg-supply optional property.
>  - Specified otg_id and otg_bvalid property.
> 
>  .../bindings/phy/phy-rockchip-inno-usb2.txt        |   62 ++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt

Acked-by: Rob Herring <robh@kernel.org>
