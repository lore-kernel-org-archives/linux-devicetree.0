From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: humidity: add bindings for
 HDC100x sensors
Date: Tue, 20 Jun 2017 17:46:07 +0100
Message-ID: <20170620174607.01db6525@kernel.org>
References: <1497888066-12652-1-git-send-email-m-stecklein@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497888066-12652-1-git-send-email-m-stecklein-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Jun 2017 11:01:04 -0500
Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org> wrote:

> Add the bindings for the family of HDC100x sensors.
> 
> Signed-off-by: Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
Ideally a brief note below the --- would have said what was different
from v1.

Given you have fixed the stuff Rob mentioned, I'll assume he will
be fine with the result.  Will be possible to change it for a few
days anyway as pushed out as testing which I'm willing to rebase.

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan
> ---
>  .../devicetree/bindings/iio/humidity/hdc100x.txt        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/humidity/hdc100x.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/humidity/hdc100x.txt b/Documentation/devicetree/bindings/iio/humidity/hdc100x.txt
> new file mode 100644
> index 0000000..c52333b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/humidity/hdc100x.txt
> @@ -0,0 +1,17 @@
> +* HDC100x temperature + humidity sensors
> +
> +Required properties:
> +  - compatible: Should contain one of the following:
> +	ti,hdc1000
> +	ti,hdc1008
> +	ti,hdc1010
> +	ti,hdc1050
> +	ti,hdc1080
> +  - reg: i2c address of the sensor
> +
> +Example:
> +
> +hdc100x@40 {
> +	compatible = "ti,hdc1000";
> +	reg = <0x40>;
> +};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
