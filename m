From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: msm8996: Fix QMP PHY #clock-cells
Date: Mon, 03 Dec 2018 14:37:37 -0800
Message-ID: <154387665743.88331.11858773205628128165@swboyd.mtv.corp.google.com>
References: <20181129221357.67417-1-evgreen@chromium.org>
 <20181129221357.67417-3-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129221357.67417-3-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2018-11-29 14:13:55)
> Move #clock-cells into the child node and set it to 0 to conform to the
> proper binding specification.
> =

> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
