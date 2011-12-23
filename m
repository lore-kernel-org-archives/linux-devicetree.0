From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v4 4/7] cpufreq: add clk-reg cpufreq driver
Date: Fri, 23 Dec 2011 13:18:51 +0000
Message-ID: <20111223131851.GB13175@sirena.org.uk>
References: <1324537753-30590-1-git-send-email-richard.zhao@linaro.org>
 <1324537753-30590-5-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1324537753-30590-5-git-send-email-richard.zhao@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, davej@redhat.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rdunlap@xenotime.net, kernel@pengutronix.de, shawn.guo@linaro.org, catalin.marinas@arm.com, eric.miao@linaro.org, mark.langsdorf@calxeda.com, davidb@codeaurora.org, arnd@arndb.de, bryanh@codeaurora.org, jamie@jamieiles.com, marc.zyngier@arm.com, linaro-dev@lists.linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 22, 2011 at 03:09:10PM +0800, Richard Zhao wrote:
> The driver get cpu operation point table from device tree cpu0 node,
> and adjusts operating points using clk and regulator APIs.

Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

but one nit:

> +Required properties in /cpus/cpu@0:
> +- cpu-freqs : cpu frequency points it support, in unit of Hz.
> +- cpu-volts : cpu voltages required by the frequency point at the same index,
> +	      in unit of uV.
> +- trans-latency :  transition_latency, in unit of ns.

trans-latency should really say what latency is being measured (the CPU
core only or the whole operation).
