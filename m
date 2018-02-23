Return-Path: <SRS0=tGmj=FR=rock-chips.com=shawn.lin@kernel.org>
Subject: Re: [PATCH 1/6] mmc: dw_mmc: remove the deprecated
 "clock-freq-min-max" property
References: <CGME20180223064140epcas2p104fe6cca431ec24f2b09a6f5a45ed342@epcas2p1.samsung.com>
 <20180223064138.18401-1-jh80.chung@samsung.com>
 <CAHp75Vd27mFnSJTOta0ZWhfOGz1WA8ETNgU_GpuxEJ9nnhsR-g@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <7ba335af-3fc5-2afd-8c52-03dca5eba9a4@rock-chips.com>
Date: Fri, 23 Feb 2018 22:19:42 +0800
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd27mFnSJTOta0ZWhfOGz1WA8ETNgU_GpuxEJ9nnhsR-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, shawn.lin@rock-chips.com, linux-mmc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joachim Eastwood <manabian@gmail.com>, dinguyen@kernel.org, Will Deacon <will.deacon@arm.com>, "xuwei (O)" <xuwei5@hisilicon.com>
List-ID: <devicetree@vger.kernel.org>

Hi Andy,

On 2018/2/23 21:27, Andy Shevchenko wrote:
> On Fri, Feb 23, 2018 at 8:41 AM, Jaehoon Chung <jh80.chung@samsung.com> wrote:
>> 'clock-freq-min-max' property had already deprecated.
>> Remove the 'clock-freq-min-max' property that is kept to maintain
>> the compatibility.
> 
> Removing a property without telling the user what to expect is a bad
> idea and ABI breakage.
> 

What's the general process to remove a property?

I guess we should do:
1) deprecate it in the first place and remove it from all upstream DT
2) wait some long enough days for expecting the stale of all old DTB
containing that property
3) remove the functionality of the deprecated property from the driver
but still leave some warning there
4) remove the left warning finally

And for the ABI breakage, we should add something in Documentation/ABI
/obsolete  or Documentation/ABI/removed ?

-- 
Best Regards
Shawn Lin
