From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Wed, 9 Dec 2015 09:59:58 +0100
Message-ID: <20151209085958.GT11966@pengutronix.de>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Hi John,

On Tue, Dec 08, 2015 at 01:29:22PM -0800, John Stultz wrote:
> This patch adds a basic driver to allow for commands like
> "reboot bootloader" and "reboot recovery" to communicate this
> reboot-reason to the bootloader.
> 
> This is commonly done on Android devices, in order to reboot
> the device into fastboot or recovery mode. It also supports
> custom OEM specific commands, via "reboot oem-<value>".
> 
> This driver pulls the phys memory address from DT as well as
> the magic reason values that are written to the address for
> each mode.
> 
> For an example, this patch also adds the DT support for
> the nexus7 device via its dts (which is not yet upstream).
> 
> Thoughts and feedback would be appreciated!

I wonder if 'reason' is the correct word. This driver says nothing about
the reason why we reboot, but more what we should do next. Maybe
something like purpose, scope or intention is more appropriate?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
