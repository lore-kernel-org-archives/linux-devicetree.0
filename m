From: Rohit Vaswani <rvaswani@codeaurora.org>
Subject: Re: [PATCH 2/3] ARM: msm: Re-organize platsmp to make it extensible
Date: Tue, 04 Jun 2013 15:52:16 -0700
Message-ID: <51AE6FA0.4030104@codeaurora.org>
References: <1370305185-6450-1-git-send-email-rvaswani@codeaurora.org> <1370305185-6450-3-git-send-email-rvaswani@codeaurora.org> <20130604093258.GS18614@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20130604093258.GS18614@n2100.arm.linux.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 6/4/2013 2:32 AM, Russell King - ARM Linux wrote:
> On Mon, Jun 03, 2013 at 05:19:44PM -0700, Rohit Vaswani wrote:
>> +	sc1_base_ptr = of_iomap(dn, 0);
>> +	if (sc1_base_ptr) {
>> +		writel_relaxed(0, sc1_base_ptr + VDD_SC1_ARRAY_CLAMP_GFS_CTL);
>> +		writel_relaxed(0, sc1_base_ptr + SCSS_CPU1CORE_RESET);
>> +		writel_relaxed(3, sc1_base_ptr + SCSS_DBG_STATUS_CORE_PWRDUP);
>> +		mb();
>> +		iounmap(sc1_base_ptr);
> If you need to fiddle with power rails and resets for your secondary
> core, you don't need any of the pen_release stuff, and you really
> should get rid of it.  The pen_release stuff is only there for
> platforms where there's no proper way of controlling the secondary
> CPUs except by using a software method.

We currently don't have hotplug support as that also needs pen_release. 
We still need to do this.
We could change that behavior, but we would need more time for that. 
Please could we let this go through and cleanup the pen_release once we 
have hotplug working.

Thanks,
Rohit Vaswani

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation
