From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH V5 4/7] cpufreq: add clk-reg cpufreq driver
Date: Wed, 28 Dec 2011 21:06:20 +0800
Message-ID: <20111228130619.GA10735@S2100-06.ap.freescale.net>
References: <1324974262-30963-1-git-send-email-richard.zhao@linaro.org>
 <1324974262-30963-5-git-send-email-richard.zhao@linaro.org>
 <20111228031409.GL15863@b20223-02.ap.freescale.net>
 <20111228033128.GM15863@b20223-02.ap.freescale.net>
 <20111228114237.GF24405@opensource.wolfsonmicro.com>
 <20111228120517.GA1691@richard-laptop>
 <20111228121403.GI24405@opensource.wolfsonmicro.com>
 <20111228124054.GB1691@richard-laptop>
 <20111228124739.GK24405@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111228124739.GK24405@opensource.wolfsonmicro.com>
Sender: cpufreq-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Richard Zhao <richard.zhao@linaro.org>, linaro-dev@lists.linaro.org, mark.langsdorf@calxeda.com, patches@linaro.org, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, bryanh@codeaurora.org, cpufreq@vger.kernel.org, rdunlap@xenotime.net, Richard Zhao <richard.zhao@freescale.com>, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linux@arm.linux.org.uk, davidb@codeaurora.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 28, 2011 at 12:47:40PM +0000, Mark Brown wrote:
> > One word. You mean I have to always depends on REGULATOR config, right?
> 
> Yes.

I do not care too much.  But it puts the driver on an interesting
position, that is it can work without a regulator driver backing the
cpu voltage but it has to enable CONFIG_REGULATOR.

-- 
Regards,
Shawn

