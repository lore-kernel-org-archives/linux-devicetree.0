From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Tue, 8 Dec 2015 14:15:10 -0800
Message-ID: <20151208221510.GH4000@usrtlx11787.corpusers.net>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
 <1858873.xsM5XHIlTX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1858873.xsM5XHIlTX@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 08 Dec 13:52 PST 2015, Arnd Bergmann wrote:

> On Tuesday 08 December 2015 13:29:22 John Stultz wrote:
> 
[..]
> > +static int reboot_reason(struct notifier_block *nb, unsigned long action,
> > +								void *data)
> > +{
> > +	char *cmd = (char *)data;
> > +	long reason = reasons[NONE];
> > +
> > +	if (!reboot_reason_addr)
> > +		return NOTIFY_DONE;
> > +
> > +	if (cmd != NULL) {
> > +		if (!strncmp(cmd, "bootloader", 10))
> > +			reason = reasons[BOOTLOADER];
> > +		else if (!strncmp(cmd, "recovery", 8))
> > +			reason = reasons[RECOVERY];
> > +		else if (!strncmp(cmd, "oem-", 4)) {
> > +			unsigned long code;
> > +
> > +			if (!kstrtoul(cmd+4, 0, &code))
> > +				reason = reasons[OEM] | (code & 0xff);
> > +		}
> > +	}
> > +
> > +	if (reason != -1)
> > +		writel(reason, reboot_reason_addr);
> > +	return NOTIFY_DONE;
> > +}
> 
> Will this reboot the machine?
> 

It will store the magic in IMEM, that is then read by the boot loader
after the reboot to make it trigger alternative boot flows - e.g. the
recovery/update path or enter fastboot mode.

> > +	/* Install the notifier */
> > +	restart_nb.notifier_call = reboot_reason;
> > +	restart_nb.priority = 256;
> > +	if (register_restart_handler(&restart_nb)) {
> 
> If not, you should use register_reboot_notifier() rather than
> register_restart_handler(). The former gets called to do something
> just before rebooting, while the latter attempts to actually reboot
> the machine.
> 

It should be a reboot_notifier, sorry for missing this in my answer.

> > +static int __init reboot_reason_init(void)
> > +{
> > +	return platform_driver_register(&reboot_reason_driver);
> > +}
> > +arch_initcall(reboot_reason_init);
> 
> Why this early? If it can be a normal device_initcall, you can use
> module_platform_driver().
> 

Not represented in this patch is that several Android vendors uses this
mechanism to communicate a panic() to the boot loader; to let the system
enter some sort of memory dump state.

Adding support for that would be convenient and mandate the early,
otherwise it's just userspace that will trigger this so module would be
fine.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
