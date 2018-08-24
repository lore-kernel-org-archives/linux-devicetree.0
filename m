From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sdm845-mtp: Add RPMh VRM/XOB regulators
Date: Fri, 24 Aug 2018 09:13:17 -0700
Message-ID: <153512719741.28926.12143989866944999581@swboyd.mtv.corp.google.com>
References: <20180822173629.202885-1-dianders@chromium.org>
 <20180822173629.202885-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822173629.202885-3-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, tfiga@chromium.org, Manu Gautam <mgautam@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Douglas Anderson (2018-08-22 10:36:28)
> Add regulator devices for PMIC regulators managed via VRM and XOB
> RPMh accelerators.
> =

> A few notes here:
> - Regulators are added directly to the board file.  While it's true
>   that this will mean a bunch of copy/pasting for other boards that
>   are very similar, this is probably the right call since boards
>   could make changes to the way these regulators are hooked up and
>   trying to find a way to avoid duplication will result in some
>   confusing node overrides.
> - Regulators that are hooked up to supply pins on the SoC are given
>   an alias matching the name of that pin (pin name comes from the
>   Qualcomm SoC "device specification" doc).
> - Other regulator labels are based on the schematic.  If there is
>   more than one logical name on the schematic for the same rail the
>   secondary names are also listed and should be referred to as
>   appropriate.
> - Regulators all default to HPM mode w/ no ability to switch modes.
>   Future patches can switch things to LPM and possibly add
>   dynamic load switching if we have determined there's a benefit.
>   This should only be done for rails where we'll actually be able
>   to take advantage of the lower power modes so we don't need to
>   churn with lots of patches adding regulator_set_load() calls
>   to drivers.
> =

> NOTE: This patch is loosely based on one originally shared to me by
> David Collins.
> =

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
