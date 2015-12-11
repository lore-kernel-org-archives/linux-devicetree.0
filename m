From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
Date: Fri, 11 Dec 2015 16:58:00 +0100
Message-ID: <CAOMqctQyS0dTAn6nifNzTFTqAZ3caJTj=yKnawP-A3Z4=Sv5rw@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box> <20151210204324.GK144338@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151210204324.GK144338-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 10 December 2015 at 21:43, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Dec 07, 2015 at 12:36:28PM +1100, David Gibson wrote:
>> On Sat, Dec 05, 2015 at 10:33:30PM +0100, Michal Suchanek wrote:
>> > On 5 December 2015 at 12:39, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>> > > On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
>> > > <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >
>> > >> +
>> > >> +Examples:
>> > >> +
>> > >> +flash@0 {
>> > >> +       partitions {
>> > >> +               compatible = "google,fmap";
>> > >> +       };
>> > >> +};
>> > >
>> > > I wonder if this wouldn't be better served in a separate binding doc
>> > > with its compatible name as the filename, like we do with
>> > > driver^Whardware blocks, especially if we want to add more parsers.
>> >
>> >
>> > I find that *very* counter productive for bindings that go to the same
>> > node. You have a description of a node, and then suddenly there you
>> > have another file with another description of the same node. Totally
>> > awesome.
>>
>> I can't actually work out from that if you're agreeing with the
>> original post or the first reply.
>
> Perhaps I'm biased, but I think he was agreeing with the first reply.
> (Particularly, "I find that *very* counter productive" uses the word
> "that" to refer to "separate binding doc[s]".)
>
>
> I believe Michal is bringing up the (important, IMO) point that if
> distinct partition types are being described in the same node, then any
> use of additional properties *must* be closely coordinated. We can't
> have two parsers "foo" and "bar" defining conflicting uses of the same
> property in the same node, like this:
>

I have seen some MFD bindings which are described in multiple files
with no crossreference whatsoever.

If on-flash partition table bindings are going to be the same then
people are not going to find there are even some on-flash partition
table bindings (because the document describing the in-DT bindings is
complete and exhaustive, right). Can't even imagine coordination.

When you have to grep the tree for docs anyway what's even the point
of the Documentation directory?

You can just grep the whole tree.

Thanks

Michal
