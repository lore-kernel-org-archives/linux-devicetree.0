From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/3] dmaengine: dw_dmac: Enhance device tree support
Date: Fri, 12 Oct 2012 16:18:36 +0530
Message-ID: <CAKohpok=wSHMNA_ZvjfXxFQxxe4iLS=Jov+3T0N8i18wbfDA2w@mail.gmail.com>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350020375.git.viresh.kumar@linaro.org>
	<91e41b4cc972d298f714cbd6f400569a9710304c.1350020375.git.viresh.kumar@linaro.org>
	<1350030203.10584.139.camel@smile>
	<CAOh2x=m8OVNfMm5Fn+cr9Gxuh6oyt+8d4n-bkG8Xiw5zGncLiA@mail.gmail.com>
	<CAHp75VffAwZjfQLf=wS+nBhiRoMFOoyPeUCfrzF1G=+Kh7HHTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VffAwZjfQLf=wS+nBhiRoMFOoyPeUCfrzF1G=+Kh7HHTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, vinod.koul@intel.com, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 12 October 2012 16:10, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 12, 2012 at 1:36 PM, viresh kumar <viresh.kumar@linaro.org> wrote:
>> On Fri, Oct 12, 2012 at 1:53 PM, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>>> On Fri, 2012-10-12 at 11:14 +0530, Viresh Kumar wrote:
>>
>>>> +     while (++i < dw->sd_count) {
>>>> +             if (!strcmp(dw->sd[i].bus_id, param)) {
>>>> +                     found = 1;
>>>> +                     break;

I was just not looking at this place.

>>>> +             }
>>>> +     }
>>>> +
>>>> +     if (!found) {
>>>> +             last_dw = dw;
>>>> +             last_bus_id = param;
>>>> +             return false;
>>> Because of return here you could eliminate 'found' flag at all.
>> how?

And was looking here only.

> while (++i < dw->sd_count) {
>                if (!strcmp(dw->sd[i].bus_id, param)) {
>        chan->private = &dw->sd[i];
>        last_dw = NULL;
>        last_bus_id = NULL;
>
>        return true;
>                }
>        }
>
>                last_dw = dw;
>                last_bus_id = param;
>                return false;

will be done.
