From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] iio: adc128s052: add support for adc122s021
Date: Mon, 18 May 2015 14:19:17 +0200
Message-ID: <5559D8C5.9060407@metafoo.de>
References: <1431950676-22379-1-git-send-email-urs.fassler@bytesatwork.ch> <1431950676-22379-2-git-send-email-urs.fassler@bytesatwork.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431950676-22379-2-git-send-email-urs.fassler-31H8OHFNM6fpWzRi28bHsw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VXJzIEbDpHNzbGVy?= <urs.fassler-31H8OHFNM6fpWzRi28bHsw@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> --- a/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
> @@ -1,7 +1,7 @@
> -* Texas Instruments' ADC128S052 ADC chip
> +* Texas Instruments' ADC128S052 and ADC122S021 ADC chip
>
>   Required properties:
> - - compatible: Should be "ti,adc128s052"
> + - compatible: Should be "adc128s052" or "adc122s021"

Why are you removing the vendor prefix? The compatible string is not valid 
without a vendor prefix.

>    - reg: spi chip select number for the device
>    - vref-supply: The regulator supply for ADC reference voltage
>
> @@ -11,7 +11,7 @@ Recommended properties:
>
>   Example:
>   adc@0 {
> -	compatible = "ti,adc128s052";
> +        compatible = "adc128s052";

Indention.
