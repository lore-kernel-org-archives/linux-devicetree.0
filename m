From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] display: panel: Add Tianma tm070rvhg71 display
 support (800x480)
Date: Fri, 10 Nov 2017 15:24:23 -0600
Message-ID: <20171110212423.jddj5kw32voms2oj@rob-hp-laptop>
References: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
 <20171107153058.5554-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171107153058.5554-1-lukma-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 07, 2017 at 04:30:58PM +0100, Lukasz Majewski wrote:
> Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> 
> ---
> Changes for v2:
> - Provide more detailed ./Documentation/devicetree/bindings/display/panel
>   entry to describe this panel device.
> ---
>  .../bindings/display/panel/tianma,tm070rvhg71.txt  | 29 ++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
