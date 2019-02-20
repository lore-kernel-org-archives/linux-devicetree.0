From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v1 00/12] qcom: dts: thermal cleanups
Date: Tue, 19 Feb 2019 17:26:42 -0800
Message-ID: <20190220012641.GH2811@localhost.localdomain>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hey
On Mon, Feb 18, 2019 at 06:05:14PM +0530, Amit Kucheria wrote:
> - Expose all temperature sensors on msm8916, msm996, msm8998, sdm845
> - split up the register address map for msm8998
> - standardize names of the various thermal-zones across boards to make it
>   easy for test scripts to parse
> 

I am generally fine with the effort but please fix the following
(applies for the whole series) wrt to required properties for DT
thermal:
a. Trip points for your zones
b. Cooling Mappings for zones that have passive trips.

> Amit Kucheria (12):
>   arm64: dts: msm8998: thermal: split address space into two
>   arm64: dts: msm8998: efficiency is not valid property
>   arm64: dts: msm8916: thermal: Add sensor for modem
>   arm64: dts: msm8996: thermal: Add temperature sensors near major
>     peripherals
>   arm64: dts: msm8998: thermal: Fix the cpu sensor numbers
>   arm64: dts: msm8998: thermal: Fix the gpu sensor number
>   arm64: dts: msm8998: thermal: GPU has two sensors, add the second
>   arm64: dts: msm8998: thermal: Add temperature sensors near major
>     peripherals
>   arm64: dts: sdm845: thermal: Add temperature sensors near major
>     peripherals
>   arm64: dts: msm8998: thermal: Make trip names consistent
>   arm64: dts: msm8916: thermal: Make trip names consistent
>   arm64: dts: msm8996: thermal: Make trip names consistent
> 
>  arch/arm64/boot/dts/qcom/msm8916.dtsi |  30 +++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 122 ++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 154 ++++++++++++++++++--------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi  |  91 +++++++++++++++
>  4 files changed, 328 insertions(+), 69 deletions(-)
> 
> -- 
> 2.17.1
> 
