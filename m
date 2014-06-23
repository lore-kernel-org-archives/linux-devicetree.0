From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v7 1/2] video: ARM CLCD: Add DT support
Date: Mon, 23 Jun 2014 15:10:23 +0100
Message-ID: <20140623141022.GJ32514@n2100.arm.linux.org.uk>
References: <1403018494-10264-1-git-send-email-pawel.moll@arm.com> <CAFEAcA-NZiRDDeUc7n+6hxgjG1V3qYXPAwyfSdtyz=ZCcD8kiw@mail.gmail.com> <1403531535.3804.11.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403531535.3804.11.camel@hornet>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml - Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 23, 2014 at 02:52:15PM +0100, Pawel Moll wrote:
> On Fri, 2014-06-20 at 23:27 +0100, Peter Maydell wrote:
> > How does this work for boards like the versatilepb which have a
> > mux between a PL110 and the TFT, allowing it to efffectively
> > rewire the pads at runtime under control of the SYS_CLCD
> > sysreg (to give a wider range of colour modes than the
> > PL110 supports natively)?
> 
> The particular case you're referring has been already discussed several
> times, and the bottom line here is that it's not PL111 compatible (there
> are more changes than just the mux) and will need separate "compatible"
> value and some tweaks in the driver (in the places currently doing
> CONFIG_ARCH_VERSATILE).
> 
> Now, if it was PL111 with an external, independent muxer, the pads
> description would still hold its value (PL111's R would still be wired
> up at a particular pad etc.) and the display pipeline drivers would have
> to handle the case.

Err.  Somehow, I don't think you understand the hardware you're messing
with there.  Remember, I wrote support all the support code for the
PL11x and supporting this.

Yes, the Versatile PL110 has one difference: it has the IENB and CNTL
registers swapped compared to the conventional PL110 devices.  This can
be handled via an appropriate compatible property.  The hardware cursor
registers are also omitted, but that's irrelevant as we don't use that.

Other than that, it's a standard PL110.  Connected to its outputs is a
PLD.  Inside the PLD is a mux controlled via the SYS_CLCD register.

As far as the CLD outputs are concerned, they are standard.  The PLD on
their outputs routes the CLD bits to the 8-bit red, green and blue
channels according to the configuration of SYS_CLCD to achieve the
various colour formats which the CLCD does not natively provide for.

So, it /is/ a PL110 with an independent external muxer.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
