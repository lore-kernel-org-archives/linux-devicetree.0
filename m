From: Brian Masney <masneyb@onstation.org>
Subject: Re: 'reg: property has invalid length' with new JSON-schema bindings
Date: Sun, 31 Mar 2019 06:39:00 -0400
Message-ID: <20190331103900.GA10428@basecamp>
References: <20190331022653.GA8727@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190331022653.GA8727@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 30, 2019 at 10:26:53PM -0400, Brian Masney wrote:
> I'm finishing up a patch series that adds device tree support for a
> backlight driver and I made the bindings use the new JSON schema. I'm
> running into a problem with the reg property in the examples and I can
> reproduce the issue by adding an example to the trivial bindings:
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml
> b/Documentation/devicetree/bindings/trivial-devices.yaml
> index d79fb22bde39..bdab6a015db4 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -341,4 +341,10 @@ required:
>    - compatible
>    - reg
>  
> +examples:
> +  - |
> +    isl29028@38 {
> +        compatible = "isil,isl29028";
> +        reg = <0x38>;
> +    };
>  ...
> 
> 'make dt_binding_check' fails with the following error:
> 
>   Documentation/devicetree/bindings/trivial-devices.example.dts:11.5-18:
>     Warning (reg_format): /isl29028@38:reg: property has invalid length
>     (4 bytes) (#address-cells == 1, #size-cells == 1)
>   ...
>   Documentation/devicetree/bindings/trivial-devices.example.dtb:
>     Warning (i2c_bus_reg): Failed prerequisite 'reg_format'

I make the check happy by including an i2c node in my example.

examples:
  - |
    i2c {
        #address-cells = <1>;
        #size-cells = <0>;

        isl29028@38 {
                compatible = "isil,isl29028";
                reg = <0x38>;
        };
    };

Sorry about the noise.

Brian
