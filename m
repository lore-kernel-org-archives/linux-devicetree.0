From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 10/10] soc: qcom: rpmhpd: Mark mx as a parent for cx
Date: Tue, 11 Dec 2018 13:50:24 -0800
Message-ID: <154456502486.17204.11345601448030201032@swboyd.mtv.corp.google.com>
References: <20181211094938.25086-1-rnayak@codeaurora.org> <20181211094938.25086-11-rnayak@codeaurora.org> <CAPDyKFof-rkzmzibWOrAhDFysU=y+C8Bp0cK=_iht4=vmv-0vw@mail.gmail.com> <00d91f90-ccf1-3486-0d42-0c4105058e61@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00d91f90-ccf1-3486-0d42-0c4105058e61@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-11 02:33:23)
>=20
>=20
> On 12/11/2018 3:52 PM, Ulf Hansson wrote:
> > On Tue, 11 Dec 2018 at 10:50, Rajendra Nayak <rnayak@codeaurora.org> wr=
ote:
> >>
> >> Specify the active + sleep and active-only MX power domains as
> >> the parents of the corresponding CX power domains. This will ensure th=
at
> >> performance state requests on CX automatically generate equivalent req=
uests
> >> on MX power domains.
> >>
> >> This is used to enforce a requirement that exists for various
> >> hardware blocks on SDM845 that MX performance state >=3D CX performance
> >> state for a given operating frequency.
> >=20
> > I assume that also means the MX power domain must not be power off as
> > long as the CX power domain is powered on?
>=20
> So with rpmh, there's really no separate on/off control, we just put
> it in the lowest perf state at off.

I think in theory the answer is MX can't be off if CX is on, but in
reality, MX and CX are never turned off, just set to something really
low and even then the constraint applies for MX >=3D CX. Is that right?

>=20
> >=20
> > Just to make sure there are no conflicting hierarchical constraints
> > between idle management and performance state management!?
> >=20

I'm not sure what idle states mean to the CX and MX domains. Would it be
some sort of idle state governor attached at genpd creation time that
would adjust the main SoC power rails when all devices attached are
idle? Maybe I don't understand how idle states are different from
performance states.

My understanding is that devices using these domains would almost always
expect their clk frequency and clk on/off state to decide what the
performance state is, unless they need to ignore clk state because they
aren't managing clks and bump up the voltage directly when the device is
active. Either way, devices are actively managing the voltage they need
these voltage domains to operate at by using the genpd performance
states APIs.
