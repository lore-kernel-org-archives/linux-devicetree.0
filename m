From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] drm/msm/hdmi: Clean up HDMI gpio DT bindings
Date: Wed, 7 Sep 2016 15:18:08 -0700
Message-ID: <CALAqxLUQf7h1P39ofDGLA72AviV1ns_oEuxSN4jW2U5uKGebvQ@mail.gmail.com>
References: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
 <1472737015-29382-1-git-send-email-architt@codeaurora.org> <1472737015-29382-3-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472737015-29382-3-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 1, 2016 at 6:36 AM, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> Make the following changes in the HDMI gpio bindings:
>
> - Use "-gpios" as the suffix for all the gpio names
> - Move all the gpios to optional, since there are platforms that use none
>   of them.
> - The HPD gpio is a standard one, remove the "qcom,hdmi-tx-" prefix from
>   it.
> - Add a missing lpm gpio used on some platforms.
>
> Make the necessary changes in the driver to incorporate these changes.
>
> There hasn't been any upstream DT that uses the HDMI bindings, so it's
> okay to change and move around these properties.
>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>


Tested-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
