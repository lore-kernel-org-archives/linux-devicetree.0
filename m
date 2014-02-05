From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4] of: add functions to count number of elements in a property
Date: Wed, 05 Feb 2014 13:45:36 +0100
Message-ID: <8812602.o5pus1vSFK@phil>
References: <27256277.YJ687suYy5@phil> <13514940.URVnEJ4NF0@phil> <20140205120652.9B1A7C40A89@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140205120652.9B1A7C40A89-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 5. Februar 2014, 12:06:52 schrieb Grant Likely:
> On Tue, 04 Feb 2014 19:48:17 +0100, Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> > Hi Grant,
> >=20
> > On Tuesday, 4. February 2014 17:30:34 Grant Likely wrote:
> > > On Sat, 18 Jan 2014 09:07:30 -0600, Rob Herring <robherring2@gmai=
l.com>
> >=20
> > wrote:
> > > > On Sat, Jan 18, 2014 at 6:02 AM, Heiko St=C3=83=C2=BCbner <heik=
o@sntech.de>=20
wrote:
> > > > > The need to know the number of array elements in a property i=
s
> > > > > a common pattern. To prevent duplication of open-coded
> > > > > implementations
> > > > > add a helper static function that also centralises strict san=
ity
> > > > > checking and DTB format details, as well as a set of wrapper
> > > > > functions
> > > > > for u8, u16, u32 and u64.
> > > > >=20
> > > > > Suggested-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > > > ---
> > > >=20
> > > > Looks good. Do you plan to convert some users to use this?
> > >=20
> > > I'll take that as an acked-by. Merged, thanks.
> >=20
> > before you taking this patch, I was planning on simply sending this=
 as
> > part of my rockchip-smp series - as I'm currently the only user of =
it :-)
> > .
> >=20
> > This going through your tree is most likely the better way, but now=
 I need
> > it to somehow make its way into arm-soc too ... I guess some sort o=
f
> > stable branch arm-soc could pull?
>=20
> Nah, I'll drop it from my tree. Add my acked-by and merge it via
> arm-soc.

As I said on IRC, now it seems like you can keep this patch in your tre=
e :-)

If we're really going with reserved-memory like you suggested in the ro=
ckchip-
smp series it removes the need to count u32-elements in a property for =
me, as=20
the reserved blocks move into individual subnodes.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
