From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] Documentation: dt: iio: humidity: add hts221
 sensor device binding
Date: Sun, 9 Oct 2016 11:32:39 +0100
Message-ID: <975bb745-cf11-1c6c-aa73-71e00bf1a42b@kernel.org>
References: <1475912752-6444-1-git-send-email-lorenzo.bianconi@st.com>
 <1475912752-6444-3-git-send-email-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475912752-6444-3-git-send-email-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/10/16 08:45, Lorenzo Bianconi wrote:
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/humidity/hts221.txt       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/humidity/hts221.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/humidity/hts221.txt b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
> new file mode 100644
> index 0000000..46a152c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
> @@ -0,0 +1,19 @@
> +* HTS221 STM humidity + temperature sensor
> +
> +Required properties:
> +- compatible: should be "st,hts221"
> +- reg: i2c address of the sensor / spi cs line
> +
> +Optional properties:
> +- interrupts: interrupt mapping for GPIO IRQ. It should be configured with
> +	      flags IRQ_TYPE_LEVEL_HIGH or IRQ_TYPE_EDGE_RISING
It might not be a gpio irq.  Plenty of IRQ only chips out there that you can't
use for general purpose reading (you can't explicitly read their state).

> +- interrupt-parent: should be the phandle for the interrupt controller
Convention here is to add a cross reference to the main interrupt docs.
We have been a bit lax on this in some IIO drivers but might as well be
good with a new one.

Otherwise this looks good to me.

Thanks,

Jonathan
> +
> +Example:
> +
> +hts221@5f {
> +	compatible = "st,hts221";
> +	reg = <0x5f>;
> +	interrupt-parent = <&gpio0>;
> +	interrupts = <0 IRQ_TYPE_EDGE_RISING>;
> +};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
