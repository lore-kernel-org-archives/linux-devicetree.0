From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sdm845: Increase address and size cells for soc
Date: Thu, 17 Jan 2019 10:05:05 -0800
Message-ID: <154774830553.169631.17749173860111529783@swboyd.mtv.corp.google.com>
References: <20190117042940.25487-1-bjorn.andersson@linaro.org> <20190117042940.25487-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117042940.25487-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Doug Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-16 20:29:39)
> The busses on SDM845 provides 36 address bits, extend the address and
> size cells to make it possible to describe this in "ranges" and
> "dma-ranges".
>=20
> While touching all reg properties, addresses are padded to 8 digits.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
