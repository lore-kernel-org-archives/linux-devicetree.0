From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] video: mxsfb: get supply regulator optionally
Date: Mon, 12 Sep 2016 10:47:20 -0500
Message-ID: <20160912154720.GA31424@rob-hp-laptop>
References: <20160904042627.30182-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160904042627.30182-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 03, 2016 at 09:26:27PM -0700, Stefan Agner wrote:
> The lcd-supply is meant to be optional, there are several device-
> trees not specifying it and the code handles error values silently.
> Therefor, avoid creating a dummy regulator (and the associated
> warning) by using devm_regulator_get_optional.
> 
> While at it, document that fact also in the device-tree bindings.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/mxsfb.txt | 3 +++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/video/fbdev/mxsfb.c                         | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
