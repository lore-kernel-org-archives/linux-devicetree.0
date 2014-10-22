From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/6] ARM: cygnus: Initial support for Broadcom Cygnus SoC
Date: Wed, 22 Oct 2014 10:22:22 +0200
Message-ID: <12157660.uOkg5nk8Dq@wuerfel>
References: <1413341936-17606-2-git-send-email-sbranden@broadcom.com> <38587325.kaAxCWAsmL@wuerfel> <5446F61C.8060400@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5446F61C.8060400@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <sbranden@broadcom.com>
Cc: Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, bcm-kernel-feedback-list@broadcom.com, Mike Turquette <mturquette@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Antti Palosaari <crope@iki.fi>, JD Zheng <jdzheng@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 21 October 2014 17:11:08 Scott Branden wrote:
> OK, I will remove the "iProc SoC based Machine types".  This was 
> grouping all iProc based SoCs under one menu and parallels what the 
> existing "Broadcom Mobile Soc Support" menu does.
>
> I can create another patch removing the "Broadcom Mobile SoC Support" 
> menu if the ARM Maintainer now want all Broadcom devices are supposed to 
> be contained in a single level?

Sounds good, I missed that other menu going in.

It can make sense to add 'comment' statements if you want to separate the
families.

I also noticed that there are a few configuration options that at first
seem pointless: ARCH_BCM_MOBILE_L2_CACHE and ARCH_BCM_MOBILE_SMP. I wonder
if it ever makes sense to disable these when the common options (CACHE_L2X0
and SMP) are enabled for another SoC. I'd normally like to see these as
hidden options that are always on whenever the core support for those
features is enabled, to avoid confusing users as well as bugs from the
combinatorial explosion.

	Arnd
