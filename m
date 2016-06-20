From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 01/63] of: Add a new macro to declare_of for one
 parameter function returning a value
Date: Mon, 20 Jun 2016 16:03:30 -0500
Message-ID: <CAL_JsqJiFRm5ROsKDQ0ygVyehST-e3o8SiR4zWPq4Zj9RrWKdg@mail.gmail.com>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org> <1466112442-31105-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466112442-31105-2-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 4:26 PM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The macro OF_DECLARE_1 expect a void (*func)(struct device_node *) while the
> OF_DECLARE_2 expect a int (*func)(struct device_node *, struct device_node *).
>
> The second one allows to pass an init function returning a value, which make
> possible to call the functions in the table and check the return value in order
> to catch at a higher level the errors and handle them from there instead of
> doing a panic in each driver (well at least this is the case for the clkevt).
>
> Unfortunately the OF_DECLARE_1 does not allow that and that lead to some code
> duplication and crappyness in the drivers.
>
> The OF_DECLARE_1 is used by all the clk drivers and the clocksource/clockevent
> drivers. It is not possible to do the change in one shot as we have to change
> all the init functions.
>
> The OF_DECLARE_2 specifies an init function prototype with two parameters with
> the node and its parent. The latter won't be used, ever, in the timer drivers.
>
> Introduce a OF_DECLARE_1_RET macro to be used, and hopefully we can smoothly
> and iteratively change the users of OF_DECLARE_1 to use the new macro instead.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  include/linux/of.h | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
