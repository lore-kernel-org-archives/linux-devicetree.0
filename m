From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Wed, 14 Oct 2015 13:30:14 +0100
Message-ID: <20151014123014.GJ32409@x1>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1>
 <20151013151252.GH14956@sirena.org.uk>
 <20151014072812.GE32409@x1>
 <20151014094903.GP14956@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151014094903.GP14956-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 14 Oct 2015, Mark Brown wrote:

> On Wed, Oct 14, 2015 at 08:28:12AM +0100, Lee Jones wrote:
> > On Tue, 13 Oct 2015, Mark Brown wrote:
> > > On Tue, Oct 13, 2015 at 09:02:18AM +0100, Lee Jones wrote:
>=20
> > > > Providing Acks should not (and has not to my knowledge) be a bi=
nding
> > > > contract to continue providing Acks.  However, should more bind=
ings be
> > > > submitted which appear as though they are related to a particul=
ar
> > > > maintainer, then sure, you'll be asked for your expert eye agai=
n.
>=20
> > > It's a bit concerning when it seems like my review is becoming a =
blocker
> > > for something and I don't understand why.
>=20
> > Not necessarily _your_ review.  Just someone, other than the
> > submitter, who I trust and knows about this stuff.  You just happen=
=20
> > to tick those boxes this time.  Cross pollination and knowledge sha=
ring
> > is one of the characteristics of MLs which I'm particularly proud o=
f.
>=20
> That was what it read like.
>=20
> > > When your power budget is in the low double digit microamps and y=
ou're
> > > trying to respond promptly and reliably to rapidly changing and v=
ariable
> > > physical inputs it gets complicated.
>=20
> > This is exactly why I asked you.
>=20
> > Thanks for adding structure to my PoV. ;)=20
>=20
> So, a more specific question would have helped - just a general "any
> thoughts" type question isn't very clear.

To both comments -- this is how I phrased it:

"I either need an Ack from the DT folks, or at least someone who knows
about this stuff.  Mark perhaps."

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
