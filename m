From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3 4/7] cpufreq: add generic cpufreq driver
Date: Wed, 21 Dec 2011 12:12:47 +0000
Message-ID: <20111221121246.GB15309@opensource.wolfsonmicro.com>
References: <1324264903-15395-1-git-send-email-richard.zhao@linaro.org> <20111221012046.GE15863@b20223-02.ap.freescale.net> <20111221092739.GI15863@b20223-02.ap.freescale.net> <201112210943.34310.arnd@arndb.de> <CAPXgP10FCrqdTg++46m4+xxM9tw1ZrKc8wz=JkKjCHJ0hQPtng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPXgP10FCrqdTg++46m4+xxM9tw1ZrKc8wz=JkKjCHJ0hQPtng@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Kay Sievers <kay.sievers@vrfy.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Zhao <richard.zhao@freescale.com>, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, bryanh@codeaurora.org, cpufreq@vger.kernel.org, grant.likely@secretlab.ca, jamie@jamieiles.com, rdunlap@xenotime.net, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org, davidb@codeaurora.org, shawn.guo@linaro.org, rob.herring@calxeda.com, Richard Zhao <richard.zhao@linaro.org>, linux-arm-kernel@lists.infradead.org, Greg KH <greg@kroah.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2011 at 12:44:57PM +0100, Kay Sievers wrote:

> We will convert all classes to buses over time time, and have a single
> type of device and a single type of subsystem.

Are there any conversions that have been done already that I can look at
for reference?
