From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sdm845: Fix QMP PHY #clock-cells
Date: Mon, 03 Dec 2018 14:37:56 -0800
Message-ID: <154387667618.88331.14674785921714656321@swboyd.mtv.corp.google.com>
References: <20181129221357.67417-1-evgreen@chromium.org>
 <20181129221357.67417-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129221357.67417-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2018-11-29 14:13:56)
> Move #clock-cells into the child node for instances of the qcom-qmp-phy
> nodes, and set it to zero, in accordance with the proper bindings. PHYs
> that don't provide clocks don't have #clock-cells, and so are left alone.
> =

> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
