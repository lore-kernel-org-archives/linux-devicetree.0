From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
Date: Sat, 5 Dec 2015 22:33:30 +0100
Message-ID: <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com> <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 December 2015 at 12:39, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> +
>> +Examples:
>> +
>> +flash@0 {
>> +       partitions {
>> +               compatible = "google,fmap";
>> +       };
>> +};
>
> I wonder if this wouldn't be better served in a separate binding doc
> with its compatible name as the filename, like we do with
> driver^Whardware blocks, especially if we want to add more parsers.


I find that *very* counter productive for bindings that go to the same
node. You have a description of a node, and then suddenly there you
have another file with another description of the same node. Totally
awesome.

Also how do you plan to write partitioning schemes with parameters
like with non-zero offset of the partition table.

Thanks

Michal
