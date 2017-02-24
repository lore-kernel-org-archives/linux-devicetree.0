From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: extcon: Add support for cros-ec device
Date: Fri, 24 Feb 2017 12:44:36 +0900
Message-ID: <58AFAC24.4080202@samsung.com>
References: <20170220151854.22859-1-enric.balletbo@collabora.com>
 <CGME20170220151910epcas1p38ddbee98fb84886179d4cd3243eec85d@epcas1p3.samsung.com>
 <20170220151854.22859-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170220151854.22859-3-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017년 02월 21일 00:18, Enric Balletbo i Serra wrote:
> From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> This patch add documentation for binding of USB Type C cable detection
> mechanism is using EXTCON subsystem. The device can detect the presence
> of display out but it may also detect other external accessories when
> external accessories is attached or detached.
> 
> Signed-off-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../devicetree/bindings/extcon/extcon-cros-ec.txt  | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-cros-ec.txt
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-cros-ec.txt b/Documentation/devicetree/bindings/extcon/extcon-cros-ec.txt
> new file mode 100644
> index 0000000..3576869
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-cros-ec.txt
> @@ -0,0 +1,24 @@
> +ChromeOS EC Type-C Extcon device
> +
> +On ChromeOS systems with USB Type C ports, the ChromeOS Embedded Controller is
> +able to detect the state of external accessories such as display adapters
> +or USB devices when said accessories are attached or detached.
> +
> +The node for this device must be under a cros-ec node like google,cros-ec-spi
> +or google,cros-ec-i2c.
> +
> +Required properties:
> +- compatible:		Should be "google,extcon-cros-ec".
> +- google,usb-port-id:	Specifies the USB port ID to use.
> +
> +Example:
> +	cros-ec@0 {
> +		compatible = "google,cros-ec-i2c";
> +
> +		...
> +
> +		extcon {
> +			compatible = "google,extcon-cros-ec";
> +			google,usb-port-id = <0>;
> +		};
> +	}
> 

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
