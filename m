From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 18 Nov 2013 21:38:05 +0000
Message-ID: <20131118213805.D4158C401C6@trevor.secretlab.ca>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <3371903.8j54vrCjEN@wuerfel> <20131118150455.GD24408@sirena.org.uk> < 201311181610.33105.arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201311181610.33105.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 18 Nov 2013 16:10:32 +0100, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 18 November 2013, Mark Brown wrote:
> > On Sun, Nov 17, 2013 at 07:10:51PM +0100, Arnd Bergmann wrote:
> > > On Sunday 17 November 2013 17:18:03 Stefano Stabellini wrote:
> > 
> > > > Simply using DT would help avoiding the awkward situation where a driver
> > > > of a device only works with one of the two description formats and not
> > > > the other.
> > 
> > > Yes, but remember that Intel still have the problem on their embedded
> > > systems, and will want to solve them.
> > 
> > Has it been confirmed that Intel are going with ACPI for their embedded
> > devices rather than SFI?  That would be nice given how awful SFI is and
> > I have heard that before but I'm not sure I've seen anything official.
> 
> Possibly not all of Intel agrees to that, but I think that's what I've 
> heard from Darrent Hart and David Woodhouse. I doubt you can get an
> "official" confirmation about it. I also don't know if there is a follow-up
> for the Intel CE4100 that started using DT[1].

Darren is using it to enable Minnowboard, and there is active work on
the GPIO, SPI and other subsystems to bring in ACPI support.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
