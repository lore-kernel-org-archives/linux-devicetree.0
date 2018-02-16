From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] rtc: isl12026: Add driver.
Date: Fri, 16 Feb 2018 23:24:53 +0200
Message-ID: <CAHp75Ve=yBCk3MTXUbGKU7L-67MXisLLg0OywL9iXX3jRX8HHA@mail.gmail.com>
References: <20180216194415.6103-1-david.daney@cavium.com> <CAHp75VfRDWC1DAhHK-B_2rGLdLGG_FjHmYAmRS5ucspaUoJygA@mail.gmail.com>
 <55b1edec-f93d-a25b-1736-d08783576424@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55b1edec-f93d-a25b-1736-d08783576424-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 16, 2018 at 11:19 PM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> On 02/16/2018 12:13 PM, Andy Shevchenko wrote:
>> On Fri, Feb 16, 2018 at 9:44 PM, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> wrote:

>>> +config RTC_DRV_ISL12026
>>> +       tristate "Intersil ISL12026"

>> depends on OF

> It doesn't depend on CONFIG_OF, it builds just fine without it.

OK.
But then it's useless.

depends on OF || COMPILE_TEST

>>> +static struct i2c_driver isl12026_driver = {
>>> +       .driver         = {
>>> +               .name   = "rtc-isl12026",
>>> +               .of_match_table = of_match_ptr(isl12026_dt_match),

>> /of_match_ptr//

> of_match_ptr() needed if we build without CONFIG_OF

OK.
Have you tried to enable warnings?
You must get `defined but not used` one.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
