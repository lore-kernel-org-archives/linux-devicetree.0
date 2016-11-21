From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM64: dts: Add support for Meson GXM
Date: Mon, 21 Nov 2016 09:10:53 -0800
Message-ID: <m2shqk3giq.fsf@baylibre.com>
References: <20161121162905.14285-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161121162905.14285-1-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Neil
        Armstrong's message of "Mon, 21 Nov 2016 17:29:03 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> The new Amlogic GXM SoC (S912) is part of the Meson GX family and is nearly
> identical to GXM but with a second Quad-A53 core cluster.
>
> The GXM dtsi includes the GXL dtsi and the p20x dtsi is refactored in a
> common p20x/q20x to support the GXM Q200 and Q201 board that uses the exact
> same board layout since the S905D and S912 are pinout compatible.
>
> The last patch adds support for the Nexbox A1 Set-Top-Box based on the S912.
>
> Changes since RFC :
>  - Refactor the p20x/q20x dtsi into a single common file
>  - Add support for Nexbox A1

Thanks for refactoring.  Looks great.

Applied.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
