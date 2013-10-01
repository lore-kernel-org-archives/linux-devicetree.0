From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V3 1/3] mfd: add support for AMS AS3722 PMIC
Date: Tue, 1 Oct 2013 14:29:17 +0530
Message-ID: <524A8EE5.70801@nvidia.com>
References: <1380023921-29867-1-git-send-email-ldewangan@nvidia.com> <1380023921-29867-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1380023921-29867-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "lee.jones@linaro.org" <lee.jones@linaro.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "rob@landley.net" <rob@landley.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likel>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Tuesday 24 September 2013 05:28 PM, Laxman Dewangan wrote:
> The AMS AS3722 is a compact system PMU suitable for mobile phones,
> tablets etc. It has 4 DC/DC step-down regulators, 3 DC/DC step-down
> controller, 11 LDOs, RTC, automatic battery, temperature and
> over-current monitoring, 8 GPIOs, ADC and watchdog.
>
> Add MFD core driver for the AS3722 to support core functionality.

Based on discussion on V1/V2, I have only one sub node i.e. for 
regulator only.  Mark B already applied the regualtor patch.
Other sub nodes are removed. For pinmux, default is as per pinmux 
binding and it is not a new sub node.

Can you please review again so that if there is any thing missing, I 
like to complete this?


Thanks,
Laxman


