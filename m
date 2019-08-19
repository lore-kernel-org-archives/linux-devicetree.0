From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [v4, 6/8] PM / OPP: Support adjusting OPP voltages at runtime
Date: Mon, 19 Aug 2019 16:48:36 +0530
Message-ID: <20190819111836.5cu245xre6ky6xav@vireshk-i7>
References: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1565703113-31479-7-git-send-email-andrew-sh.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565703113-31479-7-git-send-email-andrew-sh.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, fan.chen@mediatek.com, Stephen Boyd <sboyd@codeaurora.org>, Roger Lu <roger.lu@mediatek.com>
List-Id: devicetree@vger.kernel.org

On 13-08-19, 21:31, Andrew-sh.Cheng wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> 
> On some SoCs the Adaptive Voltage Scaling (AVS) technique is
> employed to optimize the operating voltage of a device. At a
> given frequency, the hardware monitors dynamic factors and either
> makes a suggestion for how much to adjust a voltage for the
> current frequency, or it automatically adjusts the voltage
> without software intervention. Add an API to the OPP library for
> the former case, so that AVS type devices can update the voltages
> for an OPP when the hardware determines the voltage should
> change. The assumption is that drivers like CPUfreq or devfreq
> will register for the OPP notifiers and adjust the voltage
> according to suggestions that AVS makes.
> 
> This patch is devired from [1] submitted by Stephen.
> [1] https://lore.kernel.org/patchwork/patch/599279/
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  drivers/opp/core.c     | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h | 11 +++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index c094d5d20fd7..407a07f29b12 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2054,6 +2054,69 @@ static int _opp_set_availability(struct device *dev, unsigned long freq,
>  }
>  
>  /**
> + * dev_pm_opp_adjust_voltage() - helper to change the voltage of an OPP
> + * @dev:		device for which we do this operation
> + * @freq:		OPP frequency to adjust voltage of
> + * @u_volt:		new OPP voltage
> + *
> + * Return: -EINVAL for bad pointers, -ENOMEM if no memory available for the
> + * copy operation, returns 0 if no modifcation was done OR modification was
> + * successful.
> + */
> +int dev_pm_opp_adjust_voltage(struct device *dev, unsigned long freq,
> +			      unsigned long u_volt)

Can you please update this to take a triplet instead ? That is what we are
storing in OPP core now a days.

-- 
viresh
