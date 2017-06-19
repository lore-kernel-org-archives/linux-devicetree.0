From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5 20/26] dt-bindings: power: Add Owl SPS power domains
Date: Mon, 19 Jun 2017 05:57:59 +0200
Message-ID: <4a4cd31c-1d10-21d4-5f44-aa167dfab23c@suse.de>
References: <20170606005426.26446-23-afaerber@suse.de>
 <20170619033626.5583-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170619033626.5583-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, =?UTF-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 19.06.2017 um 05:36 schrieb Andreas Färber:
> Define power domains for all non-reserved S500 power gates.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v4 -> v5:
>  * Renamed header file with owl- prefix for uniqueness
>  
>  v3 -> v4: Unchanged
>  
>  v3: new
>  
>  .../devicetree/bindings/power/actions,owl-sps.txt     | 17 +++++++++++++++++
>  include/dt-bindings/power/owl-s500-powergate.h        | 19 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/actions,owl-sps.txt
>  create mode 100644 include/dt-bindings/power/owl-s500-powergate.h

Due to include dependency applying to linux-actions.git v4.13/soc:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.13/soc

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
