From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/8] ARM: sun9i: SMP and CPU hotplug support
Date: Mon, 15 Jan 2018 16:00:45 -0500 (EST)
Message-ID: <nycvar.YSQ.7.76.1801151502050.13881@knanqh.ubzr>
References: <20180115071450.18355-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180115071450.18355-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 15 Jan 2018, Chen-Yu Tsai wrote:

> Changes since v2:
>   - Do away with the MCPM framework, directly implement smp_ops
>   - Some debug messages were clarified
>   - New ARCH_SUNXI_MCPM Kconfig symbol for this feature

You should use ARCH_SUNXI_SMP instead to avoid confusion with the actual 
MCPM code. Ditto for function names as Dave mentioned.

For the ARM to Thumb switch you could add something like this at the 
beginning of your entry code:

#ifdef CONFIG_THUMB2_KERNEL
	.arm
	mov	ip, #1
	bx	ip
	.thumb
#endif
	[your code follows here]

And make sure that code is word aligned.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
