From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4 13/28] dt-bindings: arm: Document Actions Semi S900
Date: Mon, 19 Jun 2017 00:29:23 +0200
Message-ID: <423ef831-329c-0b26-015d-0ad242bc7ec0@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
 <20170606005426.26446-14-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606005426.26446-14-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, =?UTF-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 06.06.2017 um 02:54 schrieb Andreas Färber:
> The Actions Semi S900 is a quad-core ARM Cortex-A53 SoC.
> The Bubblegum-96 is a 96Boards Consumer Edition compliant board (4/96).
> 
> Cc: 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v2 -> v3 -> v4: unchanged
>  
>  v1 -> v2:
>  * Adopted "actions" vendor prefix
>  * Extended text
>  
>  Documentation/devicetree/bindings/arm/actions.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Still no comments from uCRobotics received...

Due to S500 dependency applying to linux-actions.git v4.13/dt branch:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.13/dt

Let me know if we need a topic branch for dt+dt64 instead.

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
