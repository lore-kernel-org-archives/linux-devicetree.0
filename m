From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/9] staging: iio: tsl2x7x: add device tree
 documentation
Date: Sun, 9 Jul 2017 18:20:22 +0100
Message-ID: <20170709182022.78f9c422@kernel.org>
References: <20170706225626.6716-1-masneyb@onstation.org>
        <20170706225626.6716-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170706225626.6716-3-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon.Brenner-QzQKeY2x7wg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu,  6 Jul 2017 18:56:19 -0400
Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org> wrote:

> Add device tree documentation for the tsl2x7x IIO driver.
> 
> Signed-off-by: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
For what it's worth given the simplicity of the patch

Acked-by: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/trivial-devices.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
> index 35f406d..0e6e953 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/trivial-devices.txt
> @@ -21,6 +21,16 @@ adi,adt7490		+/-1C TDM Extended Temp Range I.C
>  adi,adxl345		Three-Axis Digital Accelerometer
>  adi,adxl346		Three-Axis Digital Accelerometer (backward-compatibility value "adi,adxl345" must be listed too)
>  ams,iaq-core		AMS iAQ-Core VOC Sensor
> +amstaos,tsl2571		AMS/TAOS ALS and proximity sensor
> +amstaos,tsl2671		AMS/TAOS ALS and proximity sensor
> +amstaos,tmd2671		AMS/TAOS ALS and proximity sensor
> +amstaos,tsl2771		AMS/TAOS ALS and proximity sensor
> +amstaos,tmd2771		AMS/TAOS ALS and proximity sensor
> +amstaos,tsl2572		AMS/TAOS ALS and proximity sensor
> +amstaos,tsl2672		AMS/TAOS ALS and proximity sensor
> +amstaos,tmd2672		AMS/TAOS ALS and proximity sensor
> +amstaos,tsl2772		AMS/TAOS ALS and proximity sensor
> +amstaos,tmd2772		AMS/TAOS ALS and proximity sensor
>  at,24c08		i2c serial eeprom  (24cxx)
>  atmel,at97sc3204t	i2c trusted platform module (TPM)
>  capella,cm32181		CM32181: Ambient Light Sensor
