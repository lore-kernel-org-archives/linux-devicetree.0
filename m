From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: sdm845: Add parent clock for rpmhcc
Date: Mon, 26 Aug 2019 14:21:54 -0700
Message-ID: <20190826212155.CBFB121872@mail.kernel.org>
References: <20190826174233.21213-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826174233.21213-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-26 10:42:33)
> RPM clock controller has parent as xo, so specify that in DT node for
> rpmhcc
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
