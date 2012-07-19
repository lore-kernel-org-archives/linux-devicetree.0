From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/3] Add a generic cpufreq-cpu0 driver
Date: Thu, 19 Jul 2012 20:39:39 +0200
Message-ID: <201207192039.40213.rjw@sisk.pl>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday, July 19, 2012, Shawn Guo wrote:
> This is a continuous effort of Richard's work [1].  But that generic
> cpufreq driver has been rewritten with taking omap-cpufreq.c as the
> reference to adopt OPP library.
> 
> Same as Richard's patch, the driver has no intention to support the
> multi-core systems that frequency and voltage can be scaled
> independently on different CPUs.  Instead, it aims at uniprocessor (UP)
> and those symmetric multiprocessor (SMP) systems which share clock and
> voltage across all CPUs.
> 
> I have seen patch from Mike changing omap-cpufreq driver to scale
> regulator from clk notifier.  We can definitely make the same move
> for cpufreq-cpu0 later when the patch gets accepted.
> 
> Regards,
> Shawn
> 
> [1] http://thread.gmane.org/gmane.linux.kernel.cpufreq/7688/focus=7688

It is too late to consider your patches for inclusion into v3.6, so I'm
regarding them as RFC at this point.

Please resubmit after v3.6-rc1 has been released.

Thanks,
Rafael
