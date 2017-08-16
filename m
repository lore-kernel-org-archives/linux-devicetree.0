From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c: Document the IBM CCF power
 supply version 1
Date: Wed, 16 Aug 2017 06:42:43 -0700
Message-ID: <6d0edce7-5e96-b6d4-8503-cf0f27f72d51@roeck-us.net>
References: <1502830355-502-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502830355-502-2-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502830355-502-2-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: jdelvare-IBi9RG/b67k@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/15/2017 01:52 PM, Eddie James wrote:
> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> ---
>   .../devicetree/bindings/i2c/ibm,cffps1.txt          | 21 +++++++++++++++++++++

Sorry, just noticed. Sorry for the piecemeal review :-(.
The i2c directory is used for i2c controllers, not for other i2c devices.
Please move to hwmon (and drop i2c from the subject).

Thanks,
Guenter

>   1 file changed, 21 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> new file mode 100644
> index 0000000..f68a0a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
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
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
