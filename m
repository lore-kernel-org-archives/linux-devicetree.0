From: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: dt: keystone: provide SoC specific
 compatible flags
Date: Wed, 23 Sep 2015 11:19:32 -0700
Message-ID: <5602ED34.9010108@oracle.com>
References: <1442938118-4718-1-git-send-email-nm@ti.com>
 <1442938118-4718-2-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442938118-4718-2-git-send-email-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Nishant,

On 9/22/2015 9:08 AM, Nishanth Menon wrote:
> Keystone2 devices are used on more platforms than just Texas
> Instruments reference evaluation platforms called EVMs. Providing a
> generic compatible "ti,keystone" is not sufficient to differentiate
> various SoC definitions possible on various platforms. So, provide
> compatible matches for each SoC family by itself.
>
> This allows SoC specific logic to be run time handled based on
> of_machine_is_compatible("ti,k2hk") or as needed for the dependent
> processor instead of needing to use board dependent compatibles that
> are needed now.
>
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> ---
You need to expand that 'not sufficient' for me. Unless there is
genuine case to support this, I would want to avoid this churn.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
