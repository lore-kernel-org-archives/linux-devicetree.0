From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gx: Use correct mmc clock source 0
Date: Tue, 01 Aug 2017 12:48:48 -0700
Message-ID: <7h60e7yspr.fsf@baylibre.com>
References: <20170731120552.31606-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170731120552.31606-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome Brunet's
        message of "Mon, 31 Jul 2017 14:05:52 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Now that the clock source 0 is properly described in the CCF, use it
> instead of assuming the default value (xtal)
>
> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>
> This patchset depends on clock patchset adding the related clocks:
> * https://lkml.kernel.org/r/20170731115603.29720-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org

I'll need a stable tag/commit in clk-meson/next/drivers to use in order
to apply this one.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
