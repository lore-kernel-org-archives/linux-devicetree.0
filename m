From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Date: Tue, 24 Mar 2015 17:55:34 -0700
Message-ID: <20150325005534.GC2677@norris-Latitude-E6410>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <20150312105824.GD30145@leverpostej>
 <20150320191258.GW32500@ld-irv-0074>
 <CACna6ryvD2Dn2eQPMvoJ+1Yt75=w1J6OR=tvOSZsMsBgD2O4yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6ryvD2Dn2eQPMvoJ+1Yt75=w1J6OR=tvOSZsMsBgD2O4yg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 22, 2015 at 12:30:05AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 20 March 2015 at 20:12, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > Yes, and that is an eventual goal I suppose, but the current list i=
s
> > excessive and is most likely not currently relied on by any one. So=
 I
> > don't just want to C&P the entire list into this binding immediatel=
y.
> >
> > I guess my plan looks like this:
> >
> > 1. add "nor-jedec" binding, to provide lowest common denominator bi=
nding
> > (this series)
> >
> > 2. stop adding to the m25p_ids[] table unless necessary (enabled by=
 this
> > series)
> >
> > 3. gauge whether we can remove certain entries from m25p_ids[] (e.g=
=2E, if
> > they were only used in platform_data, not DT; or if they were very
> > recently added just to synchronize with spi-nor.c)
>=20
> Why we can't remove (slowly) all entries from m25p_ids that don't nee=
d
> any extra handling?
>=20
> If we'll have DT with
> "spansion,m25p80", "nor-jedec"
> and then m25p80.c will handle both: "m25p80" and "nor-jedec" without
> any difference, what's the point of keeping "m25p80" entry?

ABI stability. A lot of DTBs might be using m25p80 already, and they
aren't supposed to have to update just because SW decided to drop them.
But see [1] for the official word on ABI stability. I think that leaves
room for removing most/all of these eventually.

Brian

[1] Documentation/devicetree/bindings/ABI.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
