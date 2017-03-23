From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91: add envelope detector mux to the Axentia
 TSE-850
Date: Thu, 23 Mar 2017 16:12:37 +0100
Message-ID: <20170323151237.u7vu63kxygxopq4b@piout.net>
References: <1489789486-30985-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489789486-30985-1-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/03/2017 at 23:24:46 +0100, Peter Rosin wrote:
> The envelope detector can analyze 6 different signals, selectable with a
> mux controlled by three gpio pins.
> 
> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> ---
> 
> Hi!
> 
> This patch makes use of the mux subsystem and a couple of drivers
> available in linux-next since a week or two. The stuff this depends
> on has relevant acks, specifically on the DT bindings, so the bindings
> should be stable and not cause trouble for this patch. Which is why I
> thought I'd try to get this in for v4.12-rc1 along with that mux
> subsystem series.
> 
> Please consider applying.
> 
> Cheers,
> peda
> 
> arch/arm/boot/dts/at91-tse850-3.dts | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
