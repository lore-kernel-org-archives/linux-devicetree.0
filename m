From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/5] Add common clock support for Broadcom iProc architecture
Date: Wed, 07 Jan 2015 20:26:22 +0100
Message-ID: <3144204.or2m7FRv17@wuerfel>
References: <1420658568-22879-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420658568-22879-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Wednesday 07 January 2015 11:22:43 Ray Jui wrote:
> This patchset contains the initial common clock support for Broadcom's iProc
> family of SoCs. The iProc clock architecture comprises of various PLLs, e.g.,
> ARMPLL, GENPLL, LCPLL0, MIPIPLL, and etc. An onboard crystal serves as the
> basic reference clock for these PLLs. Each PLL may have several leaf clocks.
> One special group of clocks is the ASIU clocks, which are dervied directly
> from the crystal reference clock.
> 

Looks good to me now.

	Arnd
