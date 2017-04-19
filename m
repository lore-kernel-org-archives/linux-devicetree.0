From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v6 6/8] coresight: add support for CPU debug module
Date: Wed, 19 Apr 2017 10:50:43 -0600
Message-ID: <CANLsYkzDPdrJUFVhyF8SNKhjyqfF9jGDtrzhLdbvoN1BmAMa7w@mail.gmail.com>
References: <1491485461-22800-1-git-send-email-leo.yan@linaro.org>
 <1491485461-22800-7-git-send-email-leo.yan@linaro.org> <20170418174050.GC22806@linaro.org>
 <20170419001807.GB8524@leoy-linaro> <CANLsYkyheVJkEjpcWAd5HHFCimfTPhgihioE7bYo1RAL=8Shdw@mail.gmail.com>
 <20170419153045.GB23319@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170419153045.GB23319@leoy-linaro>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On 19 April 2017 at 09:30, Leo Yan <leo.yan@linaro.org> wrote:
> On Wed, Apr 19, 2017 at 08:52:12AM -0600, Mathieu Poirier wrote:
>
> [...]
>
>> >> > +static bool debug_enable;
>> >> > +module_param_named(enable, debug_enable, bool, 0600);
>> >> > +MODULE_PARM_DESC(enable, "Knob to enable debug functionality "
>> >> > +            "(default is 0, which means is disabled by default)");
>> >>
>> >> For this driver we have a debugFS interface so I question the validity of a
>> >> kernel module parameter.  Other than adding complexity to the code it offers no
>> >> real added value.  If a user is to insmod a module, it is just as easy to switch
>> >> on the functionality using debugFS in a second step.
>> >
>> > This module parameter can be used for kernel command line, so
>> > it's useful when user wants to dynamically turn on/off the
>> > functionality at boot up time.
>> >
>> > Does this make sense for you? Removing this parameter is okay for
>> > me, but this means users need to decide if use it by Kernel config
>> > with static building in. This is a bit contradictory with before's
>> > discussion.
>>
>> My hope was to use the kernel command line and the debugFS interface,
>> avoiding the module parameter.  Look at what the baycom_par and
>> blacklist drivers are doing with the "__setup()" function and see if
>> we can void a module parameter.  If not then let it be, unless someone
>> else has a better idea.
>>
>> [1]. drivers/net/hamradio/baycom_par.c
>> [2]. drivers/s390/cio/blacklist.c
>
> This driver supports module mode. So we can choose to use either module
> parameter or __setup(). But as described in the file
> Documentation/admin-guide/kernel-parameters.rst, the module parameter
> is more flexible to be used at boot time or insmod the module:
>
> "Parameters for modules which are built into the kernel need to be
> specified on the kernel command line.  modprobe looks through the
> kernel command line (/proc/cmdline) and collects module parameters
> when it loads a module, so the kernel command line can be used for
> loadable modules too."
>
> __setup() cannot support module mode, and when use __setup(), we need
> register one callback function for it. The callback function is
> friendly to parse complex parameters rather than module parameter.
> but it's not necessary for this case.

__setup() definitely supports module - the baycom driver is a good
example of that.

But as you pointed out kernel-parameters.rst is pretty clear on how to
proceed.  As such disregard my comment and proceed with a module
parameter.

>
> So I'm bias to use module parameter :)
>
> Thanks,
> Leo Yan
