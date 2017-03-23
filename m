From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC 3/8] cpufreq: imx6q: Set max suspend_freq to avoid changes
 during suspend
Date: Thu, 23 Mar 2017 10:04:27 +0530
Message-ID: <20170323043427.GE12094@vireshk-i7>
References: <cover.1490199005.git.leonard.crestez@nxp.com>
 <f2126423e233757eb113f115e0be562ea0902a7a.1490199005.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f2126423e233757eb113f115e0be562ea0902a7a.1490199005.git.leonard.crestez@nxp.com>
Sender: linux-pm-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Robin Gong <yibin.gong@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Irina Tirdea <irina.tirdea@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, Octavian Purdila <octavian.purdila@nxp.com>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 22-03-17, 18:53, Leonard Crestez wrote:
> If the cpufreq driver tries to modify voltage/freq during suspend/resume
> it might need to control an external PMIC via I2C or SPI but those
> devices might be already suspended.
> 
> To avoid this scenario we just increase cpufreq to highest setpoint
> before suspend. This issue can easily be triggered by ldo-bypass but in
> theory any regulator set_voltage call can end up having to modify
> external supply voltages.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
>  drivers/cpufreq/imx6q-cpufreq.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
