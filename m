From: Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] clk: rockchip: add bindings for the mmc clock phases
Date: Mon, 17 Nov 2014 11:50:51 -0800
Message-ID: <CAHNYxRwGWqbznVybmE+tpyghEoQwVFK_V2ubFRKXasvsPS+R7Q@mail.gmail.com>
References: <1416009604-31545-1-git-send-email-amstan@chromium.org>
 <1416009604-31545-2-git-send-email-amstan@chromium.org> <20141117193902.25314.97687@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141117193902.25314.97687@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, addy ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sorry for my previous mail, I sent it as HTML and also top posted.
Here it goes again:

On Mon, Nov 17, 2014 at 11:39 AM, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> It looks like you are adding new clocks to handle the phase requirement.
> Is that the right thing to do? Don't these clks already exist (e.g.
> SCLK_SDMMC)?
I actually need to control 2 phases, one of them is used when
outputting data, the other when sampling. Sunxi does something
similar: http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/273273.html

Another reason it wouldn't work is because the upstream clock(eg
SCLK_SDMMC) is twice as fast as the real clock(see RK3288_CLKGEN_DIV
in drivers/mmc/host/dw_mmc-rockchip.c), since that clock goes to a /2
divider to be able to do the 90 degree clock phases.

Alexandru Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
