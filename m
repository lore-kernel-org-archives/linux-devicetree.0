From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 00/14] Add support for QCOM Core Power Reduction
Date: Fri, 26 Jul 2019 13:38:23 +0530
Message-ID: <20190726080823.xwhxagv5iuhudmic@vireshk-i7>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 25-07-19, 12:41, Niklas Cassel wrote:
> This series adds support for Core Power Reduction (CPR), a form of
> Adaptive Voltage Scaling (AVS), found on certain Qualcomm SoCs.
> 
> This series is based on top of the qcs404 cpufreq patch series that
> hasn't landed yet:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=137809
> 
> CPR is a technology that reduces core power on a CPU or on other device.
> It reads voltage settings from efuses (that have been written in
> production), it uses these voltage settings as initial values, for each
> OPP.
> 
> After moving to a certain OPP, CPR monitors dynamic factors such as
> temperature, etc. and adjusts the voltage for that frequency accordingly
> to save power and meet silicon characteristic requirements.
> 
> This driver has been developed together with Jorge Ramirez-Ortiz, and
> is based on an RFC by Stephen Boyd[1], which in turn is based on work
> by others on codeaurora.org[2].
> 
> [1] https://lkml.org/lkml/2015/9/18/833
> [2] https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/regulator/cpr-regulator.c?h=msm-3.10
> 
> Changes since V1:
> Added a new patch implementing dev_pm_opp_find_level_exact() in order to
> make the CPR OPP table in device tree cleaner.
> For more detailed changes, check the "Changes since V1" as comments in
> the individual patches, where applicable.

Applied patches [1-9/14] to cpufreq and OPP trees and done some
reordering as well to keep all binding patches together.

Rob's Ack is missing on two of the binding patches and I will add them
later once he provides it.

Everything should be available here for you to base rest of the stuff.

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next

-- 
viresh
