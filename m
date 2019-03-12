From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: usb: dwc3: Add Amlogic G12A DWC3
 Glue Bindings
Date: Tue, 12 Mar 2019 13:29:17 -0500
Message-ID: <20190312182917.GA22114@bogus>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-5-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190304103846.2060-5-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  4 Mar 2019 11:38:42 +0100, Neil Armstrong wrote:
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
> ---
>  .../devicetree/bindings/usb/amlogic,dwc3.txt  | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
