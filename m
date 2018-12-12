From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v7 06/10] soc: qcom: rpmhpd: Add RPMh power domain driver
Date: Wed, 12 Dec 2018 10:25:03 -0800
Message-ID: <154463910365.17204.887912933771153560@swboyd.mtv.corp.google.com>
References: <20181212092131.13046-1-rnayak@codeaurora.org> <20181212092131.13046-7-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212092131.13046-7-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-12 01:21:27)
> The RPMh power domain driver aggregates the corner votes from various
> consumers for the ARC resources and communicates it to RPMh.
>=20
> With RPMh we use 2 different numbering space for corners, one used
> by the clients to express their performance needs, and another used
> to communicate to RPMh hardware.
>=20
> The clients express their performance requirements using a sparse
> numbering space which are mapped to meaningful levels like RET, SVS,
> NOMINAL, TURBO etc which then get mapped to another number space
> between 0 and 15 which is communicated to RPMh. The sparse number space,
> also referred to as vlvl is mapped to the continuous number space of 0
> to 15, also referred to as hlvl, using command DB.
>=20
> Some power domain clients could request a performance state only while
> the CPU is active, while some others could request for a certain
> performance state all the time regardless of the state of the CPU.
> We handle this by internally aggregating the votes from both type of
> clients and then send the aggregated votes to RPMh.
>=20
> There are also 3 different types of votes that are comunicated to RPMh
> for every resource.
> 1. ACTIVE_ONLY:
>         This specifies the requirement for the resource when the CPU is
>         active
> 2. SLEEP:
>         This specifies the requirement for the resource when the CPU is
>         going to sleep
> 3. WAKE_ONLY:
>         This specifies the requirement for the resource when the CPU is
>         coming out of sleep to active state
>=20
> We add data for all power domains on sdm845 SoC as part of the patch.
> The driver can be extended to support other SoCs which support RPMh
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
