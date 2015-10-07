From: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/4] drivers: clk: st: PLL rate change implementation
 for DVFS
Date: Wed, 7 Oct 2015 09:47:50 +0200
Message-ID: <CAG374jA9W=u7Cq1tNSu1oWuQD68UM768UwckKU6V9+okGUUx8w@mail.gmail.com>
References: <1444032393-13433-1-git-send-email-gabriel.fernandez@linaro.org>
 <1444032393-13433-3-git-send-email-gabriel.fernandez@linaro.org> <20151006180617.GE12338@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151006180617.GE12338-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

No there is no reason. I will fix it.

Thanks for review.

Best regards

Gabriel

On 6 October 2015 at 20:06, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 10/05, Gabriel Fernandez wrote:
>> @@ -452,7 +651,7 @@ static const struct clk_ops st_pll1200c32_ops = {
>>  static struct clk * __init clkgen_pll_register(const char *parent_name,
>>                               struct clkgen_pll_data  *pll_data,
>>                               void __iomem *reg,
>> -                             const char *clk_name)
>> +                             const char *clk_name, spinlock_t *lock)
>
> Is there a reason we pass lock here but never use it in this
> function?
>
>>  {
>>       struct clkgen_pll *pll;
>>       struct clk *clk;
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
