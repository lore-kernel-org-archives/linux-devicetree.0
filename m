From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: mediatek: Add MT8173 cpufreq driver
Date: Wed, 29 Apr 2015 11:36:46 +0530
Message-ID: <CAKohpokhbh3QoDsG=2q3YGLnhhoumOkipj_zdd-JPfVSA0X5cQ@mail.gmail.com>
References: <1429522047-16675-1-git-send-email-pi-cheng.chen@linaro.org>
	<1429522047-16675-2-git-send-email-pi-cheng.chen@linaro.org>
	<20150423125620.GB29702@leverpostej>
	<CALx668W_rj8_UBory5fVa4_i3vLCjgApYCwHoSthXNmx79yH1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CALx668W_rj8_UBory5fVa4_i3vLCjgApYCwHoSthXNmx79yH1g@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
To: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Joe.C" <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, "fan.chen@mediatek.com" <fan.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 24 April 2015 at 12:20, Pi-Cheng Chen <pi-cheng.chen@linaro.org> wrote:
> So even we have a new OPP binding to describe the OPP, we have to
> leave these table as they are for backward compatibility?

Yes.

I could find the below excerpts from [1]:

"The compatibility rules say that new kernels must work with older
device trees. If changes are required, they should be put into new
properties; the old ones can then be deprecated but not removed. New
properties should be optional, so that device trees lacking those
properties continue to work. The device tree developers will provide a
set of guidelines for the creation of future-proof bindings."

--
viresh

[1] http://lwn.net/Articles/572114/
