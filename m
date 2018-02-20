Return-Path: <SRS0=MMX2=FO=googlemail.com=martin.blumenstingl@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
References: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Feb 2018 23:39:45 +0100
Message-ID: <CAFBinCBhOy2J7dgyLg-Oii1iMn0RJyud7ykW=EMBGg+F8X7DpA@mail.gmail.com>
Subject: Re: [PATCH usb-next v2 0/3] DWC3 support for Amlogic Meson AXG and
 GXL SoCs
Content-Type: text/plain; charset="UTF-8"
To: balbi@kernel.org
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, yixun.lan@amlogic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

Hello Felipe,

On Sun, Feb 11, 2018 at 10:15 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Amlogic Meson AXG and GXL SoCs can use the dwc3-of-simple with little
> modifications. These SoCs use:
> - a gate clock for the USB components (DWC3, USB PHYs)
> - a reset line which is shared across all USB components (DWC3, USB2 and
>   USB3 PHYs, OTG detection logic inside the USB3 PHY registers)
> - a reset pulse to trigger the reset
> - depending on the SoC two or more PHYs (AXG: 1x USB2 and 1x USB3 PHY,
>   GXL: 2x USB2 and 1x USB3 PHY)
>
> This extends the dwc3-of-simple so it supports (depending on the
> platform) shared and level resets. Additionally it adds new bindings
> for the Amlogic Meson AXG and GXL SoCs, along with the documentation
> (dt-bindings).
>
> NOTE: for full support on Amlogic Meson GXL SoCs my other series called
> "initialize (multiple) PHYs for a HCD" (see [0] for v8 of that series)
> is required. However, there is no direct dependency on that series.
> Especially since Meson AXG doesn't need it (since it only has one USB2
> and one USB3 PHY, which is already supported by the current dwc3 driver,
> unlike the 2x USB2 and 1x USB3 PHYs on Meson GXL).
> So I believe that this series can still be merged, even if the other
> patchset is not ready yet.
>
>
> changes since v1 at [1]:
> - use of_device_is_compatible() instead of struct dwc3_of_simple_params
>   as requested by Felipe Balbi (affects PATCH #2 and #3)
> - added Rob's Acked-by to the dt-bindings patch
> - added Yixun Lan's Tested-by to the whole series as he tested this
>   successfully (along with other patches) on the Amlogic Meson AXG SoC
>
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006274.html
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006286.html
>
> Martin Blumenstingl (3):
>   dt-bindings: usb: add support for dwc3 controller on Amlogic Meson GX
>   usb: dwc3: of-simple: add support for shared and pulsed reset lines
>   usb: dwc3: of-simple: add support for the Amlogic Meson GXL and AXG
>     SoCs
could you please let me know if you spotted any problems, code-style
issues in v2 or whether you are waiting for feedback from another
maintainer?
in case everything is fine: will you take this series through your tree?


Regards
Martin
