From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: opp: Introduce opp-peak-KBps and
 opp-avg-KBps bindings
Date: Tue, 23 Jul 2019 17:18:31 -0700
Message-ID: <CAGETcx9GkwDJHBuFBRheMqR80=JWnXa4xtPqQ+2xHcfvSd55+A@mail.gmail.com>
References: <20190703011020.151615-1-saravanak@google.com> <20190703011020.151615-2-saravanak@google.com>
 <98b2e315-e8da-80ad-1ef8-e6b222c1c6fe@codeaurora.org> <CAGETcx9KSqvyzbM-S8LvBObkNBt38K683Ljm8nNQuhxk7MuvAg@mail.gmail.com>
 <20190722233501.GA19594@bogus> <CAGETcx9GzQj0ZHNF+uR2cGHUkQ5sOPYEwyXKK1dJ2sJbHVSVyw@mail.gmail.com>
 <CAL_JsqJeGK2m6hVEqvFxW6dEhi22LXaRKgb5JmnJfmCp+J6XuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJeGK2m6hVEqvFxW6dEhi22LXaRKgb5JmnJfmCp+J6XuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sibi Sankar <sibis@codeaurora.org>, Georgi Djakov <georgi.djakov@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 7:27 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 22, 2019 at 5:41 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Mon, Jul 22, 2019 at 4:35 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Jul 16, 2019 at 11:58:08AM -0700, Saravana Kannan wrote:
> > > > On Tue, Jul 16, 2019 at 10:25 AM Sibi Sankar <sibis@codeaurora.org> wrote:
> > > > >
> > > > > Hey Saravana,
> > > > >
> > > > > https://patchwork.kernel.org/patch/10850815/
> > > > > There was already a discussion ^^ on how bandwidth bindings were to be
> > > > > named.
> > > >
> > > > Yes, I'm aware of that series. That series is trying to define a BW
> > > > mapping for an existing frequency OPP table. This patch is NOT about
> > > > adding a mapping to an existing table. This patch is about adding the
> > > > notion of BW OPP tables where BW is the "key" instead of "frequency".
> > > >
> > > > So let's not mixed up these two series.
> > >
> > > Maybe different reasons, but in the end we'd end up with 2 bandwidth
> > > properties. We need to sort out how they'd overlap/coexist.
> >
> > Oh, I totally agree! My point is that the other mapping isn't the
> > right approach because it doesn't handle a whole swath of use cases.
> > The one I'm proposing can act as a super set of the other (as in, can
> > handle that use case too).
> >
> > > The same comment in that series about defining a standard unit suffix
> > > also applies to this one.
> >
> > I thought I read that whole series and I don't remember reading about
> > the unit suffix. But I'll take a closer look. I've chosen to keep the
> > DT units at least as "high of a resolution" as what the APIs accept
> > today. The APIs take KB/s. So I make sure DT can capture KB/s
> > differences. If we all agree that KB/s is "too accurate" then I think
> > we should change everything to MB/s.
>
> Either one is fine with me, but trying to align to what the OS picked
> doesn't work. What does BSD use for example? More important is
> aligning across DT properties so we don't have folks picking whatever
> random unit they like. We generally try to go with the smallest units
> that will have enough (32-bit) range for everyone, so that's probably
> KB/s here.

Yeah, that makes sense.

-Saravana
