From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: meson-gxl: disable broken eee
Date: Sat, 22 Jul 2017 08:26:02 -0700
Message-ID: <7ho9scsdbp.fsf@baylibre.com>
References: <20170707013257.18250-1-joseph.kogut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170707013257.18250-1-joseph.kogut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Joseph Kogut's
        message of "Thu, 6 Jul 2017 18:32:57 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Kogut <joseph.kogut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Joseph,

Joseph Kogut <joseph.kogut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Meson GXL appears to suffer from the same broken eee issue as GXB,
> originally fixed by feb3cbea0946.
>
> This patch disables the broken energy-efficient ethernet for GXL,
> avoiding the tx link breakage.
>
> Signed-off-by: Joseph Kogut <joseph.kogut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Can you share what platforms you tested to find/fix this problem?

Thanks for the patch!

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
