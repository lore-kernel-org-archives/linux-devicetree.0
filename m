From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: rockchip: Remove specific cts pullup
 from veyron
Date: Wed, 2 Sep 2015 16:35:28 -0700
Message-ID: <CAD=FV=UQz3ip3q4Kt8_HJrG800a9gzJDiaqoi6=JPBxO=6A80A@mail.gmail.com>
References: <1441236479-4941-1-git-send-email-amstan@chromium.org>
	<1441236479-4941-3-git-send-email-amstan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441236479-4941-3-git-send-email-amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neil Hendin <nhendin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Alex,

On Wed, Sep 2, 2015 at 4:27 PM, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> With the previous patch ("rk3288: pull up cts lines") this is redundant,
> I sent that patch for the same reason this existed here, so the lines don't
> wiggle randomly when disconnected.
>
> Signed-off-by: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Restrict changes only to cts pin, leave rts alone
> - CC people with the firefly board
> - New patch removing redundant pullup code from veyron
> - cover letter
>
>  arch/arm/boot/dts/rk3288-veyron.dtsi | 12 ------------
>  1 file changed, 12 deletions(-)

Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
