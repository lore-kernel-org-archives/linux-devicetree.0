From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: opp: Introduce opp-peak-KBps and
 opp-avg-KBps bindings
Date: Mon, 22 Jul 2019 17:35:01 -0600
Message-ID: <20190722233501.GA19594@bogus>
References: <20190703011020.151615-1-saravanak@google.com>
 <20190703011020.151615-2-saravanak@google.com>
 <98b2e315-e8da-80ad-1ef8-e6b222c1c6fe@codeaurora.org>
 <CAGETcx9KSqvyzbM-S8LvBObkNBt38K683Ljm8nNQuhxk7MuvAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGETcx9KSqvyzbM-S8LvBObkNBt38K683Ljm8nNQuhxk7MuvAg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Sibi Sankar <sibis@codeaurora.org>, Georgi Djakov <georgi.djakov@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 16, 2019 at 11:58:08AM -0700, Saravana Kannan wrote:
> On Tue, Jul 16, 2019 at 10:25 AM Sibi Sankar <sibis@codeaurora.org> wrote:
> >
> > Hey Saravana,
> >
> > https://patchwork.kernel.org/patch/10850815/
> > There was already a discussion ^^ on how bandwidth bindings were to be
> > named.
> 
> Yes, I'm aware of that series. That series is trying to define a BW
> mapping for an existing frequency OPP table. This patch is NOT about
> adding a mapping to an existing table. This patch is about adding the
> notion of BW OPP tables where BW is the "key" instead of "frequency".
> 
> So let's not mixed up these two series.

Maybe different reasons, but in the end we'd end up with 2 bandwidth 
properties. We need to sort out how they'd overlap/coexist.

The same comment in that series about defining a standard unit suffix 
also applies to this one.

Rob
