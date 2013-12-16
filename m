From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCHv5] rtc: Add support for Intersil ISL12057 I2C RTC chip
Date: Mon, 16 Dec 2013 15:56:13 -0800
Message-ID: <20131216235613.GA12307@roeck-us.net>
References: <bb04b9b4d76e735526ccc8e72df27a3ca894b4ca.1387235949.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bb04b9b4d76e735526ccc8e72df27a3ca894b4ca.1387235949.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 17, 2013 at 12:39:22AM +0100, Arnaud Ebalard wrote:
> 
> Intersil ISL12057 I2C RTC chip also supports two alarms. This patch
> only adds support for basic RTC functionalities (i.e. getting and
> setting time). Tests have been performed on NETGEAR ReadyNAS 102 w/
> startup/shutdown scripts, hwclock, ntpdate and openntpd.
> 
> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter
