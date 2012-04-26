From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 4/4] mmc: sdhci-imx-esdhc: convert to use pinctrl subsystem
Date: Thu, 26 Apr 2012 10:32:49 -0600
Message-ID: <4F9978B1.3050203@wwwdotorg.org>
References: <1335451227-27709-1-git-send-email-b29396@freescale.com> <1335451227-27709-4-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1335451227-27709-4-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com, s.hauer@pengutronix.de, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, cjb@laptop.org, b20223@freescale.com
List-Id: devicetree@vger.kernel.org

On 04/26/2012 08:40 AM, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> This driver is shared between many platforms. Currently only imx6q has
> pinctrl support, to avoid breaking other platforms that do not have pinctrl
> support to run this driver, enable pinctrl dummy state for them before
> they also convert to pinctrl subsystem.

The series,

Acked-by: Stephen Warren <swarren@wwwdotorg.org>

(My ack isn't meant to override or influence any discussions between
Freescale maintainers re: the binding, but more that the binding seems
to be /a/ reasonable solution, and is specified well enough that I
understand what's going on there)
