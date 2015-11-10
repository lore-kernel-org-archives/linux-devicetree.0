From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 2/5] PM / OPP: Add {opp-microvolt|opp-microamp|turbo-mode|opp-suspend}-<name>
 binding
Date: Tue, 10 Nov 2015 09:37:32 -0600
Message-ID: <CAL_JsqLtDi1V2vkJDcAHRRf1Nb05Xqc9euetLNeLoZqzOB0hqA@mail.gmail.com>
References: <cover.1446687367.git.viresh.kumar@linaro.org> <17a4388be606f21fe1d31b23180d41f6cabdd4b5.1446687367.git.viresh.kumar@linaro.org>
 <20151105030245.GA20613@rob-hp-laptop> <20151105031913.GA29491@ubuntu>
 <CAL_Jsq+sKbn9Jsp6LjfwO59Ceps3zrL8eABXw74m3A25M8bjJg@mail.gmail.com>
 <20151106015321.GF3773@ubuntu> <20151110145505.GB5408@ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20151110145505.GB5408@ubuntu>
Sender: linux-pm-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, Stephen Boyd <sboyd@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nishanth Menon <nm@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, open list <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 10, 2015 at 8:55 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 06-11-15, 07:23, Viresh Kumar wrote:
>> Yeah, but in that case 1200 *may* not be a turbo frequency anymore, as
>> the voltage constraints might have changed.
>>
>> So turbo frequency is something that should be used only in small
>> bursts, as they are consume lot of power. They aren't available to be
>> used freely. They may also have thermal side effects..
>>
>> In a similar way, for suspend-freq, we may or may not want the lowest
>> frequency to be used during suspend and so that can change as well.
>> And we shouldn't have suspend-freq set for two OPP nodes.
>
> @Rob: Does my comments make any sense now? Or you still think we are
> doing something wrong here?

What you said could be possible, but I'm still doubtful. I would drop
these until you have an actual user.

Rob
