Return-Path: <robherring2@gmail.com>
Date: Mon, 27 Feb 2017 13:52:51 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] add device tree documentation for cy8cmbr3102
Message-ID: <20170227195251.tqgkfhfcu57f3vi3@rob-hp-laptop>
References: <1487659221-14665-1-git-send-email-Patrick.Vogelaar@gigatronik.com>
 <1487659221-14665-3-git-send-email-Patrick.Vogelaar@gigatronik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1487659221-14665-3-git-send-email-Patrick.Vogelaar@gigatronik.com>
To: Patrick Vogelaar <Patrick.Vogelaar@gigatronik.com>
Cc: dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, fengguang.wu@intel.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 21, 2017 at 07:40:21AM +0100, Patrick Vogelaar wrote:
> Version 2:
> * based on branch next

Not a meaningful commit message. Version info goes below '---'

The subject should be "dt-bindings: input: ..."

> 
> Signed-off-by: Patrick Vogelaar <Patrick.Vogelaar@gigatronik.com>
> ---
>  .../bindings/input/cypress,cy8cmbr3102.txt         | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cypress,cy8cmbr3102.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/cypress,cy8cmbr3102.txt b/Documentation/devicetree/bindings/input/cypress,cy8cmbr3102.txt
> new file mode 100644
> index 0000000..d5294b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/cypress,cy8cmbr3102.txt
> @@ -0,0 +1,32 @@
> +Device tree bindings for Cypress CY8CMBR3102 CapSense Express controller.
> +
> +The node for this device must be a child of a I2C controller node, as the
> +device communicates via I2C.
> +
> +Required properties:
> +
> +	compatible:	Must be "cypress,cy8cmbr3102".
> +	reg:		The I2C slave address of the device.
> +	linux,keycodes:	Specifies an array of numeric keycode values to
> +			be used for reporting button presses. The array can
> +			contain up to two entries.
> +
> +Optional properties:
> +
> +	autorepeat:	Enables the Linux input system's autorepeat
> +			feature on the input device.
> +
> +Example:
> +
> +	&i2c1 {
> +		/* ... */
> +
> +		touchb_tn: cy8cmbr3102@37 {
> +			compatible = "cypress,cy8cmbr3102";
> +			reg = <0x37>;
> +			linux,keycodes = <BTN_0>, <BTN_1>;
> +			autorepeat;
> +		};
> +
> +		/* ... */
> +	};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
