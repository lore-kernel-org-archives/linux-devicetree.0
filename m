From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V5 1/3] mfd: add support for ams AS3722 PMIC
Date: Wed, 09 Oct 2013 10:13:28 -0600
Message-ID: <525580A8.5050902@wwwdotorg.org>
References: <1381321761-8898-1-git-send-email-ldewangan@nvidia.com> <1381321761-8898-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1381321761-8898-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, lee.jones@linaro.org, sameo@linux.intel.com, broonie@kernel.org, linus.walleij@linaro.org, akpm@linux-foundation.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, rob.herring@calxeda.com, mark.rutland@arm.com, pawel.moll@arm.com, rob@landley.net, ijc+devicetree@hellion.org.uk, grant.likely@linaro.org, Florian Lobmaier <florian.lobmaier@ams.com>
List-Id: devicetree@vger.kernel.org

On 10/09/2013 06:29 AM, Laxman Dewangan wrote:
> The ams AS3722 is a compact system PMU suitable for mobile phones,
> tablets etc. It has 4 DC/DC step-down regulators, 3 DC/DC step-down
> controller, 11 LDOs, RTC, automatic battery, temperature and
> over-current monitoring, 8 GPIOs, ADC and a watchdog.
> 
> Add MFD core driver for the AS3722 to support core functionality.

OK, I think the binding here is about clear enough, so the binding,
Acked-by: Stephen Warren <swarren@nvidia.com>
