From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3 4/7] cpufreq: add generic cpufreq driver
Date: Wed, 21 Dec 2011 12:11:10 +0000
Message-ID: <20111221121108.GA15309@opensource.wolfsonmicro.com>
References: <1324264903-15395-1-git-send-email-richard.zhao@linaro.org> <20111221012046.GE15863@b20223-02.ap.freescale.net> <20111221092739.GI15863@b20223-02.ap.freescale.net> <201112210943.34310.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201112210943.34310.arnd@arndb.de>
Sender: cpufreq-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Zhao <richard.zhao@freescale.com>, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, bryanh@codeaurora.org, cpufreq@vger.kernel.org, grant.likely@secretlab.ca, jamie@jamieiles.com, rdunlap@xenotime.net, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org, davidb@codeaurora.org, shawn.guo@linaro.org, rob.herring@calxeda.com, Richard Zhao <richard.zhao@linaro.org>, linux-arm-kernel@lists.infradead.org, Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2011 at 09:43:34AM +0000, Arnd Bergmann wrote:
> On Wednesday 21 December 2011, Richard Zhao wrote:

> > Mark, cpu node is not a struct device, sys_device instead. I can not find
> > regulator via device/dt node. Can I still use the string to get regulator
> > after converting to DT?

> I believe Kay and Greg have the plan to unify "class" and "bus" in sysfs, which
> implies turning sys_device into a derived class of device instead of kobject.
> If that understanding is correct, we might as well do that now so we can
> attach a device_node to a sys_device.

> Kay, does this make sense?

I'm noy Kay but I think even if it's not what we end uo doing internally
it's a sensible design for the device tree representation.

