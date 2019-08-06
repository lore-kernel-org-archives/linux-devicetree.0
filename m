From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v4 0/3] Introduce Bandwidth OPPs for interconnects
Date: Tue, 6 Aug 2019 18:27:09 +0300
Message-ID: <b1d2697d-bf72-3476-b9a0-0bf79cec2145@linaro.org>
References: <20190726231558.175130-1-saravanak@google.com>
 <20190729093545.kvnqxjkyx4nogddk@vireshk-i7>
 <CAGETcx8OBFGgP1-hj717Sk-_N95-kacVsz0yb288n3pej12n1Q@mail.gmail.com>
 <20190730024640.xk27jgdfl2j6ucx7@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730024640.xk27jgdfl2j6ucx7@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Saravana Kannan <saravanak@google.com>, Sibi Sankar <sibis@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 7/30/19 05:46, Viresh Kumar wrote:
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

Looks fine to me. I am already doing some testing with this patchset.
However, as Stephen already pointed out, we should s/KBps/kBps/.

Thanks,
Georgi
