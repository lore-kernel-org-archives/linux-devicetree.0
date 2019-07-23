From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm845: remove unnecessary properties for dsi nodes
Date: Tue, 23 Jul 2019 07:45:17 -0700
Message-ID: <5d371d7e.1c69fb81.75d9c.87e4@mx.google.com>
References: <20190722123422.4571-1-vkoul@kernel.org> <20190722123422.4571-3-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722123422.4571-3-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-07-22 05:34:19)
> We get a warning about unnecessary properties of
>=20
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2211.22-2257.6: Warning (avoid_unnec=
essary_addr_size): /soc/mdss@ae00000/dsi@ae94000: unnecessary #address-cell=
s/#size-cells without "ranges" or child "reg" property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2278.22-2324.6: Warning (avoid_unnec=
essary_addr_size): /soc/mdss@ae00000/dsi@ae96000: unnecessary #address-cell=
s/#size-cells without "ranges" or child "reg" property
>=20
> So, remove these properties
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
