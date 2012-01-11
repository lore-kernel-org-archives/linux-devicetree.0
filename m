From: Kevin Hilman <khilman@ti.com>
Subject: Re: [PATCH V6 4/7] cpufreq: add clk-reg cpufreq driver
Date: Wed, 11 Jan 2012 15:22:34 -0800
Message-ID: <87aa5t25ad.fsf@ti.com>
References: <1325213769-11752-1-git-send-email-richard.zhao@linaro.org>
	<1325213769-11752-5-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1325213769-11752-5-git-send-email-richard.zhao@linaro.org>
	(Richard Zhao's message of "Fri, 30 Dec 2011 10:56:06 +0800")
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, arnd@arndb.de, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, rob.herring@calxeda.com, rdunlap@xenotime.net, eric.miao@linaro.org, kernel@pengutronix.de, jamie@jamieiles.com, davej@redhat.com, linaro-dev@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Richard Zhao <richard.zhao@linaro.org> writes:

> The driver get cpu operation point table from device tree cpu0 node,

Since we already have an existing OPP infrastructure in the kernel,
seems like  this driver should get OPPs by asking the OPP layer.

This approach assumes the OPP layer is static at boot time and not
changing, however that's not the case in practice.

The OPP layer could be extended to read boot-time OPPs from DT if
desired, but since the OPPs are also populated/enabled/disabled
dynamicaly on some platforms (e.g. OMAP), I think the any generic
CPUfreq driver should use the OPP interface and not DT directly.

> and adjusts operating points using clk and regulator APIs.

For a generic driver, the regulator used should also be configurable.

For example, this driver currently assumes a regulator named "cpu" for
all instances.   If you had separate clusters with independent voltage
control, you'd likely have a separate regulator for each cluster.

Kevin
