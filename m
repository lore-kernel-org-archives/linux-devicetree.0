From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH V5 4/7] cpufreq: add clk-reg cpufreq driver
Date: Wed, 28 Dec 2011 11:31:20 +0800
Message-ID: <20111228033118.GA17315@S2101-09.ap.freescale.net>
References: <1324974262-30963-1-git-send-email-richard.zhao@linaro.org>
 <1324974262-30963-5-git-send-email-richard.zhao@linaro.org>
 <20111227150539.GA15132@S2101-09.ap.freescale.net>
 <20111228012404.GK15863@b20223-02.ap.freescale.net>
 <20111228020110.GA17305@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111228020110.GA17305@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@freescale.com>
Cc: linux@arm.linux.org.uk, patches@linaro.org, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, rdunlap@xenotime.net, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org, rob.herring@calxeda.com, Richard Zhao <richard.zhao@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 28, 2011 at 10:01:13AM +0800, Shawn Guo wrote:
> Here is my tag on this patch.
> 
> Acked-by: Shawn Guo <shawn.guo@linaro.org>
> 
For record, this tag is only valid with the following conditions.

 * Fix the failure of pm-qa case cpufreq_01
 * Fix the failure of module build
 * Remove the dependency on REGULATOR since a set of empty functions
   have already been provided for !REGULATOR build.
   (regulator_is_supported_voltage and regulator_set_voltage_time to
    be added)

-- 
Regards,
Shawn

