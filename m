From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH V5 4/7] cpufreq: add clk-reg cpufreq driver
Date: Thu, 29 Dec 2011 15:23:17 +0800
Message-ID: <20111229072316.GB11474@S2100-06.ap.freescale.net>
References: <1324974262-30963-1-git-send-email-richard.zhao@linaro.org>
 <1324974262-30963-5-git-send-email-richard.zhao@linaro.org>
 <20111229062102.GA2414@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111229062102.GA2414@b20223-02.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@freescale.com>, davej@redhat.com
Cc: Richard Zhao <richard.zhao@linaro.org>, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, arnd@arndb.de, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, rdunlap@xenotime.net, cpufreq@vger.kernel.org, grant.likely@secretlab.ca, bryanh@codeaurora.org, eric.miao@linaro.org, rob.herring@calxeda.com, kernel@pengutronix.de, jamie@jamieiles.com, davidb@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Dave,

On Thu, Dec 29, 2011 at 02:21:03PM +0800, Richard Zhao wrote:
> There's still a bug that, after rmmod module, cpu0 still has cpufreq
> sysfs entry.
> 
> cpufreq_unregister_driver can not clean up everything.
> 
Is this an known issue to cpufreq core?

-- 
Regards,
Shawn

