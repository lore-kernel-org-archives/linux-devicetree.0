From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 2/2] arm64: dts: amazon: add Amazon Annapurna Labs Alpine
 v3 support
Date: Mon, 29 Jul 2019 11:12:50 +0100
Message-ID: <20190729101250.GA831@e107155-lin>
References: <20190728195135.12661-1-ronenk@amazon.com>
 <20190728195135.12661-3-ronenk@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190728195135.12661-3-ronenk@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ronen Krupnik <ronenk@amazon.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, barakw@amazon.com, dwmw@amazon.co.uk, benh@amazon.com, jonnyc@amazon.com, talel@amazon.com, hhhawa@amazon.com, hanochu@amazon.com, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 10:51:35PM +0300, Ronen Krupnik wrote:
> This patch adds the initial support for the Amazon Annapurna Labs Alpine v3
> Soc and Evaluation Platform (EVP).

[...]

> +
> +		pmu {
> +			compatible = "arm,armv8-pmuv3";

Please use "arm,cortex-a72-pmu" as we know it's Cortex-A72 cores

--
Regards,
Sudeep
