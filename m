From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/2] of: irq: Ignore disabled interrupt controllers
Date: Wed, 4 Dec 2013 13:24:55 -0600
Message-ID: <CAL_JsqJsQdKATAQqtPtMBENOBxb3=Dy0DvXFmT3uGh1+QfPH6w@mail.gmail.com>
References: <cover.1385623064.git.peter.crosthwaite@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1385623064.git.peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: grant-likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 28, 2013 at 1:26 AM, Peter Crosthwaite
<peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Hi All,
>
> These two patches support the case where an interrupt controller is
> marked as disabled. Patch 1 fixed the dts interrupt-map search logic to
> ignore disabled interrupt controllers. Patch 2 stops disabled interrupt
> controllers getting probed.
>
> Peter Crosthwaite (2):
>   of: irq: Ignore disabled intc's when searching map
>   of: irq: Ignore disabled interrupt controllers
>
>  drivers/of/irq.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied both patches. Thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
