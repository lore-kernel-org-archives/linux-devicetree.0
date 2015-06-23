From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Documentation: DT: Fix a typo in the filename "lantiq,<chip>-pinumx.txt"
Date: Tue, 23 Jun 2015 10:31:10 -0500
Message-ID: <CAL_JsqJhAf795wRa0vTBB1oU-c6fGe_RL9Ybez0xtmcU5+VEEg@mail.gmail.com>
References: <593AEF6C47F46446852B067021A273D6FBC08AD6@MUCSE037.lantiq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <593AEF6C47F46446852B067021A273D6FBC08AD6-XfJCBSxaTOzU45ihrnOXy0EOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 1:19 PM,  <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org> wrote:
> From: Thomas Langer <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>
>
> To fix it, use the chance to rename according the compatible string,
> which is "lantiq,pinctrl-falcon" and  "lantiq,pinctrl-xway"
>
> Signed-off-by: Thomas Langer <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>
> Cc: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>

Applied. Thanks.

Rob

> ---
> I am not sure who else should be added to Cc: as this is no new binding, only fixing a typo.
>
>  .../pinctrl/{lantiq,falcon-pinumx.txt => lantiq,pinctrl-falcon.txt}    |    0
>  .../pinctrl/{lantiq,xway-pinumx.txt => lantiq,pinctrl-xway.txt}        |    0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/pinctrl/{lantiq,falcon-pinumx.txt => lantiq,pinctrl-falcon.txt} (100%)
>  rename Documentation/devicetree/bindings/pinctrl/{lantiq,xway-pinumx.txt => lantiq,pinctrl-xway.txt} (100%)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-falcon.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt
> rename to Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-falcon.txt
> diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.txt
> rename to Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
> --
> 1.7.10.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
