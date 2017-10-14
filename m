From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 0/2] Introduce new DT files for Meson-AXG SoC
Date: Sun, 15 Oct 2017 00:32:54 +0200
Message-ID: <1886d509-297c-62a1-9c34-13d83e18bb65@suse.de>
References: <20171013231313.22850-1-dlan@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171013231313.22850-1-dlan-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <dlan-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 14.10.2017 um 01:13 schrieb Yixun Lan:
> This attempt will try to add new DT files to support Meson-AXG SoC.
> Due to the AXG series has new memory layout, we decide to start a new
> DT structure without sharing with previous meson-gx.dtsi
> 
> 1) in the first patch, we try to document the new Meson-AXG bindings
> 2) in the second patch, we try to bring up a minimal serial console,
> so it's capable of running a minimal system (in ramdisk).
> 
> 
> Yixun Lan (2):
>   dt-bindings: arm: amlogic: Add Meson AXG binding
>   arm64: dts: meson-axg: add initial A113D SoC DT support

Reviewed-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>

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
