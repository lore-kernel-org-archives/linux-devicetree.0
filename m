From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/2] iio:dac: Add DT binding documentation for ds4424
Date: Sat, 30 Sep 2017 18:18:41 +0100
Message-ID: <20170930181841.63b07a12@archlinux>
References: <20170922201226.23721-1-Ismail.Kose@maximintegrated.com>
        <20170922201226.23721-2-Ismail.Kose@maximintegrated.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170922201226.23721-2-Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ismail H. Kose" <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Cc: ihkose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Roussin-Belanger <maxime.roussinbelanger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Jean-Francois Dagenais <jeff.dagenais-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 22 Sep 2017 13:12:09 -0700
"Ismail H. Kose" <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org> wrote:

> Signed-off-by: Ismail H. Kose <ihkose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Ismail H. Kose <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>

Direct at Rob Herring...

Rob, this is now a very standard binding so I'm going to
take it into my testing tree.  If you have a chance to take a last
look at it though that would be great.

For everyone else: 

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
> v6:
> 	* Removed reference resistors property
> 	* Fixed regulator property
> v3:
> 	* Removed iio-map
> v2:
> 	* Removed min/max rfs, ifs-scale, etc values
> 
>  Documentation/devicetree/bindings/iio/dac/ds4424.txt | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ds4424.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ds4424.txt b/Documentation/devicetree/bindings/iio/dac/ds4424.txt
> new file mode 100644
> index 000000000000..eaebbf8dab40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ds4424.txt
> @@ -0,0 +1,20 @@
> +Maxim Integrated DS4422/DS4424 7-bit Sink/Source Current DAC Device Driver
> +
> +Datasheet publicly available at:
> +https://datasheets.maximintegrated.com/en/ds/DS4422-DS4424.pdf
> +
> +Required properties:
> +	- compatible: Should be one of
> +		maxim,ds4422
> +		maxim,ds4424
> +	- reg: Should contain the DAC I2C address
> +
> +Optional properties:
> +	- vcc-supply: Power supply is optional. If not defined, driver will ignore it.
> +
> +Example:
> +	ds4224@10 {
> +		compatible = "maxim,ds4424";
> +		reg = <0x10>; /* When A0, A1 pins are ground */
> +		vcc-supply = <&vcc_3v3>;
> +	};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
