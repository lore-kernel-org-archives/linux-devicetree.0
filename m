From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCHv4 0/3] clocksource: Add Freescale FlexTimer Module (FTM)
 timer support
Date: Thu, 22 May 2014 14:12:23 +0200
Message-ID: <537DE9A7.7090606@linaro.org>
References: <1400492168-12813-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400492168-12813-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Xiubo Li <Li.Xiubo@freescale.com>, tglx@linutronix.de, shawn.guo@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/19/2014 11:36 AM, Xiubo Li wrote:
> Changes in V4:
> - Add struct ftm_clock_device {} support.
> - peroidic_cyc --> periodic_cyc.
>
> Changes in V3:
> - Fix the ftm_irq_disable.
>
> Changes in V2:
> - Add big-endian support.
> - Add using pr_err instead of BUG_ON.
> - Add more detail comment message of FTM.
> - Add DT binding documentation.
> - Remove some header files and macros not useful.

DTS binding guys,

any comment on the patches ?

Thanks
   -- Daniel




--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

