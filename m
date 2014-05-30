From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/4] dt-bindings: extcon: Add support for SM5502 MUIC device
Date: Fri, 30 May 2014 09:16:38 +0900
Message-ID: <5387CDE6.8030801@samsung.com>
References: <1401269976-12754-1-git-send-email-cw00.choi@samsung.com>
 <1401269976-12754-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1401269976-12754-5-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear DT Maintainer,

Could you please review this patch?

Best Regards,
Chanwoo Choi

On 05/28/2014 06:39 PM, Chanwoo Choi wrote:
> This patch add documentation for binding of SM5502 MUIC (Micro-USB Interface
> Controller) device which is using EXTCON subsystem. The SM5502 MUIC device
> can detect various external accessories when external accessories is attached
> or detached.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> ---
>  .../devicetree/bindings/extcon/extcon-sm5502.txt   | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-sm5502.txt
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-sm5502.txt b/Documentation/devicetree/bindings/extcon/extcon-sm5502.txt
> new file mode 100644
> index 0000000..4ecda22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-sm5502.txt
> @@ -0,0 +1,23 @@
> +
> +* SM5502 MUIC (Micro-USB Interface Controller) device
> +
> +The Silicon Mitus SM5502 is a MUIC (Micro-USB Interface Controller) device
> +which can detect the state of external accessory when external accessory is
> +attached or detached and button is pressed or released. It is interfaced to
> +the host controller using an I2C interface.
> +
> +Required properties:
> +- compatible: Should be "siliconmitus,sm5502-muic"
> +- reg: Specifies the I2C slave address of the MUIC block. It should be 0x25
> +- interrupt-parent: Specifies the phandle of the interrupt controller to which
> +  the interrupts from sm5502 are delivered to.
> +- interrupts: Interrupt specifiers for detection interrupt sources.
> +
> +Example:
> +
> +	sm5502@25 {
> +		compatible = "siliconmitus,sm5502-muic";
> +		interrupt-parent = <&gpx1>;
> +		interrupts = <5 0>;
> +		reg = <0x25>;
> +	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
