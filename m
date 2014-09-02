From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Tue, 2 Sep 2014 14:37:13 +0100
Message-ID: <20140902133713.GR30401@n2100.arm.linux.org.uk>
References: <20140803130430.GY3952@lukather> <201408031959.27607.arnd@arndb.de> <20140804192510.GF3952@lukather> <20140804212317.GL30282@n2100.arm.linux.org.uk> <20140807132023.GG15297@lukather> <20140902102206.GU15297@lukather> <20140902104002.GN30401@n2100.arm.linux.org.uk> <20140902122716.GV15297@lukather> <5405B986.2080407@redhat.com> <20140902125116.GW15297@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140902125116.GW15297@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 02, 2014 at 02:51:16PM +0200, Maxime Ripard wrote:
> On Tue, Sep 02, 2014 at 02:35:18PM +0200, Hans de Goede wrote:
> > > So I guess like Chen-Yu suggested that we should change the license of
> > > the DTSI first, and then the DTS. Otherwise, it wouldn't work very
> > > well, I guess you can't really relicense a GPL-only file.
> > 
> > IANAL, but mixing MIT (which I suggest use as the other license) and GPL
> > files in one binary (the generated dtb file) is fine AFAIK, this happens
> > all the time. The resulting binary is simple GPL licensed. So it would
> > make sense to start with dual licensing new boards right away even before
> > the dtsi has been relicensed. It won't make any practical difference
> > until the dtsi is relicensed, but it means less work later on.
> 
> So you're allowed to licence derivative work of a GPL-licenced file
> under both the GPL and another licence?

The copyright owners of any work are permitted to release it under
whatever license(s) they deem appropriate.  These can be many licenses,
and need not be compatible with each other.  More careful handling of
contributions is required to ensure that the contributors are happy for
their submissions to be used under all licenses to avoid unintentional
forking the work.

> And as far as MIT vs BSD is concerned, I don't really have an
> opinion. Arnd? Russell?

I decided upon the X11 license (MIT produced several licenses, so
using "MIT" is ambiguous) rather than BSD (due to confusion over
the number of clauses.)

It's worth a read through http://www.gnu.org/licenses/license-list.html
if you haven't already before making a decision.

I think we should also have a statement that this only applies to the
DT files concerned, and nothing else, to ensure that nothing is
misconstrued.

I'll also drop Linus an email to see whether he has any concerns with
this.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
