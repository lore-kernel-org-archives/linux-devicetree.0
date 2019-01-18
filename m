From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 4/8] arm64: dts: msm8996: Add UFS PHY reset controller
Date: Fri, 18 Jan 2019 14:20:38 -0800
Message-ID: <154785003879.169631.14118359438599821275@swboyd.mtv.corp.google.com>
References: <20190111230129.127037-1-evgreen@chromium.org> <20190111230129.127037-5-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111230129.127037-5-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2019-01-11 15:01:25)
> Add the reset controller for the UFS controller, and wire it up
> so that the UFS PHY can initialize itself without relying on
> implicit sequencing between the two drivers.
>=20
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
