From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: msm8916: Set 'xo_board' as ref clock of
 the DSI PHY
Date: Tue, 04 Dec 2018 08:46:25 -0800
Message-ID: <154394198550.88331.230677771077664270@swboyd.mtv.corp.google.com>
References: <20181201005254.139908-1-mka@chromium.org>
 <20181201005254.139908-7-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181201005254.139908-7-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Airlie <airlied@linux.ie>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Matthias Kaehlcke (2018-11-30 16:52:52)
> Add 'xo_board' as ref clock for the DSI PHYs, it was previously
> hardcoded in the PLL 'driver' for the 28nm PHY.
> =

> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
