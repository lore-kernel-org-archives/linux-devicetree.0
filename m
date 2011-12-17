From: Richard Zhao <richard.zhao@linaro.org>
Subject: Re: [PATCH V2 1/4] cpufreq: add arm soc generic cpufreq driver
Date: Sat, 17 Dec 2011 16:39:54 +0800
Message-ID: <20111217083952.GE2010@richard-laptop>
References: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org>
 <1324031462-24961-2-git-send-email-richard.zhao@linaro.org>
 <20111216105229.GB3230@totoro>
 <4EEBA306.3060309@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4EEBA306.3060309@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bryan Huntsman <bryanh@codeaurora.org>
Cc: Jamie Iles <jamie@jamieiles.com>, linux@arm.linux.org.uk, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 16, 2011 at 11:59:02AM -0800, Bryan Huntsman wrote:
> On 12/16/2011 02:52 AM, Jamie Iles wrote:
> >
> >> +static DEFINE_PER_CPU(unsigned long, l_p_j_ref);
> >> +static unsigned long l_p_j_ref_freq;
> >> +
> >> +static struct clk *cpu_clk;
> > 
> > This assumes that all CPU's share the same clk and run at the same rate.  
> > Is that a fair/safe assumption?  I honestly don't know the answer to 
> > this so it's just a question!!!
> 
> On MSM, cpus independently scale both frequency and voltage.  Our clock
> driver isn't upstream yet.  David Brown has a preliminary version here:
If
 - cpu_clk are per_cpu, and get from cpu0 clk, cpu1 clk, etc.
   The same to regulators.
 - set CPUFREQ_SHARED_TYPE_NONE
 - don't set affect cpus.

Does that help you?

Thanks
Richard
> 
> https://www.codeaurora.org/gitweb/quic/kernel/?p=davidb/linux-msm.git;a=shortlog;h=refs/heads/msm-clock-rfc
> 
> Once we get our driver upstream, MSM will be an exception and not select
> ARM_GENERIC_CPUFREQ.  We'll probably have a separate msm-cpufreq.c
> driver under drivers/cpufreq/.
> 
> - Bryan
> 
> -- 
> Sent by an employee of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
