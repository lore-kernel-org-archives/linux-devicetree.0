From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: fixed-factor: Fix device-tree binding typo
Date: Wed, 27 Nov 2013 11:53:10 -0800
Message-ID: <20131127195310.16819.83218@quantum>
References: <1380136218-15578-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380136218-15578-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Ezequiel Garcia (2013-09-25 12:10:18)
> The required properties are not named "div" and "mult",
> but rather "clock-div" and "clock-mult".
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Taken into clk-next.

Thanks,
Mike

> ---
>  Documentation/devicetree/bindings/clock/fixed-factor-clock.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt b/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
> index 5757f9a..1bae8527 100644
> --- a/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
> @@ -19,6 +19,6 @@ Example:
>                 compatible = "fixed-factor-clock";
>                 clocks = <&parentclk>;
>                 #clock-cells = <0>;
> -               div = <2>;
> -               mult = <1>;
> +               clock-div = <2>;
> +               clock-mult = <1>;
>         };
> -- 
> 1.8.1.5
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
