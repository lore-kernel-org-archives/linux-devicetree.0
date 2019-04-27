From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv1 0/2] qcom: pms405: adc fixes
Date: Fri, 26 Apr 2019 21:38:59 -0700
Message-ID: <20190427043859.GC3137@builder>
References: <cover.1553088982.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1553088982.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 20 Mar 06:39 PDT 2019, Amit Kucheria wrote:

> A couple of fixes to the adc node in PMS405 to get thermistors to work
> correctly.
> 
> Amit Kucheria (2):
>   arm64: dts: qcom: pms405: calibrate the VADC correctly
>   arm64: dts: qcom: pms405: Rename adc outputs as per schematics
> 

Picked up the pair

Thanks,
Bjorn

>  arch/arm64/boot/dts/qcom/pms405.dtsi | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> -- 
> 2.17.1
> 
