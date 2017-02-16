From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt: Add vendor prefix for Sensirion
Date: Thu, 16 Feb 2017 06:43:51 -0800
Message-ID: <336e0fa6-3d69-cd16-0480-b62ae68b2de2@roeck-us.net>
References: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com>
 <1487247824-10005-2-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487247824-10005-2-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, FoxPeter-5t/GDYzpMLSELgA04lAiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/16/2017 04:23 AM, Marco Franchi wrote:
> Sensirion is a sensor manufacturer, providing relative humidity sensors,
> temperature sensor and flow sensor solutions.
>
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Wonder who should queue this up. Rob ?

Thanks,
guenter

> ---
> Changes since v3:
> - none
>
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 7a98c33..43e1799 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -263,6 +263,7 @@ sbs	Smart Battery System
>  schindler	Schindler
>  seagate	Seagate Technology PLC
>  semtech	Semtech Corporation
> +sensirion	Sensirion AG
>  sgx	SGX Sensortech
>  sharp	Sharp Corporation
>  si-en	Si-En Technology Ltd.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
