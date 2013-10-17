From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC 0/9] of: refactor IRQ parsing and add interrupts-extended
 implementation
Date: Thu, 17 Oct 2013 10:30:37 -0700
Message-ID: <20131017173037.GB15154@atomide.com>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381869563-16083-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [131015 13:43]:
> Hi everyone.
> 
> This series is mostly a set of cleanup to the interrupt parsing code.
> Some of it merely clarification, like the renames of of_irq_map_*, some
> to tighten up the API by using of_phandle_args, and some to prepare for
> the last patch in the series.
> 
> Of all these patches, the last one is probably the only one likely to be
> controversial. It adds a new way of specifying interrupts. If a device
> gets wired up to multiple interrupt controllers, the interrupts-extended
> property allows the device to specify multiple connections without
> redirecting through an interrupt-map node which can be rather difficult
> to understand. In a lot of cases, an interrupts-extended property is a
> whole lot easier to use.

Oh that's too diplomatic :) How about something like this instead:

"Device tree is currently badly broken where in order to support
 interrupts from multiple interrupt controllers the device needs
 to do the opposite of describing hardware, and lie about itself
 being an interrupt controller to use the interrupt-map property."

Anyways, gave this series a try, and the interrupts-extended binding
works for me for the multiple interrupt controllers issue :)

Tony

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
