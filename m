From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH 2/6] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Fri, 8 Jan 2016 14:46:43 +0530
Message-ID: <568F7E7B.1010501@nvidia.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>	<1452177524-23192-3-git-send-email-ldewangan@nvidia.com> <CAJKOXPfa0jjRWE6LKvNmwCRcG9Es7=36_03kTqCx-aB1wENx0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPfa0jjRWE6LKvNmwCRcG9Es7=36_03kTqCx-aB1wENx0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Krzysztof,
Thanks for review.
I will fix most of your comment on my next patch.

Answering to some of comment/query.

On Friday 08 January 2016 07:05 AM, Krzysztof Kozlowski wrote:
> ()2016-01-07 23:38 GMT+09:00 Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
> +                               dev_err(dev,
> +                                   "FPS enable-input %u is not supported\n",
> +                                       pval);
> Indentation of arguments does not seem equal here or maybe this is
> just my email client. Have you run this through checkpatch? And
> sparse? And coccicheck (that one definitely not because kbuild is
> complaining)?
I ran checkpatch before I sent.

> +               chip->rmap[i] = devm_regmap_init_i2c(chip->clients[i],
> +               (const struct regmap_config *)&max77620_regmap_config[i]);
> Indentation looks weird here (or again this is my email client...).
> The cast is even weirder?!? Why casting?
There is some parameter difference for MAX77620 and MAX20024. I have 
only one structure for it and changing tun time so I have not define 
this structure as constant.
Now API needs const type structure and hence casting it.

However, I have  define different structure for MAX77620 and MAX20024 
which are const type and hence no need to explicitly casting here. This 
will be in my next patch.

+static inline int max77620_reg_update(struct device *dev, int sid,
+               unsigned int reg, unsigned int mask, unsigned int val)
+{
+       struct max77620_chip *chip = dev_get_drvdata(dev);
+
+       return regmap_update_bits(chip->rmap[sid], reg, mask, val);
+}

> I think all these shouldn't be static inlines in header. Although some
> of them are one-liners but rest are not. Let the compiler decide what
> to do with these wrappers.

If I dont make inline from header then this will complain as unused 
static function on related C compilation if it is not used on C. This 
header included from all sub module driver and they are not using all 
these APIs.

To avoid compilation warning,  I need to use inline here.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
