From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sdm845: Extend ranges and describe DMA space
Date: Thu, 17 Jan 2019 10:22:36 -0800
Message-ID: <154774935672.169631.8429033154347254149@swboyd.mtv.corp.google.com>
References: <20190117042940.25487-1-bjorn.andersson@linaro.org> <20190117042940.25487-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117042940.25487-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Doug Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-16 20:29:40)
> For devices attached to an IOMMU, translation between IOVA and physical
> addresses is no longer 1:1 and dma-ranges should be specified to
> describe the available IOVA address space.
>=20
> On SDM845 the busses are implemented with 36 address bits, so dma-ranges
> must be defined to reduce the size of the IOVA address space from the 48
> bits supported by the SMMU. Without this DMA allocations may end up with
> IOVAs outside the valid range, that gets truncated by the bus between
> the device and its translation unit.
>=20
> Also extend ranges to describe the available address space.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
