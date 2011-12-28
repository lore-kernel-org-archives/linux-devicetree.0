From: Richard Zhao <richard.zhao@freescale.com>
Subject: Re: [PATCH V5 4/7] cpufreq: add clk-reg cpufreq driver
Date: Wed, 28 Dec 2011 11:14:10 +0800
Message-ID: <20111228031409.GL15863@b20223-02.ap.freescale.net>
References: <1324974262-30963-1-git-send-email-richard.zhao@linaro.org>
 <1324974262-30963-5-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1324974262-30963-5-git-send-email-richard.zhao@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, arnd@arndb.de, mark.langsdorf@calxeda.com, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, bryanh@codeaurora.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, rdunlap@xenotime.net, eric.miao@linaro.org, kernel@pengutronix.de, jamie@jamieiles.com, davej@redhat.com, davidb@codeaurora.org, shawn.guo@linaro.org, linaro-dev@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

[...]
> +		if (cpu_reg) {
> +			ret = regulator_is_supported_voltage(cpu_reg,
> +					cpu_volts[i * 2], cpu_volts[i * 2 + 1]);
Is there any reason you didn't export symbol regulator_is_supported_voltage?
and also it don't have !REGULATOR dummy implementation.
 
Thanks
Richard

