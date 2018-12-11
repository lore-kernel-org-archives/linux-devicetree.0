From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 08/10] PM / Domains: Add a simple_opp_to_performance_state() helper
Date: Tue, 11 Dec 2018 13:33:47 -0800
Message-ID: <154456402728.17204.32625663426080532@swboyd.mtv.corp.google.com>
References: <20181211094938.25086-1-rnayak@codeaurora.org> <20181211094938.25086-9-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211094938.25086-9-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-11 01:49:36)
> Now that we have atleast 2 genpd providers, both using a simple
> routine to read a performance state value from device tree and
> return it, in order to implement the .opp_to_performance_state
> callback, add a simple_opp_to_performance_state() helper to do
> it, so it can be resued across all such genpd providers which
> just need to read the value from DT.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
