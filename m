From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: mcp3422: Add DT binding documentation
Date: Mon, 09 Mar 2015 11:04:45 +0000
Message-ID: <54FD7E4D.20403@kernel.org>
References: <1425821843-29185-1-git-send-email-angelo.compagnucci@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425821843-29185-1-git-send-email-angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/03/15 13:37, Angelo Compagnucci wrote:
> Adding binding documentation for ADC MCP3422.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Applied to the togreg branch of iio.git

Thanks,

> ---
>  Documentation/devicetree/bindings/iio/adc/mcp3422.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mcp3422.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mcp3422.txt b/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
> new file mode 100644
> index 0000000..333139c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
> @@ -0,0 +1,17 @@
> +* Microchip mcp3422/3/4/6/7/8 chip family (ADC)
> +
> +Required properties:
> + - compatible: Should be
> +	"microchip,mcp3422" or
> +	"microchip,mcp3423" or
> +	"microchip,mcp3424" or
> +	"microchip,mcp3426" or
> +	"microchip,mcp3427" or
> +	"microchip,mcp3428"
> + - reg: I2C address for the device
> +
> +Example:
> +adc@0 {
> +	compatible = "microchip,mcp3424";
> +	reg = <0x68>;
> +};
> 
