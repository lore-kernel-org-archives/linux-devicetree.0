From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH RESEND 1/2] dt/bindings: display: fix display-timing reference
Date: Fri, 04 Aug 2017 11:18:55 +0300
Message-ID: <8909960.iKQN7v5pk9@avalon>
References: <22d9c447946555c7268119dc4d7ee5f63d5f668d.1501825126.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <22d9c447946555c7268119dc4d7ee5f63d5f668d.1501825126.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Baruch,

Thank you for the patch.

On Friday 04 Aug 2017 08:38:45 Baruch Siach wrote:
> Fixes: 14da3ed8dd08 ("devicetree/bindings: display: Document common panel
> properties") Cc: Laurent Pinchart
> <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>

I've had the exact same patch in my tree for some time now, and forgot to send 
it :-/ So,

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/display/panel/panel-common.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> b/Documentation/devicetree/bindings/display/panel/panel-common.txt index
> ec52c472c845..0603af877155 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> @@ -38,7 +38,7 @@ Display Timings
>    require specific display timings. The panel-timing subnode expresses
> those timings as specified in the timing subnode section of the display
> timing bindings defined in
> -  Documentation/devicetree/bindings/display/display-timing.txt.
> +  Documentation/devicetree/bindings/display/panel/display-timing.txt.
> 
> 
>  Connectivity

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
