Return-Path: <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v9 0/2] J-Core timer support
References: <cover.1476393790.git.dalias@libc.org> <20161017093013.GA1703@mai>
 <20161020012225.GK19318@brightrain.aerifal.cx> <20161020073240.GF1703@mai>
 <20161020151552.GQ19318@brightrain.aerifal.cx>
 <alpine.DEB.2.20.1610201955230.4938@nanos>
 <alpine.DEB.2.20.1610202005150.4938@nanos>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <dbc37a62-76c7-ec6f-1e80-155359dcb968@linaro.org>
Date: Thu, 20 Oct 2016 20:18:11 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1610202005150.4938@nanos>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Rich Felker <dalias@libc.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 20/10/2016 20:07, Thomas Gleixner wrote:
> On Thu, 20 Oct 2016, Thomas Gleixner wrote:
>> Daniel,
>>
>> On Thu, 20 Oct 2016, Rich Felker wrote:
>>> On Thu, Oct 20, 2016 at 09:32:40AM +0200, Daniel Lezcano wrote:
>>>> Unfortunately it won't happen. v4.9-rc1 is already out. The driver will be
>>>> in v4.10.
>>>>
>>>> If you wanted patches merged for v4.9, they should have been merged in the
>>>> downstream tree before v4.8-rc5, so they hit the upstream tree for v4.9's merge
>>>> window.
>>>
>>> I've been trying to get what's essentially the same patch merged since
>>> before the 4.8 merge window. I would be more understanding if this
>>> were something new that's not upstream, but broken support for the
>>> hardware (that, from a user perspective, is a bug, since they can
>>> select the target but then it doesn't boot) has already been in one
>>> release due to missing core drivers, and the irq patches have already
>>> been merged in this release (post-rc1 even).
>>
>> It's hardware enablement and not a new feature, so it's fine to merge it
>> now. I'll pick it up later tonight.
> 
> Daniel, it's the top two commits in your 4.10 branch. So it's not a big
> deal to zap them.

Yes, sure. No problem.

Thanks!

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
