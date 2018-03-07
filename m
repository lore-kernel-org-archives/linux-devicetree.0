Return-Path: <SRS0=Pbn0=F5=baylibre.com=narmstrong@kernel.org>
Subject: Re: [PATCH usb-next v2 0/3] DWC3 support for Amlogic Meson AXG and
 GXL SoCs
References: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <3efb1006-f954-1650-99cc-af2c6cd5ab36@baylibre.com>
Date: Wed, 7 Mar 2018 14:13:53 +0100
MIME-Version: 1.0
In-Reply-To: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, yixun.lan@amlogic.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On 11/02/2018 22:15, Martin Blumenstingl wrote:
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
> 
>  .../devicetree/bindings/usb/amlogic,dwc3.txt       | 42 ++++++++++++++++++++++
>  drivers/usb/dwc3/dwc3-of-simple.c                  | 31 ++++++++++++----
>  2 files changed, 67 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> 

Hi Martin,

Successfully tested on Amlogic Q200 Reference Design board with a Meson GXM S912 SoC.

Other patchsets included :
- improvements and fixes for the phy-meson-gxl-usb2 driver https://lkml.kernel.org/r/20180128202245.25021-1-martin.blumenstingl@googlemail.com
- initialize (multiple) PHYs for a HCD V11 https://lkml.kernel.org/r/20180303214309.25643-1-martin.blumenstingl@googlemail.com
- Meson GXL USB3 PHY driver V4 https://lkml.kernel.org/r/20180303184700.21480-1-martin.blumenstingl@googlemail.com

Tested-by: Neil Armstrong <narmstrong@baylibre.con>

Thanks,
Neil
