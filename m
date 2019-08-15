From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V5 5/5] arm64: dts: imx8mm: Enable cpu-idle driver
Date: Thu, 15 Aug 2019 18:12:50 +0200
Message-ID: <34c03d76-ae61-63b4-153f-3f9911cc962e@linaro.org>
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
 <20190710063056.35689-5-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710063056.35689-5-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, tglx@linutronix.de, leonard.crestez@nxp.com, aisheng.dong@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi Anson,

sorry for the late review, I've been pretty busy.

If Shawn is ok, I can pick the patches 1-4 in my tree and then this one
after you fix the comments below.

On 10/07/2019 08:30, Anson.Huang@nxp.com wrote:

[ ... ]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep_wait: cpu-sleep-wait {

Is that a retention state or a powerdown? It is preferable to change the
name to the idle state naming convention given in the PSCI documentation
[1] page 16-17


> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010033>;
> +				local-timer-stop;
> +				entry-latency-us = <1000>;
> +				exit-latency-us = <700>;
> +				min-residency-us = <2700>;
> +				wakeup-latency-us = <1500>;

It is pointless to specify the entry + exit *and* the wakeup-latency [2].

Thanks

  -- Daniel

[1]
http://infocenter.arm.com/help/topic/com.arm.doc.den0022d/Power_State_Coordination_Interface_PDD_v1_1_DEN0022D.pdf

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpuidle/dt_idle_states.c#n41



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
