From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 09/10] soc: qcom: rpmpd: Use simple_opp_to_performance_state() helper
Date: Tue, 11 Dec 2018 13:34:00 -0800
Message-ID: <154456404022.17204.16925201479684260162@swboyd.mtv.corp.google.com>
References: <20181211094938.25086-1-rnayak@codeaurora.org> <20181211094938.25086-10-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211094938.25086-10-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-11 01:49:37)
> Get rid of the duplicate code across rpmpd and rpmhpd to read the
> performance state value from Device tree and use the
> simple_opp_to_performance_state() helper instead.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
