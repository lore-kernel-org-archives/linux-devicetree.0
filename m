From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/8] dt-bindings: usb: dwc2: Add Amlogic G12A DWC2 Compatible
Date: Sun, 17 Feb 2019 23:07:30 +0100
Message-ID: <CAFBinCCHy5-kxFoAGUvA7KgOFTjvRFjVE962U+FS1UZnGKEOXA@mail.gmail.com>
References: <20190212151413.24632-1-narmstrong@baylibre.com> <20190212151413.24632-4-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212151413.24632-4-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Tue, Feb 12, 2019 at 4:15 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Adds the specific compatible string for the DWC2 IP found in the
> Amlogic G12A SoC Family.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index 6dc3c4a34483..e150b7b227c9 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -14,6 +14,7 @@ Required properties:
>    - "amlogic,meson8-usb": The DWC2 USB controller instance in Amlogic Meson8 SoCs;
>    - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
>    - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
> +  - "amlogic,meson-g12a-usb": The DWC2 USB controller instance in Amlogic G12A SoCs;
if anyone is curious: starting with GXL (not supported by the dwc2
driver yet) the dwc2 core is "peripheral mode" only while previous
SoCs had one host-only dwc2 instance and another OTG capable dwc2
instance

I also discussed the compatible string with Neil off-list because I
was not sure if we have unique compatible names for the dwc2
controller and the "USB control" registers.
The "USB control" registers are named "USBCTRL" according to Neil (I
assume he got this information from the datasheet to which I don't
have access). Thus the compatible string for the "USB control" device
will be "amlogic,meson-g12a-usb-ctrl" - so we don't have any naming
conflict.


Regards
Martin
