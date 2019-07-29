From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 0/6] Introduce Bandwidth OPPs for interconnect paths
Date: Mon, 29 Jul 2019 14:54:54 +0530
Message-ID: <20190729092454.6lfqzmhkvrhpimsp@vireshk-i7>
References: <20190703011020.151615-1-saravanak@google.com>
 <20190717103220.f7cys267hq23fbsb@vireshk-i7>
 <CAGETcx-tbjVzRKW8D-564zgNOhrA_z-NC1q5U70bhoUDBhp6VA@mail.gmail.com>
 <20190718053746.64drmonk72vwnt4s@vireshk-i7>
 <CAGETcx_-=b3An9YdxLUnZap=0iaeczvWTEnw65FMLU8BwA3HfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGETcx_-=b3An9YdxLUnZap=0iaeczvWTEnw65FMLU8BwA3HfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 18-07-19, 21:12, Saravana Kannan wrote:
> On Wed, Jul 17, 2019 at 10:37 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > I would like
> > to put this data in the GPU OPP table only. What about putting a
> > range in the GPU OPP table for the Bandwidth if it can change so much
> > for the same frequency.
> 
> I don't think the range is going to work.

Any specific reason for that ?

> If a GPU is doing purely
> computational work, it's not unreasonable for it to vote for the
> lowest bandwidth for any GPU frequency.

I think that is fine, but if the GPU is able to find how much
bandwidth it needs why can't it just pass that value without needing
to have another OPP table for the path ?

The interconnect can then take all the requests and have its own OPP
table to get help on deciding what stable bandwidth to use.

-- 
viresh
