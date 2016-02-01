From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V7 2/8] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Mon, 1 Feb 2016 14:45:47 +0530
Message-ID: <56AF2243.50305@nvidia.com>
References: <201601310157.sKXyINX7%fengguang.wu@intel.com> <56ACEEE1.1050800@nvidia.com> <20160201082553.GW3368@x1> <56AF17D6.2090106@nvidia.com> <20160201090239.GB3368@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160201090239.GB3368@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Monday 01 February 2016 02:32 PM, Lee Jones wrote:
> On Mon, 01 Feb 2016, Laxman Dewangan wrote:
>
>> On Monday 01 February 2016 01:55 PM, Lee Jones wrote:
>>> On Sat, 30 Jan 2016, Laxman Dewangan wrote:
>>>
>>>> This depends on patch
>>>> [PATCH V2] mfd: core: add macro for adding mfd cells
>>>>
>>>> and due to absence of this patch, it reports the error.
>>> If you have dependencies, why aren't they in this set?
>>>
>> This change is not related to the series as such and so independent.
>> I just thought that mentioning on commit log will be fine here. May
>> be I missed some points here.
> If you have patches which use/depend on it, then it's not so
> independent, right?

Hmm.. true. I had different thought that the core header is independent 
as it does not depends on other but this series dependent which depends 
on core header. Seems something I missed.
Idea was to review md header independently and used on this series.



>> Let me know if I need to add this to back on series.
>   
> In order to avoid any mishaps, that would be preferable, yes.
>
I will respin this series to V8 once I will have change from you per 
discussion on other email.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
