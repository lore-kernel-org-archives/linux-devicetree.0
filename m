From: "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Subject: Re: [PATCH v1 1/2] x86/rtc: Add option to skip using RTC
Date: Fri, 23 Aug 2019 11:37:38 +0800
Message-ID: <a6717e97-01cf-771c-8467-be5946528dd0@linux.intel.com>
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
 <becacc523508b295a52db9f1592e2868e3988e28.1566458029.git.rahul.tanwar@linux.intel.com>
 <20190822090208.GJ30120@smile.fi.intel.com>
 <25f6947d-7ba0-c23c-25aa-c4c4173da6b0@linux.intel.com>
 <20190822130429.GN30120@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822130429.GN30120@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, alan@linux.intel.com, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, cheol.yong.kim@intel.com, rahul.tanwar@intel.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 22/8/2019 9:04 PM, Andy Shevchenko wrote:
> On Thu, Aug 22, 2019 at 05:26:33PM +0800, Tanwar, Rahul wrote:
>> On 22/8/2019 5:02 PM, Andy Shevchenko wrote:
>>> On Thu, Aug 22, 2019 at 03:44:03PM +0800, Rahul Tanwar wrote:
>>>> Use a newly introduced optional "status" property of "motorola,mc146818"
>>>> compatible DT node to determine if RTC is supported. Skip read/write from
>>>> RTC device only when this node is present and status is "disabled". In all
>>>> other cases, proceed as before.
>>> Can't we rather update ->get_wallclock() and ->set_wallclock() based on this?
>>
>> get_wallclock() and set_wallclock() are function pointers of platform_ops
>>
>> which are initialized to mach_get_cmos_time() and mach_set_rtc_mmss()
>>
>> at init time. Since adding a new platform to override these functions is
>>
>> discouraged, so the only way is to modify RTC get/set functions.
> Shouldn't it be platform agnostic code?
> So, my point is, instead of hacking two functions, perhaps better to avoid them
> at all.

Sorry, i could not understand your point. The changes are platform

agnostic i.e. it doesn't break existing use cases. Are you recommending

to add a new platform and make changes there ?

Regards,

Rahul

>
>
