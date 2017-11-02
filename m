From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/4] devicetree/bindings: display: Add doucument for
 RGB panels
Date: Wed, 1 Nov 2017 19:22:11 -0500
Message-ID: <20171102002211.4xwcvyav7egubp3p@rob-hp-laptop>
References: <1509522753-118639-1-git-send-email-hjc@rock-chips.com>
 <1509522760-118700-1-git-send-email-hjc@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509522760-118700-1-git-send-email-hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 01, 2017 at 03:52:38PM +0800, Sandy Huang wrote:
> Describe the panel property rgb-mode for parallel and serial
> RGB output interface, include the connection relations for each
> mode.
> 
> Signed-off-by: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes:
>  .../bindings/display/panel/panel-rgb.txt           | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-rgb.txt

There's a couple of attempts to do the same thing[1] and I'm not taking 
more than 1. I'd suggest you split this from the rest of your series and 
work out this part separately with others.

Rob

[1] https://patchwork.kernel.org/patch/9999407/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
