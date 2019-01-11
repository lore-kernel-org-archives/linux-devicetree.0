From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v11 2/9] OPP: Add support for parsing the 'opp-level' property
Date: Fri, 11 Jan 2019 11:06:38 -0800
Message-ID: <154723359821.169631.14660165462556251824@swboyd.mtv.corp.google.com>
References: <20190110040209.6028-1-rnayak@codeaurora.org> <20190110040209.6028-3-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110040209.6028-3-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-01-09 20:02:02)
> Now that the OPP bindings are updated to include an optional
> 'opp-level' property, add support to parse it from device tree
> and store it as part of dev_pm_opp structure.
> Also add and export an helper 'dev_pm_opp_get_level()' that can be
> used to get the level value read from device tree when present.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
