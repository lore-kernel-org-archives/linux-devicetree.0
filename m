From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dt-bindings: iio: temperature: add MLX90632 device
 bindings
Date: Tue, 12 Dec 2017 18:45:48 +0100
Message-ID: <13b298c0-d618-e217-406d-63bac56106fc@suse.de>
References: <20171211092002.8687-1-cmo@melexis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211092002.8687-1-cmo-fc6wVz46lShBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Crt Mori <cmo-fc6wVz46lShBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 11.12.2017 um 10:20 schrieb Crt Mori:
> Add device tree bindings for MLX90632 IR temperature sensor.
> 
> Signed-off-by: Crt Mori <cmo-fc6wVz46lShBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/iio/temperature/mlx90632.txt          | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/mlx90632.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/temperature/mlx90632.txt b/Documentation/devicetree/bindings/iio/temperature/mlx90632.txt
> new file mode 100644
> index 000000000000..0b05812001f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/temperature/mlx90632.txt
[...]
> +Example:
> +
> +mlx90632@3a {

Shouldn't the node name be more general like temperature@3a?

> +	compatible = "melexis,mlx90632";
> +	reg = <0x3a>;
> +};

Also generally the dt-bindings patch should go before the first use of
the compatible string.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
