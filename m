From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 0/6] Introduce Bandwidth OPPs for interconnect paths
Date: Mon, 29 Jul 2019 13:12:08 -0700
Message-ID: <CAGETcx_7fK20VZ6Zn07Z+Ran1_O7gSPohck_tg-aEr5oONQ5iA@mail.gmail.com>
References: <20190703011020.151615-1-saravanak@google.com> <20190717103220.f7cys267hq23fbsb@vireshk-i7>
 <CAGETcx-tbjVzRKW8D-564zgNOhrA_z-NC1q5U70bhoUDBhp6VA@mail.gmail.com>
 <20190718053746.64drmonk72vwnt4s@vireshk-i7> <CAGETcx_-=b3An9YdxLUnZap=0iaeczvWTEnw65FMLU8BwA3HfQ@mail.gmail.com>
 <20190729092454.6lfqzmhkvrhpimsp@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729092454.6lfqzmhkvrhpimsp@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 2:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-07-19, 21:12, Saravana Kannan wrote:
> > On Wed, Jul 17, 2019 at 10:37 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > I would like
> > > to put this data in the GPU OPP table only. What about putting a
> > > range in the GPU OPP table for the Bandwidth if it can change so much
> > > for the same frequency.
> >
> > I don't think the range is going to work.
>
> Any specific reason for that ?

The next sentence was literally explaining this :) Fine to debate
that, but ignoring that and asking this question is kinda funny.

> > If a GPU is doing purely
> > computational work, it's not unreasonable for it to vote for the
> > lowest bandwidth for any GPU frequency.
>
> I think that is fine, but if the GPU is able to find how much
> bandwidth it needs why can't it just pass that value without needing
> to have another OPP table for the path ?

You were asking this question in the context of "can the GPU OPP just
list all the range of bandwidth it might use per GPU frequency". My point
is that the range would be useless because it would the entire
available bandwidth range (because purely compute work might not need
any bandwidth).

Whereas, what the GPU's algorithm actually needs might be the list of
"useful" bandwidth levels to use.

Also, as we add more ICC request properties, this range idea will not scale.

-Saravana
