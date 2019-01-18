From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 3/8] arm64: dts: sdm845: Add UFS PHY reset
Date: Fri, 18 Jan 2019 14:20:26 -0800
Message-ID: <154785002671.169631.10875218484757543459@swboyd.mtv.corp.google.com>
References: <20190111230129.127037-1-evgreen@chromium.org> <20190111230129.127037-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111230129.127037-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2019-01-11 15:01:24)
> Wire up the reset controller in the Qcom UFS controller for the PHY.
> This will be used to toggle PHY reset during initialization of the PHY.
>=20
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
