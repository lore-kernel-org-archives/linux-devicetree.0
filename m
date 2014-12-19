From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] CHROMIUM: clk: rockchip: add PVTM clocks on rk3288
Date: Thu, 18 Dec 2014 16:33:55 -0800
Message-ID: <CAD=FV=XNMLpLq8doA+h_1mxT1CjSxVshRN_KaxLCPA8veTVvRw@mail.gmail.com>
References: <1418948026-3463-1-git-send-email-dtor@chromium.org>
	<1418948026-3463-2-git-send-email-dtor@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418948026-3463-2-git-send-email-dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dmitry,

On Thu, Dec 18, 2014 at 4:13 PM, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> From: huang lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> Process-Voltage-Temperatiure Monitor block on RK3288 has two clocks:
> PVTM_CORE and PVTM_GPU.
>
> Signed-off-by: Huang Lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/clk/rockchip/clk-rk3288.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for sending!

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
