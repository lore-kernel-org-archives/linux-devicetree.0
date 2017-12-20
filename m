From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add sid for a83t
Date: Wed, 20 Dec 2017 15:45:04 -0600
Message-ID: <20171220214504.5n6w5yijwu3iek5l@rob-hp-laptop>
References: <20171219210523.10428-1-kevans91@ksu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171219210523.10428-1-kevans91-OYTqUY/oFF8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kevans91-OYTqUY/oFF8@public.gmane.org
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 03:05:23PM -0600, kevans91-OYTqUY/oFF8@public.gmane.org wrote:
> Allwinner a83t has a 1 KB sid block with efuse for security rootkey and
> thermal calibration data, add node to describe it.
> 
> a83t-sid is not currently supported by nvmem/sunxi-sid, but it is
> supported in an external driver for FreeBSD.
> 
> Signed-off-by: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
> ---
> 
> Changes in v2:
>  - remove bogus "From:" line in commit text; no functional change
> 
>  Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt | 1 +
>  arch/arm/boot/dts/sun8i-a83t.dtsi                               | 5 +++++
>  2 files changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
