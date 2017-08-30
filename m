From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v5, 1/3] dt-bindings: hwmon: Document the IBM CCF power supply
 version 1
Date: Tue, 29 Aug 2017 18:04:37 -0700
Message-ID: <20170830010437.GA17886@roeck-us.net>
References: <1503344773-7236-2-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503344773-7236-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: eajames@linux.vnet.ibm.com
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, corbet@lwn.net, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 02:46:11PM -0500, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/ibm,cffps1.txt        | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt b/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> new file mode 100644
> index 0000000..f68a0a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> @@ -0,0 +1,21 @@
> +Device-tree bindings for IBM Common Form Factor Power Supply Version 1
> +----------------------------------------------------------------------
> +
> +Required properties:
> + - compatible = "ibm,cffps1";
> + - reg = < I2C bus address >;		: Address of the power supply on the
> +					  I2C bus.
> +
> +Example:
> +
> +    i2c-bus@100 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #interrupt-cells = <1>;
> +        < more properties >
> +
> +        power-supply@68 {
> +            compatible = "ibm,cffps1";
> +            reg = <0x68>;
> +        };
> +    };
