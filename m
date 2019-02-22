From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/7] clk: gcc-qcs404: Add PCIe resets
Date: Fri, 22 Feb 2019 13:54:36 -0600
Message-ID: <20190222195436.GA26101@bogus>
References: <20190219060407.15263-1-bjorn.andersson@linaro.org>
 <20190219060407.15263-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219060407.15263-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 18, 2019 at 10:04:01PM -0800, Bjorn Andersson wrote:
> Enabling PCIe requires several of the PCIe related resets from GCC, so
> add them all.
> 
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/clk/qcom/gcc-qcs404.c               | 7 +++++++
>  include/dt-bindings/clock/qcom,gcc-qcs404.h | 7 +++++++
>  2 files changed, 14 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
