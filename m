From: Richard Zhao <richard.zhao@freescale.com>
Subject: Re: [PATCH V5 4/7] cpufreq: add clk-reg cpufreq driver
Date: Wed, 28 Dec 2011 11:31:29 +0800
Message-ID: <20111228033128.GM15863@b20223-02.ap.freescale.net>
References: <1324974262-30963-1-git-send-email-richard.zhao@linaro.org>
 <1324974262-30963-5-git-send-email-richard.zhao@linaro.org>
 <20111228031409.GL15863@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111228031409.GL15863@b20223-02.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com
Cc: linaro-dev@lists.linaro.org, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, arnd@arndb.de, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, rdunlap@xenotime.net, cpufreq@vger.kernel.org, grant.likely@secretlab.ca, bryanh@codeaurora.org, eric.miao@linaro.org, rob.herring@calxeda.com, kernel@pengutronix.de, davej@redhat.com, jamie@jamieiles.com, davidb@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org, richard.zhao@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 28, 2011 at 11:14:10AM +0800, Richard Zhao wrote:
> Hi Mark,
> 
> [...]
> > +		if (cpu_reg) {
> > +			ret = regulator_is_supported_voltage(cpu_reg,
> > +					cpu_volts[i * 2], cpu_volts[i * 2 + 1]);
> Is there any reason you didn't export symbol regulator_is_supported_voltage?
> and also it don't have !REGULATOR dummy implementation.
regulator_set_voltage_time and some other functions don't have dummy one
either.
>  
> Thanks
> Richard
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

