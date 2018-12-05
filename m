From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 4/8] soc: qcom: rpmpd: Add support for get/set performance
 state
Date: Wed, 05 Dec 2018 12:46:34 -0800
Message-ID: <154404279451.88331.7119708379799744446@swboyd.mtv.corp.google.com>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-5-rnayak@codeaurora.org>
 <154396526967.88331.13652897075952274639@swboyd.mtv.corp.google.com>
 <d9317471-fb81-482a-22c1-4a7b466a1df4@codeaurora.org>
 <c1676ab0-5981-52be-18f3-44ee266e195d@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c1676ab0-5981-52be-18f3-44ee266e195d@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-05 02:11:22)
> =

> On 12/5/2018 12:33 PM, Rajendra Nayak wrote:
> >>
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return=C2=A00;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_node_put(np);
> >>
> >> This=C2=A0same=C2=A0code=C2=A0exists=C2=A0twice.=C2=A0Perhaps=C2=A0a=
=C2=A0helper=C2=A0needs=C2=A0to=C2=A0exist=C2=A0for
> >> qcom_rpm_get_performance()=C2=A0to=C2=A0pull=C2=A0the=C2=A0number=C2=
=A0out=C2=A0of=C2=A0the=C2=A0DT.
> > =

> > Sure=C2=A0I=C2=A0can=C2=A0make=C2=A0both=C2=A0drivers=C2=A0use=C2=A0a=
=C2=A0common=C2=A0helper=C2=A0instead=C2=A0of=C2=A0duplicating=C2=A0it.
> =

> which would mean I will need to create a new file just to define the
> common helper. Does that seem like an overkill?

Maybe put it in the genpd code and let it take a const char *name
argument that picks out the property that drivers want to look at? That
way other OPP properties can be picked out with a simple call to the
function but it's generic enough to be used in other places.
