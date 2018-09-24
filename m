Return-Path: <robherring2@gmail.com>
Message-ID: <5baa1afb.1c69fb81.498e2.432f@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] regulators: qcom: Add PMS405 regulators
References: <20180920014020.14408-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180920014020.14408-1-bjorn.andersson@linaro.org>
Date: Mon, 24 Sep 2018 15:12:57 -0700
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 19 Sep 2018 18:40:20 -0700, Bjorn Andersson wrote:
> The PMS405 provdies 5 SMPS regulators and 13 LDOs, add these to the RPM
> regulator driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../regulator/qcom,smd-rpm-regulator.txt      | 23 ++++++
>  drivers/regulator/qcom_smd-regulator.c        | 77 +++++++++++++++++++
>  2 files changed, 100 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
