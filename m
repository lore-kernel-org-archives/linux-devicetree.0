From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for
 pm8005,pm8998,pmi8998
Date: Thu, 26 Apr 2018 22:14:49 -0500
Message-ID: <20180427031449.ift6o6w3feyef2py@rob-hp-laptop>
References: <20180419230032.13611-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180419230032.13611-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 19, 2018 at 04:00:32PM -0700, Stephen Boyd wrote:
> Add the compatibles and PMIC ids for the pm8005, pm8998, and pmi8998
> PMICS found on MSM8998 and SDM845 based platforms.
> 
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 3 +++
>  drivers/mfd/qcom-spmi-pmic.c                             | 6 ++++++
>  2 files changed, 9 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
