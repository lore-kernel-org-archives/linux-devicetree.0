From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v7 10/10] soc: qcom: rpmhpd: Mark mx as a parent for cx
Date: Wed, 12 Dec 2018 10:25:29 -0800
Message-ID: <154463912916.17204.12857180383621384088@swboyd.mtv.corp.google.com>
References: <20181212092131.13046-1-rnayak@codeaurora.org> <20181212092131.13046-11-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212092131.13046-11-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-12 01:21:31)
> Specify the active + sleep and active-only MX power domains as
> the parents of the corresponding CX power domains. This will ensure that
> performance state requests on CX automatically generate equivalent reques=
ts
> on MX power domains.
>=20
> This is used to enforce a requirement that exists for various
> hardware blocks on SDM845 that MX performance state >=3D CX performance
> state for a given operating frequency.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
