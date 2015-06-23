From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/3] Documentation: dt-bindings: Add snps,need-phy-for-wake
 for dwc2 USB
Date: Tue, 23 Jun 2015 09:17:23 -0500
Message-ID: <CAL_JsqJT42GhY45FWY5G=450zxSRVLHu36_O1tPkTdH39JeEcw@mail.gmail.com>
References: <1435017144-2971-1-git-send-email-dianders@chromium.org> <1435017144-2971-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435017144-2971-3-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Youn <johnyoun@synopsys.com>, Felipe Balbi <balbi@ti.com>, Chris Zhong <zyw@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Julius Werner <jwerner@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Alexandru Stan <amstan@chromium.org>, lyz@rock-chips.com, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kever Yang <kever.yang@rock-chips.com>, Paul Zimmerman <paulz@synopsys.com>, Gregory Herrero <gregory.herrero@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 22, 2015 at 6:52 PM, Douglas Anderson <dianders@chromium.org> wrote:
> Some SoCs with a dwc2 USB controller may need to keep the PHY on to
> support remote wakeup.  Allow specifying this as a device tree
> property.

I find it hard to believe that any host can support wake-up without
the PHY. Does this really need to be conditional? Perhaps other cases
are just always-on or remote wake-up has not been tested.

Assuming the PHY was provided with the knowledge that remote wakeup is
enabled, it would be able to figure out within its driver how to
support that. Unfortunately the generic PHY framework is a completely
lacking in its ability to support protocol specific features like this
or other USB PHY features like Vbus detect or charger detection.

Rob

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index fd132cb..84d258d 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -17,6 +17,9 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
>  Optional properties:
>  - phys: phy provider specifier
>  - phy-names: shall be "usb2-phy"
> +- snps,need-phy-for-wake: if present indicates that the phy needs to be left
> +  on for remote wakeup during suspend.
> +
>  Refer to phy/phy-bindings.txt for generic phy consumer properties
>  - dr_mode: shall be one of "host", "peripheral" and "otg"
>    Refer to usb/generic.txt
> @@ -35,4 +38,5 @@ Example:
>                 clock-names = "otg";
>                 phys = <&usbphy>;
>                 phy-names = "usb2-phy";
> +               snps,need-phy-for-wake;
>          };
> --
> 2.4.3.573.g4eafbef
>
