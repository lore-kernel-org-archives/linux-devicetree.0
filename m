From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: power: Add Actions Semi S700 SPS
Date: Wed, 15 Nov 2017 22:35:29 -0600
Message-ID: <20171116043529.hrrgiga4hpdsy2tc@rob-hp-laptop>
References: <20171113233427.5386-1-afaerber@suse.de>
 <20171113233427.5386-7-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171113233427.5386-7-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Jeff Chen <jeff.chen-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?utf-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?utf-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?utf-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?utf-8?B?5qKF5Yip?= <harrymei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, support-om/0PrzuAKC1Z/+hSey0Gg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 14, 2017 at 12:34:25AM +0100, Andreas Färber wrote:
> Define power domains for Actions Semi S700 SoC Smart Power System (SPS).
> 
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v2: New
>  
>  .../devicetree/bindings/power/actions,owl-sps.txt    |  2 ++
>  include/dt-bindings/power/owl-s700-powergate.h       | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 include/dt-bindings/power/owl-s700-powergate.h
> 
> diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.txt b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
> index 007b9a7ae723..78edd63641e8 100644
> --- a/Documentation/devicetree/bindings/power/actions,owl-sps.txt
> +++ b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
> @@ -2,10 +2,12 @@ Actions Semi Owl Smart Power System (SPS)
>  
>  Required properties:
>  - compatible          :  "actions,s500-sps" for S500
> +                         "actions,s700-sps" for S700
>  - reg                 :  Offset and length of the register set for the device.
>  - #power-domain-cells :  Must be 1.
>                           See macros in:
>                            include/dt-bindings/power/owl-s500-powergate.h for S500
> +                          include/dt-bindings/power/owl-s700-powergate.h for S700
>  
>  
>  Example:
> diff --git a/include/dt-bindings/power/owl-s700-powergate.h b/include/dt-bindings/power/owl-s700-powergate.h
> new file mode 100644
> index 000000000000..4ded16bc074f
> --- /dev/null
> +++ b/include/dt-bindings/power/owl-s700-powergate.h
> @@ -0,0 +1,20 @@
> +/*
> + * Actions Semi S700 SPS
> + *
> + * Copyright (c) 2017 Andreas Färber
> + *
> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)

The decree now for SPDX tags is make this the first line using "//".

Otherwise, 

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
