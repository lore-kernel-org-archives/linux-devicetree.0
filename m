From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 PART-RESEND 0/2] berlin sdhci clock clean up
Date: Mon, 7 Dec 2015 10:36:14 +0800
Message-ID: <20151207103614.04bafa78@xhacker>
References: <1447671395-8023-1-git-send-email-jszhang@marvell.com>
	<564E3191.8060109@gmail.com>	<566408ED.9040902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <566408ED.9040902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Sebastian,

On Sun, 6 Dec 2015 11:07:41 +0100
Sebastian Hesselbarth wrote:

> On 19.11.2015 21:31, Sebastian Hesselbarth wrote:
> > On 16.11.2015 11:56, Jisheng Zhang wrote:  
> >> Add or fix the optional clock property, then remove the CLK_IGNORE_UNUSED
> >> flag for sdio clk(s).
> >>
> >> This is a partialy resend of 
> >> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/379457.html
> >>
> >> patch3, patch4 has been merged.  
> > 
> > Great! Really!
> > 
> > As they have been taken without my Acked-by, ignoring my request to
> > _not_ remove the CLK_IGNORE_UNUSED flags _before_ these two, the
> > remaining patches now become fixes.
> > 
> > Please resend the patches with a proper description what and why they
> > are fixes now.  
> 
> Is this going to be resolved anytime soon?
> 
> If not, I am going to send a revert for the CLK_IGNORE_UNUSED patch
> and we start this from the beginning.

I will send patches today.

Thanks a lot,
Jisheng

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
