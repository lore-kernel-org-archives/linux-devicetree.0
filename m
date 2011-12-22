From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3 4/7] cpufreq: add generic cpufreq driver
Date: Thu, 22 Dec 2011 00:50:51 +0000
Message-ID: <20111222005048.GA27144@opensource.wolfsonmicro.com>
References: <1324264903-15395-1-git-send-email-richard.zhao@linaro.org> <20111221012046.GE15863@b20223-02.ap.freescale.net> <20111221092739.GI15863@b20223-02.ap.freescale.net> <201112210943.34310.arnd@arndb.de> <CAPXgP10FCrqdTg++46m4+xxM9tw1ZrKc8wz=JkKjCHJ0hQPtng@mail.gmail.com> <20111221121246.GB15309@opensource.wolfsonmicro.com> <CAPXgP10CGxfEJ4jK2MkKt0-nAWgiawDERyA1N4wHvMCJfE3oDg@mail.gmail.com> <20111221141907.GA1777@richard-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111221141907.GA1777@richard-laptop>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Arnd Bergmann <arnd@arndb.de>, Richard Zhao <richard.zhao@freescale.com>, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, bryanh@codeaurora.org, cpufreq@vger.kernel.org, grant.likely@secretlab.ca, jamie@jamieiles.com, rdunlap@xenotime.net, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org, davidb@codeaurora.org, shawn.guo@linaro.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, Greg KH <greg@kroah.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2011 at 10:19:11PM +0800, Richard Zhao wrote:

> Even cpu node is device, I still need to find a way to get it.  I think it's
> better have another patch to fix the regulator dt binding in cpu node. I'll
> not include it in this patch series.

I'd expect this to be easy if we can find any device tree data for the
CPU at all?  It's just another piece of data no different to the clock
rates or whatever.
