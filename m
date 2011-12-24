From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v4 4/7] cpufreq: add clk-reg cpufreq driver
Date: Sat, 24 Dec 2011 13:42:29 +0000
Message-ID: <20111224134227.GA20908@opensource.wolfsonmicro.com>
References: <1324537753-30590-1-git-send-email-richard.zhao@linaro.org> <1324537753-30590-5-git-send-email-richard.zhao@linaro.org> <20111223131851.GB13175@sirena.org.uk> <20111224085539.GA1892@richard-laptop> <20111224122411.GA13778@sirena.org.uk> <20111224132831.GB1803@richard-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111224132831.GB1803@richard-laptop>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: linux@arm.linux.org.uk, arnd@arndb.de, mark.langsdorf@calxeda.com, linaro-dev@lists.linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, bryanh@codeaurora.org, cpufreq@vger.kernel.org, grant.likely@secretlab.ca, rdunlap@xenotime.net, eric.miao@linaro.org, rob.herring@calxeda.com, kernel@pengutronix.de, jamie@jamieiles.com, davej@redhat.com, davidb@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 24, 2011 at 09:28:33PM +0800, Richard Zhao wrote:
> On Sat, Dec 24, 2011 at 12:24:11PM +0000, Mark Brown wrote:

>  - trans-latency :  transition latency of cpu freq and related regulator,
>    in unit of ns.

> Does it look better?

I think it shouldn't include the regulator part of things.

> If you think regulator thansition latency is board specific, then the board
> dts can overrite it.

We should just query this information from the regulator subsystem
(there's hooks but currently nothing implements them).  The regulators
can define their own bindings if they need to read it from device tree,
most of them should be able to do this as a function of knowing about
the device.  None of this is specific to cpufreq so cpufreq shouldn't
have to define its own support for this.
