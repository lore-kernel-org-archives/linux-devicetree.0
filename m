From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH resend 3/3] dt: bindings: touchscreen: silead gsl1680:
 Document all compatibles
Date: Tue, 20 Sep 2016 09:41:21 -0500
Message-ID: <20160920144120.GA20565@rob-hp-laptop>
References: <20160911184543.11734-1-hdegoede@redhat.com>
 <20160911184543.11734-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160911184543.11734-4-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 11, 2016 at 08:45:43PM +0200, Hans de Goede wrote:
> The silead gsl1680 driver / binding supports a whole series of devices,
> list the compatibles for all of them in the binding.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -Drop the "silead,mssl1680" compatible thing, the "mssl1680" name is an
>  ACPI thing and does not belong in the dt bindings
> ---
>  .../devicetree/bindings/input/touchscreen/silead_gsl1680.txt          | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
