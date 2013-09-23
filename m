From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] mfd: add support for AMS AS3722 PMIC
Date: Mon, 23 Sep 2013 10:45:43 -0600
Message-ID: <52407037.80004@wwwdotorg.org>
References: <1379400338-20704-1-git-send-email-ldewangan@nvidia.com> <1379400338-20704-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1379400338-20704-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: lee.jones@linaro.org, sameo@linux.intel.com, broonie@kernel.org, linus.walleij@linaro.org, akpm@linux-foundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, rob.herring@calxeda.com, mark.rutland@arm.com, pawel.moll@arm.com, rob@landley.net, ijc+devicetree@hellion.org.uk, grant.likely@linaro.org, florian.lobmaier@ams.com
List-Id: devicetree@vger.kernel.org

On 09/17/2013 12:45 AM, Laxman Dewangan wrote:
> The AMS AS3722 is a compact system PMU suitable for mobile phones,
> tablets etc. It has 4 DC/DC step-down regulators, 3 DC/DC step-down
> controller, 11 LDOs, RTC, automatic battery, temperature and
> over-current monitoring, 8 GPIOs, ADC and wathdog.
> 
> Add mfd core driver for the AS3722 to support core functionality.

Nice patch description.

(although a couple typos: s/wathdog/watchdog/, s/mfd/MFD/)

> +Note: This gpio properties will be in the as3722 node.

Why? If there's a GPIO sub-node, why wouldn't all the GPIO properties
appear there?

> +Sub-node compatible:
> +-------------------
> +The of_node of its all child node will have compatible so that it can
> +get the child node handle and pass as the dev->of_node when registering
> +mfd devices.

That's very much Linux-specific details. Re-phrasing it as follows would
make more sense:

==========
Each HW module within the PMIC is represented as a separate child node
within the PMIC's main node. These nodes are described below:

GPIO controller
-------------------

Required properties:
compatible: Must be "ams,as3722-gpio"
...

Regulator
-------------------

...
==========

That also has the benefit of fully describing the content of all the
child nodes in the binding, rather than only mentioning what the
compatible values should be, and saying nothing else about the nodes.

But, as Mark asked, why are any child nodes needed at all? If e.g. an
identical/re-usable GPIO HW block appears in many AMS PMICs, it possibly
makes sense, but otherwise it doesn't.
