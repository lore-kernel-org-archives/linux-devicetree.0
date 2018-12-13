From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v6 10/10] soc: qcom: rpmhpd: Mark mx as a parent for cx
Date: Thu, 13 Dec 2018 17:02:43 +0100
Message-ID: <CAPDyKFrY_9qHq_3NGHpOxCLRDV-D4RiaKm_Wckqxa5ukHcEt+Q@mail.gmail.com>
References: <20181211094938.25086-1-rnayak@codeaurora.org> <20181211094938.25086-11-rnayak@codeaurora.org>
 <CAPDyKFof-rkzmzibWOrAhDFysU=y+C8Bp0cK=_iht4=vmv-0vw@mail.gmail.com>
 <00d91f90-ccf1-3486-0d42-0c4105058e61@codeaurora.org> <154456502486.17204.11345601448030201032@swboyd.mtv.corp.google.com>
 <1c493bce-af67-2a4b-f903-8d39c39f7367@codeaurora.org> <154463956571.17204.13154447854211552369@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154463956571.17204.13154447854211552369@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Dec 2018 at 19:32, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rajendra Nayak (2018-12-11 20:13:13)
> >
> > >>> Just to make sure there are no conflicting hierarchical constraints
> > >>> between idle management and performance state management!?
> > >>>
> > >
> > > I'm not sure what idle states mean to the CX and MX domains. Would it be
> > > some sort of idle state governor attached at genpd creation time that
> > > would adjust the main SoC power rails when all devices attached are
> > > idle? Maybe I don't understand how idle states are different from
> > > performance states.
> > > My understanding is that devices using these domains would almost always
> > > expect their clk frequency and clk on/off state to decide what the
> > > performance state is, unless they need to ignore clk state because they
> > > aren't managing clks and bump up the voltage directly when the device is
> > > active. Either way, devices are actively managing the voltage they need
> > > these voltage domains to operate at by using the genpd performance
> > > states APIs.
> >
> > I am not quite sure whats the point that you are trying to make here,
> > but this is what I would expect the users of these genpds to do,
> > regardless of if they have a clk dependency or not.
> > When the device is active, vote for a performance state they need
> > then request for the genpd to be on. When they are idle, request for the
> > genpd to be turned off.
> >
>
> I believe Ulf is asking because he's proposing to make genpd idle states
> and genpd performance states orthogonal to each other. And to also make
> performance states unaffected by the on/off state of the genpd.

Yes, that's one of the reasons.

Anyway, I appreciate both of yours descriptive feedback, no further
worries from my side!

Kind regards
Uffe
