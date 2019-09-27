From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 07/15] dt-bindings: thermal: tsens: Convert over to a
 yaml schema
Date: Fri, 27 Sep 2019 11:29:29 -0500
Message-ID: <20190927162929.GA27130@bogus>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
 <805a2ae9c95f41dc733ccc80346941998e1b230c.1569015835.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <805a2ae9c95f41dc733ccc80346941998e1b230c.1569015835.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org, masneyb@onstation.org, swboyd@chromium.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 20 Sep 2019 14:52:22 -0700, Amit Kucheria wrote:
> Older IP only supports the 'uplow' interrupt, but newer IP supports
> 'uplow' and 'critical' interrupts. Document interrupt support in the
> tsens driver by converting over to a YAML schema.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  .../bindings/thermal/qcom-tsens.txt           |  55 ------
>  .../bindings/thermal/qcom-tsens.yaml          | 168 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 169 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/qcom-tsens.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
