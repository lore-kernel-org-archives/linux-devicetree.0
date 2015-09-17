From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: bindings: Extend the bma180 bindings with
 bma250 info
Date: Thu, 17 Sep 2015 14:40:57 -0500
Message-ID: <55FB1749.3050403@kernel.org>
References: <1442055169-16966-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442055169-16966-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/12/2015 05:52 AM, Hans de Goede wrote:
> The bma180 / bma250 accelerometers share a driver (at least under Linux),
> so it makes sense to also have their bindings info in a single .txt.
> 
> This commit extends the bma180 bindings with bma250 bindings, specifically
> it specifies how the 2 seperate interrupts the bma250 has must be listed
> in devicetree. The existing bma180 driver is already fully compatible
> with the specified bindings.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/iio/accel/bma180.txt | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/bma180.txt b/Documentation/devicetree/bindings/iio/accel/bma180.txt
> index c593357..4a3679d 100644
> --- a/Documentation/devicetree/bindings/iio/accel/bma180.txt
> +++ b/Documentation/devicetree/bindings/iio/accel/bma180.txt
> @@ -1,10 +1,11 @@
> -* Bosch BMA180 triaxial acceleration sensor
> +* Bosch BMA180 / BMA250 triaxial acceleration sensor
>  
>  http://omapworld.com/BMA180_111_1002839.pdf
> +http://ae-bst.resource.bosch.com/media/products/dokumente/bma250/bst-bma250-ds002-05.pdf
>  
>  Required properties:
>  
> -  - compatible : should be "bosch,bma180"
> +  - compatible : should be "bosch,bma180" or "bosch,bma250"
>    - reg : the I2C address of the sensor
>  
>  Optional properties:
> @@ -13,6 +14,9 @@ Optional properties:
>  
>    - interrupts : interrupt mapping for GPIO IRQ, it should by configured with
>  		flags IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING
> +		For the bma250 the first interrupt listed must be the one
> +		connected to the INT1 pin, the second (optional) interrupt
> +		listed must be the one connected to the INT2 pin.
>  
>  Example:
>  
> 
