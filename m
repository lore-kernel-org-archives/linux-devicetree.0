From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] mfd: qcom-spmi-pmic: Add support for
 pm8005,pm8998,pmi8998
Date: Tue, 29 May 2018 09:38:02 +0100
Message-ID: <20180529083802.GA8038@dell>
References: <20180502163535.208548-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180502163535.208548-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 02 May 2018, Stephen Boyd wrote:

> Add the compatibles and PMIC ids for the pm8005, pm8998, and pmi8998
> PMICS found on MSM8998 and SDM845 based platforms.
> 
> Cc: <devicetree@vger.kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Changes from v1:
>  * Picked up review tags
>  * Reordered lists to be based on id numbers
> 
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 3 +++
>  drivers/mfd/qcom-spmi-pmic.c                             | 6 ++++++
>  2 files changed, 9 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
