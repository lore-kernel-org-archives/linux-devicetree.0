From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND] Documentation: DT bindings: add doc for Altera's
 SoCFPGA platform
Date: Wed, 22 Apr 2015 23:09:39 -0500
Message-ID: <CAL_JsqJ_PgWVd97TDssXqqT3EO773zkv0Or3EcCwTGWDK0tg6Q@mail.gmail.com>
References: <1429541747-20479-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429541747-20479-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 20, 2015 at 9:55 AM,  <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Document "altr,socfpga-cyclone5", "altr,socfpga-arria5", and
> "altr,socfpga-arria10".
>
> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Applied for 4.1. Thanks.

Rob

> ---
>  Documentation/devicetree/bindings/arm/altera.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/altera.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/altera.txt b/Documentation/devicetree/bindings/arm/altera.txt
> new file mode 100644
> index 0000000..558735a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera.txt
> @@ -0,0 +1,14 @@
> +Altera's SoCFPGA platform device tree bindings
> +---------------------------------------------
> +
> +Boards with Cyclone 5 SoC:
> +Required root node properties:
> +compatible = "altr,socfpga-cyclone5", "altr,socfpga";
> +
> +Boards with Arria 5 SoC:
> +Required root node properties:
> +compatible = "altr,socfpga-arria5", "altr,socfpga";
> +
> +Boards with Arria 10 SoC:
> +Required root node properties:
> +compatible = "altr,socfpga-arria10", "altr,socfpga";
> --
> 2.2.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
