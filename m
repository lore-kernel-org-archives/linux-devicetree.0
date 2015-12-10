From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
Date: Thu, 10 Dec 2015 13:06:56 -0800
Message-ID: <20151210210656.GM144338@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <CAOiHx==8TFK9t4h2C0Q+j==nuRP3EbyVa+nuYuSEj_LCDa820Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOiHx==8TFK9t4h2C0Q+j==nuRP3EbyVa+nuYuSEj_LCDa820Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, David Hendricks <dhendrix-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 05, 2015 at 12:35:42PM +0100, Jonas Gorski wrote:
> On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi,
> >
> > There have been several discussions [1] about adding a device tree binding for
> > associating flash devices with the partition parser(s) that are used on the
> > flash. There are a few reasons:
> >
> >  (1) drivers shouldn't have to be encoding platform knowledge by listing what
> >      parsers might be used on a given system (this is the currently all that's
> >      supported)
> >  (2) we can't just scan for all supported parsers (like the block system does), since
> >      there is a wide diversity of "formats" (no standardization), and it is not
> >      always safe or efficient to attempt to do so, particularly since many of
> >      them allow their data structures to be placed anywhere on the flash, and
> >      so require scanning the entire flash device to find them.
> >
> > So instead, let's support a new binding so that a device tree can specify what
> > partition formats might be used. This seems like a reasonable choice (even
> > though it's not strictly a hardware description) because the flash layout /
> > partitioning is often very closely tied with the bootloader/firmware, at
> > production time.
> 
> On a first glance this looks good to me, and looks easily extensible
> for application of non-complete partition parsers.
> 
> E.g. for the "brcm,bcm6345-imagetag" we would want to actually do something like
> 
> partitions {
>     ....
> 
>     partition@0 {
>         reg = <0x0 0x10000>;
>         label = "cfe";
>         read-only;
>     };
> 
>     partition@10000 {
>         reg = <0x10000 0x3d0000>;
>         label = "firmware";
>         compatible = "brcm,bcm6345-imagetag";
>     };
> 
>     partition@3e0000 {
>         reg = <0x3e0000 0x10000>;
>         label = "art";
>         read-only;
>     };
> 
>    partition@3f0000 {
>         reg = <0x3f0000 0x10000>;
>         label = "nvram";
>         read-only;
>     };
> };
> 
> as the image tag can only specify the offsets and sizes of the rootfs
> and kernel parts, but not of any other parts.

I had your (and others') prior attempts and suggestions in mind when
planning this, and I agree that the binding looks extendible to cases
like that. I haven't yet worked out what a good MTD infrastructure for
that would look like, so I stuck with defining and implementing only
what I know use :)

> > Also, as an example first-use of this mechanism, I support Google's FMAP flash
> > structure, used on Chrome OS devices.
> >
> > Note that this is an RFC, mainly for the reason noted in patch 6 ("RFC: mtd:
> > partitions: enable of_match_table matching"): the of_match_table support won't
> > yet autoload a partition parser that is built as a module. I'm not quite sure
> > if there's a lot of value in supporting MTD parsers as modules (block partition
> > support can't be), but that is supported for "by-name" parser lookups in MTD
> > already, so I don't feel like dropping that feature yet. Tips or thoughts are
> > particularly welcome on this aspect!
> 
> I would assume a lot of the cases these would be a chicken-egg
> problem, you need the parser to be able to find and mount the rootfs,
> but you you need mount the rootfs to load the parser.

Not necessarily. One of my current use cases has a boot SPI NOR flash +
an eMMC rootfs. Modules can be loaded from eMMC.

BTW, I'm realizing that if partition parsers are forced to built-in
only, then we'd have to do the same for the MTD core (or at least, the
MTD core that handles partitioning). Not sure if that's a desirable
trade-off. (Again, block support is 'bool' in Kconfig, if we're trying
to compare.)

Brian
