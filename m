From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v7 3/5] arm64: dts: qcom: sdm845: add UFS controller
Date: Thu, 10 Jan 2019 16:19:37 -0800
Message-ID: <CAE=gft7sGJ4dJDdJMMf4B36rLCpSNmULophrp7GEk=wBq+ZhdQ@mail.gmail.com>
References: <20181210192826.241350-1-evgreen@chromium.org> <20181210192826.241350-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210192826.241350-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Mon, Dec 10, 2018 at 11:28 AM Evan Green <evgreen@chromium.org> wrote:
>
> Add the UFS controller and PHY to SDM845.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> ---
> As Doug mentioned in v2, this should land after (or with) the driver fix
> in this series.
>
> Changes in v7: None
> Changes in v6:
> - Removed resets and reset-names (Bjorn)
> - Renamed nodes (Bjorn)
>
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Renamed ufsphy to phy (Vivek)
> - Removed #clock-cells (Vivek)
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 64 ++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>

Patches 3, 4, and 5 of this series should be ready to go. Any reason
they never got picked up? Were you just waiting for patches 1 and 2 to
show up from Kishon?


-Evan
