From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v4 0/3] Introduce Bandwidth OPPs for interconnects
Date: Tue, 30 Jul 2019 10:58:43 +0530
Message-ID: <361effba-4433-24d9-243c-201af39214cc@codeaurora.org>
References: <20190726231558.175130-1-saravanak@google.com>
 <20190729093545.kvnqxjkyx4nogddk@vireshk-i7>
 <CAGETcx8OBFGgP1-hj717Sk-_N95-kacVsz0yb288n3pej12n1Q@mail.gmail.com>
 <20190730024640.xk27jgdfl2j6ucx7@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730024640.xk27jgdfl2j6ucx7@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hey Viresh,

On 7/30/19 8:16 AM, Viresh Kumar wrote:
> On 29-07-19, 13:16, Saravana Kannan wrote:
>> Sibi might be working on doing that for the SDM845 CPUfreq driver.
>> Georgi could also change his GPU driver use case to use this BW OPP
>> table and required-opps.
>>
>> The problem is that people don't want to start using this until we
>> decide on the DT representation. So it's like a chicken and egg
>> situation.
> 
> Yeah, I agree to that.
> 
> @Georgi and @Sibi: This is your chance to speak up about the proposal
> from Saravana and if you find anything wrong with them. And specially
> that it is mostly about interconnects here, I would like to have an
> explicit Ack from Georgi on this.
> 
> And if you guys are all okay about this then please at least commit
> that you will convert your stuff based on this in coming days.

I've been using both Saravana's and Georgi's series for a while
now to scale DDR and L3 on SDM845. There is currently no consensus
as to where the votes are to be actuated from, hence couldn't post
anything out.

DCVS based on Saravana's series + passive governor:
https://github.com/QuinAsura/linux/tree/lnext-072619-SK-series

DCVS based on Georgi's series: (I had already posted this out)
https://github.com/QuinAsura/linux/tree/lnext-072619-GJ-series

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
