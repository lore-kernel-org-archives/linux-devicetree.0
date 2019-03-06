From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue Bindings
Date: Wed, 6 Mar 2019 22:27:29 +0100
Message-ID: <CAFBinCDthrw1zM8ryLOV4FDVvZecG8q8hGnNJVy8HOjTQRpFzg@mail.gmail.com>
References: <20190304103846.2060-1-narmstrong@baylibre.com> <20190304103846.2060-5-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304103846.2060-5-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Mon, Mar 4, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Adds the bindings for the Amlogic G12A USB Glue HW.
>
> The Amlogic G12A SoC Family embeds 2 USB Controllers :
> - a DWC3 IP configured as Host for USB2 and USB3
> - a DWC2 IP configured as Peripheral USB2 Only
>
> A glue connects these both controllers to 2 USB2 PHYs,
> and optionnally to an USB3+PCIE Combo PHY shared with the PCIE controller.
>
> The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, including
> routing of the OTG PHY between the DWC3 and DWC2 controllers, and
> setups the on-chip OTG mode selection for this PHY.
>
> The PHYs phandles are passed  to the Glue node since the Glue controls the
> interface with the PHY, not the DWC3 controller.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +                       dwc3: usb@ff500000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x0 0xff500000 0x0 0x100000>;
> +                               interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +                               dr_mode = "host";
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,quirk-frame-length-adjustment;
> +                       };
in v1 of the patch I asked whether we should pass the PHYs which are
connected to the dwc3 controller here as well (instead of only passing
them to the USBCTRL node).
we can still do this later on, the important part is: USBCTRL
interfaces with the PHYs -> that is already part of the binding.


Regards
Martin
