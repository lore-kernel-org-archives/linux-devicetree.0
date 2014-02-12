From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: mm: cache-l2x0: Check for status property of DT node
Date: Wed, 12 Feb 2014 13:42:49 +0100
Message-ID: <52FB6C49.6010401@samsung.com>
References: <1392206478-11530-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1392206478-11530-1-git-send-email-tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[making Cc list a bit more comprehensive]

On 12.02.2014 13:01, Tushar Behera wrote:
> Currently only the DT node is checked during l2x0 cache initialization,
> but it doesn't check the status of the DT node. Thus it gets called
> even if the status of DT node for L2 controller is disabled.
>
> Add explicit check to ensure that L2 cache is initialized only for
> desired boards.
>
> Reported-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   arch/arm/mm/cache-l2x0.c |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> index 7abde2c..f075cb1 100644
> --- a/arch/arm/mm/cache-l2x0.c
> +++ b/arch/arm/mm/cache-l2x0.c
> @@ -978,6 +978,9 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
>   	if (!np)
>   		return -ENODEV;
>
> +	if (!of_device_is_available(np))
> +		return -ENODEV;
> +
>   	if (of_address_to_resource(np, 0, &res))
>   		return -ENODEV;
>
>

Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
