From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] Introduce new DT files for Meson-AXG SoC
Date: Mon, 16 Oct 2017 11:34:57 +0200
Message-ID: <90f8d36a-c045-7851-19ce-ce2cfcc619d6@baylibre.com>
References: <20171013231313.22850-1-dlan@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171013231313.22850-1-dlan-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <dlan-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14/10/2017 01:13, Yixun Lan wrote:
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
> 
>  Documentation/devicetree/bindings/arm/amlogic.txt |   6 +
>  arch/arm64/boot/dts/amlogic/Makefile              |   1 +
>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts    |  22 +++
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 204 ++++++++++++++++++++++
>  4 files changed, 233 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> 

Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
