From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: Add panel-timing subnode to simple-panel
Date: Thu, 8 Feb 2018 12:45:58 -0600
Message-ID: <CAL_JsqLS=6DS+Odf03-R3H73V9Qqhz=NQfbeo9Ois+uo9aQv6Q@mail.gmail.com>
References: <20180208174855.55620-1-seanpaul@chromium.org> <20180208174855.55620-4-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180208174855.55620-4-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 8, 2018 at 11:48 AM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This patch adds a new subnode to simple-panel allowing us to override
> the typical timing expressed in the panel's display_timing.
>
> Changes in v2:
>  - Split out the binding into a new patch (Rob)
>  - display-timings is a new section (Rob)
>  - Use the full display-timings subnode instead of picking the timing
>    out (Rob/Thierry)
> Changes in v3:
>  - Go back to using the timing subnode directly, but rename to
>    panel-timing (Rob)
>
> Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Stéphane Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .../bindings/display/panel/simple-panel.txt        | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
