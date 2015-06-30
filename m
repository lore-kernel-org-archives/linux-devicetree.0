From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH-V5 3/4] mfd: 88pm800: Set default interrupt clear method
Date: Tue, 30 Jun 2015 09:29:26 +0900
Message-ID: <CAJKOXPd0raMXohsBK8rB8VsRt0kDTD9es6MAjHLKCqYyCAZC1A@mail.gmail.com>
References: <1435591877-18214-1-git-send-email-vaibhav.hiremath@linaro.org>
	<1435591877-18214-4-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435591877-18214-4-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

2015-06-30 0:31 GMT+09:00 Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> As per the spec, bit 1 (INT_CLEAR_MODE) of reg addr 0xe
> (page 0) controls the method of clearing interrupt
> status of 88pm800 family of devices;
>
>   0: clear on read
>   1: clear on write
>
> If pdata is not coming from board file, then set the
> default irq clear method to "irq clear on write"
>
> Also, as suggested by "Lee Jones" renaming variable field
> to appropriate name.
>
> Signed-off-by: Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/88pm800.c       | 15 ++++++++++-----
>  include/linux/mfd/88pm80x.h | 10 ++++++++--
>  2 files changed, 18 insertions(+), 7 deletions(-)
>

Looks fine to me.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
