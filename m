From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V4 5/5] Documentation: power: reset: Add documentation for generic SYSCON reboot driver
Date: Wed, 29 Jan 2014 16:08:47 +0100
Message-ID: <3683633.QqePEXQehq@wuerfel>
References: <1390504801-24483-1-git-send-email-fkan@apm.com> <20140124182355.GF4758@e106331-lin.cambridge.arm.com> <52E2F450.2070100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52E2F450.2070100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Marc C <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 24 January 2014 15:16:32 Marc C wrote:
> 
> > What's wrong with having a system clock unit binding, that the kernel
> > can decompose as appropriate?
> 
> From what I understand, the arm-soc maintainers want to reduce (and perhaps even
> eliminate) these board-specific constructs, and try to utilize common driver-code that
> resides in the "driver" folder. I can vouch for the syscon/regmap framework as something
> which would enable the effort.

While your statement is true in general, it doesn't seem to counter
what Mark R said above.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
