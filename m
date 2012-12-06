From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V6] mfd: stmpe: Update DT support for stmpe driver
Date: Thu, 6 Dec 2012 22:17:21 +0530
Message-ID: <CAKohpon3uW2N3Kaj_HkjVsUZ0+9oOHtPev=okyP50BxSKz7ntQ@mail.gmail.com>
References: <3db3266122f4c54f624477b3fb6763e5821bd3d0.1354807084.git.viresh.kumar@linaro.org>
	<20121206164054.GV2718@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121206164054.GV2718@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On 6 December 2012 22:10, Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 06 Dec 2012, Viresh Kumar wrote:
>> +     pdata->id = -1;
>
> Perhaps PLATFORM_DEVID_AUTO would be better?

Why do we want to allocate device id's for it? Multiple devices
are already distinguished and so -1 would be better.

>> +     pdata->irq_trigger = IRQF_TRIGGER_NONE;
>> +
>
> There's no need for this. It's guaranteed to be zero by:
>
>   pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);

I kept it so that in future others don't think that we missed handling
of irq_trigger for DT case.

--
viresh
