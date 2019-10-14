From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 GCC clock bindings
Date: Mon, 14 Oct 2019 11:49:53 -0500
Message-ID: <20191014164953.GA21327@bogus>
References: <20191014102308.27441-1-tdas@codeaurora.org>
 <20191014102308.27441-4-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014102308.27441-4-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette =?iso-8859-1?Q?=A0?= <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Oct 2019 15:53:06 +0530, Taniya Das wrote:
> The GCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt    |  94 ----------
>  .../devicetree/bindings/clock/qcom,gcc.yaml   | 174 ++++++++++++++++++
>  2 files changed, 174 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
