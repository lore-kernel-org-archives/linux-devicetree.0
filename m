From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 3/5] gpio: of: Return error if gpio hog configuration
 failed
Date: Wed, 16 Mar 2016 16:40:34 +0530
Message-ID: <56E93F2A.60303@nvidia.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>	<1457703804-3016-4-git-send-email-ldewangan@nvidia.com> <CACRpkdbsu+yfFvCR2=vKO3+S46+GHSy+3wu+5uwMmsu0_mfP-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbsu+yfFvCR2=vKO3+S46+GHSy+3wu+5uwMmsu0_mfP-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Tuesday 15 March 2016 07:42 PM, Linus Walleij wrote:
> On Fri, Mar 11, 2016 at 2:43 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> If GPIO hog configuration failed while adding OF based
>> gpiochip() then return the error instead of ignoring it.
>>
>> This helps of properly handling the gpio driver dependency.
>>
>> When adding the gpio hog nodes for NVIDIA's Tegra210 platforms,
>> the gpio_hogd() fails with EPROBE_DEFER because pinctrl is not
>> ready at this time and gpio_request() for Tegra GPIO driver
>> returns error. The error was not causing the Tegra GPIO driver
>> to fail as the error was getting ignored.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
>> Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Oops is this something I should apply for fixes and tag
> for stable?
>

I dont think that it is needed for stable as this is newly added feature.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
