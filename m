From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] DT: mfd: add device-tree binding doc fro PMIC max77620/max20024
Date: Fri, 8 Jan 2016 11:36:55 +0530
Message-ID: <568F51FF.7000102@nvidia.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com> <1452177524-23192-2-git-send-email-ldewangan@nvidia.com> <20160107231249.GA17514@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160107231249.GA17514@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks Rob for review.
I have taken care of all comment except following which I have query.

On Friday 08 January 2016 04:42 AM, Rob Herring wrote:
> +	- maxim,low-battery-reset-enable: Enable low battery reset.
> +	- maxim,low-battery-reset-disable: Disable low battery reset.
> Why not boolean? Not present means keep default value? I'd prefer
> boolean or tristate of not present, 0 to disable, or 1 to enable.
>
>
Here, the properties are boolean. I will add this on the description.

I like to enable or disable with the DT and properties are not there 
then left to default.
So added two properties for enable and disable. If properties are there, 
do the activity.

Here tristate is also possible:
maxim,low-battery-reset: tristate, low battery reset control. 0 for 
disable, 1 for enable and
                                  absence of this will leave 
configuration on default.

Does it look fine?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
