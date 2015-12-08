From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Tue, 08 Dec 2015 22:52:08 +0100
Message-ID: <1858873.xsM5XHIlTX@wuerfel>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 08 December 2015 13:29:22 John Stultz wrote:

> diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> index 5183d18..ee5dcb7 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> @@ -282,6 +282,15 @@
>  			};
>  		};
>  
> +		reboot_reason: reboot_reason@2a03f65c {
> +			compatible		= "reboot_reason";

This is not a good compatible string. There should generally be a vendor
name associated with it (use "linux," if nothing else, and you should have
'-' instead of '_'.

> +			reg			= <0x2A03F65C 0x4>;

This may easily conflict with the device it is part of. We should have
non-overlapping register areas in general. For the example you are
looking at, which register block is this?

> +
> +/* Types of reasons */
> +static enum {
> +	NONE,
> +	BOOTLOADER,
> +	RECOVERY,
> +	OEM,
> +	MAX_REASONS
> +} __maybe_unused reason_types;

The variable seems to always be unused, not just "__maybe_unused". Maybe remove it?

> +static int reboot_reason(struct notifier_block *nb, unsigned long action,
> +								void *data)
> +{
> +	char *cmd = (char *)data;
> +	long reason = reasons[NONE];
> +
> +	if (!reboot_reason_addr)
> +		return NOTIFY_DONE;
> +
> +	if (cmd != NULL) {
> +		if (!strncmp(cmd, "bootloader", 10))
> +			reason = reasons[BOOTLOADER];
> +		else if (!strncmp(cmd, "recovery", 8))
> +			reason = reasons[RECOVERY];
> +		else if (!strncmp(cmd, "oem-", 4)) {
> +			unsigned long code;
> +
> +			if (!kstrtoul(cmd+4, 0, &code))
> +				reason = reasons[OEM] | (code & 0xff);
> +		}
> +	}
> +
> +	if (reason != -1)
> +		writel(reason, reboot_reason_addr);
> +	return NOTIFY_DONE;
> +}

Will this reboot the machine?

> +	/* Install the notifier */
> +	restart_nb.notifier_call = reboot_reason;
> +	restart_nb.priority = 256;
> +	if (register_restart_handler(&restart_nb)) {

If not, you should use register_reboot_notifier() rather than
register_restart_handler(). The former gets called to do something
just before rebooting, while the latter attempts to actually reboot
the machine.

> +static int __init reboot_reason_init(void)
> +{
> +	return platform_driver_register(&reboot_reason_driver);
> +}
> +arch_initcall(reboot_reason_init);

Why this early? If it can be a normal device_initcall, you can use
module_platform_driver().

	Arnd
