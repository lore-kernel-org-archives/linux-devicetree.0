From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [Question] refcount of DT node
Date: Thu, 14 Apr 2016 19:38:55 +0100
Message-ID: <20160414183855.GU19428@n2100.arm.linux.org.uk>
References: <CAK7LNATFUW2KXUpFas6C_SJ0C7Qb1DWU0njLg-FCYciK2U6Oag@mail.gmail.com>
 <20160414084849.GT19428@n2100.arm.linux.org.uk>
 <20160414095957.GB10273@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160414095957.GB10273@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: rank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 10:59:57AM +0100, Mark Rutland wrote:
> On Thu, Apr 14, 2016 at 09:48:49AM +0100, Russell King - ARM Linux wrote:
> > On Thu, Apr 14, 2016 at 04:47:57PM +0900, Masahiro Yamada wrote:
> > > Hi experts.
> > > 
> > > My understanding of refcount of DT node is poor.
> > 
> > The message from DT people is... don't worry about DT node refcounting.
> > Do whatever you want with it, they don't care whether you have correct
> > refcounting or not.
> > 
> > The background behind that is that I've tried to fix the refcounting,
> > and even had the coccinelle people generate some stuff to work on this
> > issue, but DT people's attitude towards it is "don't bother".
> > 
> > So yes, people may get it wrong, but it seems it's something that DT
> > people want ignored.
> 
> I'm not sure that's quite fair; the last discussion I recall about this
> ended up concluding that we need a better API, rather than papering over
> problems.

Sorry, but I started out trying to get the of_node_put() stuff
correct, and sparked Julia into doing coccinelle patches, and I
was told by Rob that we shouldn't care about of_node_put() being
wrong, and the feeling is as I stated it: DT folk don't care
enough to fix the existing places, even though a great many can
be sorted via the coccinelle approach.

Their stance is not something I agree with - if we have something,
it should be correct, even if it's not what we would ultimately
desire, _or_ it should be removed.  This half-way house that we
have today is total madness to me.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
