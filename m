From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Fri, 03 Oct 2014 18:42:24 +0200
Message-ID: <2162399.E7Ru1MI0QH@wuerfel>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com> <2386503.dNPayhXJTQ@wuerfel> <20141003162513.GW26643@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141003162513.GW26643@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 03 October 2014 17:25:13 Mark Rutland wrote:
> > From a system design point, it's still horrible that you have to use
> > DT for a device that is on a discoverable bus like PCI, but as you describe,
> > the reality is that products are shipping that use ath10k PCI devices
> > without this data in them.
> 
> I'd see any DT property for this as a workaround, the use of which
> should be discouraged.

By extension though, any use of DT is really a workaround for the fact
that embedded systems and SoCs don't use discoverable buses, and it should
be discouraged. x86 SoCs actually get this right to a large degree by
making on-chip devices appear as PCI devices that can be used standalone,
although Intel's latest generation SoCs are regressing in this regard
and you still need DT (or something like it) to describe off-chip devices
there.

> A fun question that springs to mind is can the ath10k chip be removed,
> and if so am I able to place it into a non-DT system (whereupon I have
> no calibration data, so it won't work)?

Some can be removed, others cannot. If the chip is on a removable pcie
mini card and doesn't have that data on the card itself, it's already
impossible to put it into another system. I don't think we need to solve
that case.

We have similar issues with removable but nondiscoverable USB and SDIO
devices, e.g. when they are lacking the PROM for the mac address.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
