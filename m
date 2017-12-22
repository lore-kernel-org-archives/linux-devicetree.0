From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 5/8] arm64: dts: actions: Add S700 and CubieBoard7
Date: Fri, 22 Dec 2017 11:10:21 +0100
Message-ID: <e8319d48-44a7-104f-6266-862500d030e2@suse.de>
References: <20171113233427.5386-1-afaerber@suse.de>
 <20171113233427.5386-6-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171113233427.5386-6-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, support-om/0PrzuAKC1Z/+hSey0Gg@public.gmane.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5qKF5Yip?= <harrymei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Jeff Chen <jeff.chen-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 14.11.2017 um 00:34 schrieb Andreas Färber:
> Add Device Trees for S700 SoC and Cubietech CubieBoard7.
> 
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v1 -> v2: Unchanged
>  
>  arch/arm64/boot/dts/actions/Makefile             |   2 +
>  arch/arm64/boot/dts/actions/s700-cubieboard7.dts |  47 +++++++
>  arch/arm64/boot/dts/actions/s700.dtsi            | 164 +++++++++++++++++++++++
>  3 files changed, 213 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/actions/s700-cubieboard7.dts
>  create mode 100644 arch/arm64/boot/dts/actions/s700.dtsi

Squashed patch updated with new SPDX header style and applied:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.16/dt64

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
