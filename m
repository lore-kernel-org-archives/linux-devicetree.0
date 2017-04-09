From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common
 panel properties
Date: Sun, 9 Apr 2017 12:47:01 +0100
Message-ID: <CACvgo52dydV5fpcDDPnFaRN32uxoeitvazwPpxOs4wOqg0=45A@mail.gmail.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479526093-7014-2-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

Pardon for reviving this old thread. I've noticed a couple of things
which might want some attention.

On 19 November 2016 at 03:28, Laurent Pinchart
<laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> +
> +- panel-timing: Most display panels are restricted to a single resolution and
> +  require specific display timings. The panel-timing subnode expresses those
> +  timings as specified in the timing subnode section of the display timing
> +  bindings defined in
> +  Documentation/devicetree/bindings/display/display-timing.txt.
Cannot find such a file in linux-next. Perhaps you meant
Documentation/devicetree/bindings/display/panel/display-timing.txt?

Documentation/devicetree/bindings/display/panel/panel.txt includes a
"rotation" property, which we might want to fold here.

Regards,
Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
