From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V2 2/3] dmaengine: dw_dmac: Enhance device tree support
Date: Fri, 12 Oct 2012 18:53:14 +0300
Message-ID: <CAHp75VdNVyWxvnHDFjg_5vC95M_LwJYUDLQb+NmBA6GRVsea9g@mail.gmail.com>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350051925.git.viresh.kumar@linaro.org>
	<9688d98010716880c1bbd966ead312c446282204.1350051925.git.viresh.kumar@linaro.org>
	<1350053897.10584.172.camel@smile>
	<CAKohponS+mkj6rN6hzJC1FrbpSS+jWZBii4xQgN+4z2h=zFTWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKohponS+mkj6rN6hzJC1FrbpSS+jWZBii4xQgN+4z2h=zFTWA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, vinod.koul@intel.com, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 12, 2012 at 6:18 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 12 October 2012 20:28, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Fri, 2012-10-12 at 20:01 +0530, Viresh Kumar wrote:
>
>>> +     if (last_dw) {
>>> +             if ((last_bus_id == param) && (last_dw == dw))
>>> +                     return false;
>>> +     }
1. This is an equivalent of
if (last_dw && (last_bus_id == ... ) && (last_dw == dw))
 return false;
2. In case dw is always non-NULL the last_dw == dw is false if last_dw is NULL.

Where am I wrong?

> You are already drunk.
Not yet, but tired.

-- 
With Best Regards,
Andy Shevchenko
