From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 0/3] Introduce Bandwidth OPPs for interconnects
Date: Tue, 30 Jul 2019 08:16:40 +0530
Message-ID: <20190730024640.xk27jgdfl2j6ucx7@vireshk-i7>
References: <20190726231558.175130-1-saravanak@google.com>
 <20190729093545.kvnqxjkyx4nogddk@vireshk-i7>
 <CAGETcx8OBFGgP1-hj717Sk-_N95-kacVsz0yb288n3pej12n1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGETcx8OBFGgP1-hj717Sk-_N95-kacVsz0yb288n3pej12n1Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 29-07-19, 13:16, Saravana Kannan wrote:
> Sibi might be working on doing that for the SDM845 CPUfreq driver.
> Georgi could also change his GPU driver use case to use this BW OPP
> table and required-opps.
> 
> The problem is that people don't want to start using this until we
> decide on the DT representation. So it's like a chicken and egg
> situation.

Yeah, I agree to that.

@Georgi and @Sibi: This is your chance to speak up about the proposal
from Saravana and if you find anything wrong with them. And specially
that it is mostly about interconnects here, I would like to have an
explicit Ack from Georgi on this.

And if you guys are all okay about this then please at least commit
that you will convert your stuff based on this in coming days.

-- 
viresh
