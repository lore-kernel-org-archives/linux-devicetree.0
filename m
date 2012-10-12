From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 2/3] dmaengine: dw_dmac: Enhance device tree support
Date: Fri, 12 Oct 2012 20:48:56 +0530
Message-ID: <CAKohponS+mkj6rN6hzJC1FrbpSS+jWZBii4xQgN+4z2h=zFTWA@mail.gmail.com>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350051925.git.viresh.kumar@linaro.org>
	<9688d98010716880c1bbd966ead312c446282204.1350051925.git.viresh.kumar@linaro.org>
	<1350053897.10584.172.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1350053897.10584.172.camel@smile>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: vinod.koul@intel.com, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 12 October 2012 20:28, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, 2012-10-12 at 20:01 +0530, Viresh Kumar wrote:

>> +     if (last_dw) {
>> +             if ((last_bus_id == param) && (last_dw == dw))
>> +                     return false;
>> +     }

> Just came to my mind.
> dw can't be NULL, can't it?
> Then
> if (last_dw) {
> ...
> }
> is unneeded.

dw can't be but last_dw can be, which we are making NULL when
we find a channel :)

You are already drunk.

--
viresh
