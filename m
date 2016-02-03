From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH v10 4/5] Watchdog: introduce ARM SBSA watchdog driver
Date: Wed, 3 Feb 2016 11:48:17 -0600
Message-ID: <56B23D61.2050001@codeaurora.org>
References: <1454519923-25230-1-git-send-email-fu.wei@linaro.org>
 <1454519923-25230-5-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454519923-25230-5-git-send-email-fu.wei@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fu.wei@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, wim@iguana.be, linux@roeck-us.net, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com, Suravee.Suthikulpanit@amd.com
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-acpi@lists.linaro.org, rruigrok@codeaurora.org, harba@codeaurora.org, cov@codeaurora.org, dyoung@redhat.com, panand@redhat.com, graeme.gregory@linaro.org, al.stone@linaro.org, hanjun.guo@linaro.org, jcm@redhat.com, arnd@arndb.de, leo.duran@amd.com, sudeep.holla@arm.com
List-Id: devicetree@vger.kernel.org

fu.wei@linaro.org wrote:
> +static struct platform_driver sbsa_gwdt_driver = {
> +	.driver = {
> +		.name = "sbsa-gwdt",
> +		.pm = &sbsa_gwdt_pm_ops,
> +		.of_match_table = sbsa_gwdt_of_match,
> +	},
> +	.probe = sbsa_gwdt_probe,
> +	.remove = sbsa_gwdt_remove,
> +	.shutdown = sbsa_gwdt_shutdown,
> +	.id_table = sbsa_gwdt_pdev_match,
> +};

I just noticed you dropped ACPI support.  Server platforms are supposed 
to use ACPI, so that seems like a critical omission to me.  You had a 
GTDT parser in an older version of this patch.  What happened to it?
