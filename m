From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
Date: Thu, 10 Dec 2015 12:43:24 -0800
Message-ID: <20151210204324.GK144338@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151207013628.GC20139-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 07, 2015 at 12:36:28PM +1100, David Gibson wrote:
> On Sat, Dec 05, 2015 at 10:33:30PM +0100, Michal Suchanek wrote:
> > On 5 December 2015 at 12:39, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> > > On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> > > <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > 
> > >> +
> > >> +Examples:
> > >> +
> > >> +flash@0 {
> > >> +       partitions {
> > >> +               compatible = "google,fmap";
> > >> +       };
> > >> +};
> > >
> > > I wonder if this wouldn't be better served in a separate binding doc
> > > with its compatible name as the filename, like we do with
> > > driver^Whardware blocks, especially if we want to add more parsers.
> > 
> > 
> > I find that *very* counter productive for bindings that go to the same
> > node. You have a description of a node, and then suddenly there you
> > have another file with another description of the same node. Totally
> > awesome.
> 
> I can't actually work out from that if you're agreeing with the
> original post or the first reply.

Perhaps I'm biased, but I think he was agreeing with the first reply.
(Particularly, "I find that *very* counter productive" uses the word
"that" to refer to "separate binding doc[s]".)

> > Also how do you plan to write partitioning schemes with parameters
> > like with non-zero offset of the partition table.

If you are directing this question at me: I don't have a specific plan
for it. MTD parsers don't currently take external input for this; many
scan the whole device, but some might also have conventions built into
the parser itself too, so this just gets hooked based on "compatible".
But if the need arose, I would hope we could work out a common binding.

> Presumably with properties in the patitions node.  Not seeing the
> problem here.

I believe Michal is bringing up the (important, IMO) point that if
distinct partition types are being described in the same node, then any
use of additional properties *must* be closely coordinated. We can't
have two parsers "foo" and "bar" defining conflicting uses of the same
property in the same node, like this:

	partitions {
		compatible = "foo", "bar";
		property-baz = ...; // e.g., reg = <...>;
	};

where if "foo" is not found, we fall back to "bar". But what if "foo"
and "bar" use "property-baz" differently?

Having everything in one doc would help ensure that the entire
"partitions" binding is considered as a whole when extending it, in my
(and an in my interpretation of Michal's) opinion.

Brian
