From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 6/9] coresight: add support for CPU debug module
Date: Thu, 30 Mar 2017 09:46:21 -0600
Message-ID: <CANLsYkwPYSvy2xjf8uuvx1WGWpGdMFy7kF=30VbvgW+jDvnFuw@mail.gmail.com>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-7-git-send-email-leo.yan@linaro.org> <20170328165010.GA21937@linaro.org>
 <20170329015423.GA5035@leoy-linaro> <20170329165535.GB24889@linaro.org> <20170330015941.GD3038@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170330015941.GD3038@leoy-linaro>
Sender: linux-clk-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.orgMi
List-Id: devicetree@vger.kernel.org

On 29 March 2017 at 19:59, Leo Yan <leo.yan@linaro.org> wrote:
> On Wed, Mar 29, 2017 at 10:55:35AM -0600, Mathieu Poirier wrote:
>
> [...]
>
>> > So this is why add "idle_constraint" as a central place to control
>> > power domain for CPU debug purpose and I also think this is more
>> > friendly for hardware design, e.g. some platforms can enable partial
>> > low power states to save power and avoid overheat after using this
>> > driver.
>> >
>> > How about you think for this?
>>
>> Like Sudeep pointed out we should concentrate on doing the right thing,
>> that is work with EDPRSR.PU, EDPRCR.COREPURQ and EDPRCR.CORENPDRQ.
>
> Agree, and I think we have aligned for this.
>
>> Anything outside of that becomes platform specific and can't be handled in
>> this driver.
>
> Sorry I argue a bit for this just want to make things more clear and
> if can have better method.
>
> Though the issue is platform specific, but the code is to seek common
> method to handle them. So the driver has no any platform specific code.

Seeking a common way to handle platform specific problems doesn't
scale and will never be encompassing.  There will always be a quirk
somewhere to deal with, hence the idea of keeping things separate.

>
> I read again for Suziki's suggestion: "4) Should document the fact that,
> on some platforms, the user may have to disable CPUidle explicitly to
> get the driver working. But let us not make it the default. The user
> with a not so ideal platform could add "nohlt" and get it working."

Suzuki and I are expressing the same view using different words.

>
> So I'm not strong to resist and if this is alignment yet, I should
> document well for this but doesn't handle it in driver (keep driver
> simple).
>
> Thanks,
> Leo Yan
