From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM64: meson-gxbb: Add support for the Nexbox A95X Board
Date: Fri, 07 Oct 2016 06:44:17 -0700
Message-ID: <7hbmywff4e.fsf@baylibre.com>
References: <1475654980-16414-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475654980-16414-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Neil
        Armstrong's message of "Wed, 5 Oct 2016 10:09:38 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Add support for the Amlogic S905 (GXBB) version of the Nexbox A95X, an IPTV
> set-top-box with Ethernet, SDCard, eMMC, USB, HDMI, IR, Led, Reset button and Audio Jack.
>
> Changes since v1 at: http://lkml.kernel.org/r/1471951370-29269-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>  - Rebase on linux-next-20161004 with patchset [1]
>  - Add nexbox vendor prefix
>
> [1] http://lkml.kernel.org/r/1475595430-30075-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>
> Neil Armstrong (2):
>   devicetree: Add vendor prefix for Nexbox
>   ARM: dts: meson-gxbb: Add support for the Nexbox A95X Board

Applied to v4.10/dt64 branch,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
