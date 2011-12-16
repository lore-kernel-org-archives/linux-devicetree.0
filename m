From: Bryan Huntsman <bryanh@codeaurora.org>
Subject: Re: [PATCH V2 1/4] cpufreq: add arm soc generic cpufreq driver
Date: Fri, 16 Dec 2011 11:59:02 -0800
Message-ID: <4EEBA306.3060309@codeaurora.org>
References: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org> <1324031462-24961-2-git-send-email-richard.zhao@linaro.org> <20111216105229.GB3230@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20111216105229.GB3230@totoro>
Sender: cpufreq-owner@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: Richard Zhao <richard.zhao@linaro.org>, linux@arm.linux.org.uk, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/16/2011 02:52 AM, Jamie Iles wrote:
>
>> +static DEFINE_PER_CPU(unsigned long, l_p_j_ref);
>> +static unsigned long l_p_j_ref_freq;
>> +
>> +static struct clk *cpu_clk;
> 
> This assumes that all CPU's share the same clk and run at the same rate.  
> Is that a fair/safe assumption?  I honestly don't know the answer to 
> this so it's just a question!!!

On MSM, cpus independently scale both frequency and voltage.  Our clock
driver isn't upstream yet.  David Brown has a preliminary version here:

https://www.codeaurora.org/gitweb/quic/kernel/?p=davidb/linux-msm.git;a=shortlog;h=refs/heads/msm-clock-rfc

Once we get our driver upstream, MSM will be an exception and not select
ARM_GENERIC_CPUFREQ.  We'll probably have a separate msm-cpufreq.c
driver under drivers/cpufreq/.

- Bryan

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
