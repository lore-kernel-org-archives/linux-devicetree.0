From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V5 4/7] cpufreq: add clk-reg cpufreq driver
Date: Wed, 28 Dec 2011 12:14:04 +0000
Message-ID: <20111228121403.GI24405@opensource.wolfsonmicro.com>
References: <1324974262-30963-1-git-send-email-richard.zhao@linaro.org>
 <1324974262-30963-5-git-send-email-richard.zhao@linaro.org>
 <20111228031409.GL15863@b20223-02.ap.freescale.net>
 <20111228033128.GM15863@b20223-02.ap.freescale.net>
 <20111228114237.GF24405@opensource.wolfsonmicro.com>
 <20111228120517.GA1691@richard-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111228120517.GA1691@richard-laptop>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: Richard Zhao <richard.zhao@freescale.com>, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, arnd@arndb.de, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, rdunlap@xenotime.net, cpufreq@vger.kernel.org, grant.likely@secretlab.ca, bryanh@codeaurora.org, eric.miao@linaro.org, rob.herring@calxeda.com, kernel@pengutronix.de, davej@redhat.com, jamie@jamieiles.com, davidb@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 28, 2011 at 08:05:20PM +0800, Richard Zhao wrote:

Looks like the problem with your mail client is that it's wrapping at
exactly 80 characters which is too little - you need to leave space for
being quoted.

> On Wed, Dec 28, 2011 at 11:42:37AM +0000, Mark Brown wrote:

> > You can't usefully work with voltages without knowing what the actual
> > voltages are - the only sensible stubs we could provide would return
> > errors but then any driver using the stubs would probably fail to do
> > whatever it was doing.  With enable and disable we can sensibly stub
> > things out with an always on regulator.

> Sorry, I can not get your point here. Let me describe the problem I met:

>  - regulator_is_supported_voltage is not exported. when I build clk-reg-cpufreq
>    as kernel module, there's a link error.

This is an oversight, I've just fixed it.

>  - I saw linux/regulator/consumer.h has some dummy functions if !REGULATOR. I
>    tried to make clk-reg-cpufreq driver work even !REGULATOR. I think that's
>    why the dummy functions are there. If regulator_get return NULL, it'll avoid
>    calling other regulator functions. But regulator_is_supported_voltage and
>    regulator_set_voltage_time don't have such dummy ones. Undefined functions.

I can only repeat what I wrote above explaining why no stubs are
provided.
