From: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
Date: Mon, 13 Jun 2016 09:19:44 +0200
Message-ID: <alpine.DEB.2.02.1606130913400.29701@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com> <20160603165909.09f27ee0@bbrezillon> <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com> <CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
 <20160609200128.5b7a6e29@bbrezillon> <CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com> <20160609222307.5db4e67f@bbrezillon> <alpine.DEB.2.02.1606101433170.30757@lnxricardw1.se.axis.com> <20160610180713.6f09f802@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160610180713.6f09f802@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mychaela Falconia <mychaela.falconia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Fri, 10 Jun 2016, Boris Brezillon wrote:

> > Something that I am mildly miffed about is that I've posted this dr=
iver=20
> > twice before on the mtd list (although, admittedly, not directly ad=
dressed=20
> > to any maintainer), first as an RFC and later as a complete patch, =
without=20
> > a single response. (Apparently Boris you did respond with comments =
on=20
> > Oleksij's driver though which I must have missed). Although an RFC =
might=20
> > not have initiated a detailed review, it would have been a large ad=
vantage=20
> > (and wasted less time for all) if the point of using 'wrong' driver=
=20
> > interface had been brought up and consequently discussed earlier. Y=
es I=20
> > know, everyone is busy, it's easy to miss things, each and every dr=
iver=20
> > can't be reviewed in detail, etc.
>=20
> Yes, I know. I was not maintainer at that time, and was only reviewin=
g
> a few patches from time to time.
> Now that I am, I try to answer as fast as possible. Note that the set
> of requirements might have change with me, so even if someone add
> agreed on you first submission but not taken the patches, I would hav=
e
> required the same set of changes ;).

:-)

Well, I'm not questioning that changes are required, and I'm happy to=20
implement them once I've come to a clear understanding of what is neede=
d,=20
I just would have liked to known about them earlier, especially the maj=
or=20
concepts.

I know there was probably no one interested enough at the time, everyon=
e=20
is busy, not every idea presented can be reviewed in detail etc etc. An=
d=20
it's not a big issue, just a minor annoyance.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
