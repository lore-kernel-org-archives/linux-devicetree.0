From: Dmitry Torokhov <dtor@chromium.org>
Subject: Re: [PATCH v4 0/4] Add pinctrl support to Broadcom Cygnus SoC
Date: Wed, 25 Feb 2015 11:29:56 -0800
Message-ID: <20150225192956.GB3215@dtor-ws>
References: <rjui@broadcom.com>
 <1423015801-26967-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423015801-26967-1-git-send-email-rjui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 03, 2015 at 06:09:57PM -0800, Ray Jui wrote:
> This patchset contains the initial pinctrl (IOMUX) support for the Broadcom
> Cygnus SoC. The Cygnus IOMUX controller supports group based mux configuration
> and allows certain pins to be muxed to GPIO function individually
> 
> Changes from v3:
>  - Fix the driver to have more proper use of "const" in various places
>  - Other minor improvements
> 
> Changes from v2:
>  - Consolidate all Broadcom pinctrl drivers into drivers/pinctrl/bcm/*
>  - Change the Cygnus IOMUX driver to use standard Linux pinctrl subnode
> properties such as "function" and "groups" for pinmux configuration, instead
> of non-standard properties such as "brcm,function" and "brcm,group"
>  - Use real function names like "spi0", "lcd", "key", and etc. instead of HW
> specific mux names like "alt1", "alt2", "alt3", and etc.
>  - Add suffix "grp" to all group names
>  - Add support to allow individual pins to be muxed to GPIO function through
> subsystem callbacks "gpio_request_enable" and "gpio_disable_free", and get rid
> of all GPIO groups
>  - Other minor improvements in the driver
> 
> Changes from v1:
>  - Fix a typo in device tree binding document

FWIW I tested this series on BCM958305K SVK.

Tested-by: Dmitry Torokhov <dtor@chromium.org>

Thanks.

-- 
Dmitry
