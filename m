From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: juno: Correct PCI IO window
Date: Wed, 30 Nov 2016 23:51:05 +0100
Message-ID: <7823573.FNB8ayVOnQ@wuerfel>
References: <1480452310-29286-1-git-send-email-jeremy.linton@arm.com> <92ac8013-b88e-2f74-9a49-7d5f38a4e7a5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <92ac8013-b88e-2f74-9a49-7d5f38a4e7a5-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jeremy Linton <jeremy.linton-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday, November 30, 2016 4:29:35 PM CET Sudeep Holla wrote:
> Hi Jeremy,
> 
> On 29/11/16 20:45, Jeremy Linton wrote:
> > The PCIe root complex on Juno translates the MMIO mapped
> > at 0x5f800000 to the PIO address range starting at 0
> > (which is common because PIO addresses are generally < 64k).
> > Correct the DT to reflect this.
> >
> 
> I have another DT fix that I have asked ARM-SoC guys to pick up directly
> from the list. If that doesn't happen, I will send PR including both.
> 
> If that happens then we need to send this to them to be picked directly.
> At this point I want to wait for couple of days to avoid confusion.

I ended up taking the other one for v4.10, but this one seems more
important so I applied it for v4.9.

Let me know if you disagree with the priorities, as I plan to send out
the last 4.9 fixes pull request to Linus tomorrow.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
