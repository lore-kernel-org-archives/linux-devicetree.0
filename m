From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Tue, 13 Oct 2015 09:02:18 +0100
Message-ID: <20151013080218.GV17172@x1>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151012134309.GE1542-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Oct 2015, Mark Brown wrote:

> On Mon, Oct 12, 2015 at 09:45:54AM +0100, Charles Keepax wrote:
> > On Wed, Oct 07, 2015 at 01:26:42PM +0100, Lee Jones wrote:
> > > On Wed, 07 Oct 2015, Mark Brown wrote:
>=20
> > > > This all seems pretty much fine to me - the things it is contro=
lling are
> > > > fairly specific to the way the former Wolfson devices do, they =
only
> > > > really make sense with a fairly particular algorithm which isn'=
t widely
> > > > implemented.
>=20
> > > Is that an Ack?
>=20
> > I am guessing Mark is slightly hesitant to ack as he probably
> > doesn't want to add reviewing all our jack detection bindings to
> > his already fairly sizable work load and doing so here likely
> > means it will be expected in the future. From talking to people at

Providing Acks should not (and has not to my knowledge) be a binding
contract to continue providing Acks.  However, should more bindings be
submitted which appear as though they are related to a particular
maintainer, then sure, you'll be asked for your expert eye again.

> Pretty much (plus generally being busy at ELC-E last week) - if there=
's
> specific questions that's one thing but if it's just general requests=
 to
> look at bindings then it seems like the relevant subsystem maintainer=
s

This is exactly my point.  I am not the 'relevant subsystem
maintainer' for these properties and subsequently know nothing of
microphone detection, headsets, bias', etc.  These look like Audio
related properties to me (the uninitiated), which is why you were
asked.

> should have the confidence to review straightfoward device properties
> like this.

I don't think these bindings are particularly straightforward.  The
contain many terms which I'm unfamiliar with, and again, to me (the
uninitiated) this looks like way too many bindings just to see if an
audio jack is plugged in or not.

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
