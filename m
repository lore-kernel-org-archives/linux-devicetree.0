From: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH,RESEND] regulator: fixed, gpio: dt: regulator-name is required property
Date: Tue, 13 Feb 2018 12:50:09 +0100
Message-ID: <E1elZ6B-0000M8-99@stardust.g4.wien.funkfeuer.at>
References: <1498293410-16222-1-git-send-email-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1498293410-16222-1-git-send-email-harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Content-ID: <1370.1518522609.1-rvrRdOlaWMmli2aaYNgTVBW+3FKk/ZpWT2auq/jSWdo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

what happened to the patch below? It was written to your specification,
got an ACK from devicetree and has no unaddressed review comments, so I
can't see what might be holding it back.

It has been more then 6 month since the last resend, but I still can't
find it in any tree...

HTH,
Harald

Harald Geyer wrote on Sat, 24 Jun 2017 08:36:50 -0000:
> These two drivers fail to probe if no name is provided. For details see:
> https://www.spinics.net/lists/kernel/msg2457515.html
> 
> Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Added the ACK in the resend.
> 
>  Documentation/devicetree/bindings/regulator/fixed-regulator.txt | 1 +
>  Documentation/devicetree/bindings/regulator/gpio-regulator.txt  | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
> index 4fae41d..0c2a6c8 100644
> --- a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
> @@ -2,6 +2,7 @@ Fixed Voltage regulators
>  
>  Required properties:
>  - compatible: Must be "regulator-fixed";
> +- regulator-name: Defined in regulator.txt as optional, but required here.
>  
>  Optional properties:
>  - gpio: gpio to use for enable control
> diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> index dd1ed78..1f49615 100644
> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> @@ -2,6 +2,8 @@ GPIO controlled regulators
>  
>  Required properties:
>  - compatible		: Must be "regulator-gpio".
> +- regulator-name	: Defined in regulator.txt as optional, but required
> +			  here.
>  - states		: Selection of available voltages and GPIO configs.
>                            if there are no states, then use a fixed regulator
>  
> -- 
> 2.1.4
> 

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
