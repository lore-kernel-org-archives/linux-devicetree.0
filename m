From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V6 4/4] arm64: dts: imx8mm: Enable cpu-idle driver
Date: Fri, 16 Aug 2019 11:59:59 +0200
Message-ID: <e62d26b9-8c9b-644f-d2b3-485586e07e35@linaro.org>
References: <1565915925-21009-1-git-send-email-Anson.Huang@nxp.com>
 <1565915925-21009-4-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565915925-21009-4-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, leonard.crestez@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, jun.li@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, ccaione@baylibre.com, andrew.smirnov@gmail.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 16/08/2019 02:38, Anson Huang wrote:
> Enable i.MX8MM cpu-idle using generic ARM cpu-idle driver, 2 states
> are supported, details as below:
> 
> root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name
> WFI
> root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state0/usage
> 3973
> root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name
> cpu-pd-wait
> root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
> 6647
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Hi Anson,

I've applied the patches 1-3 but this one does not apply.

You can either respin it against tip/timers/core and take it through
Shawn's tree. If the later, you can add my Acked-by.

  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
