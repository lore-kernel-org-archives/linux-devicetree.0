From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4] of: add functions to count number of elements in a property
Date: Tue, 04 Feb 2014 19:48:17 +0100
Message-ID: <13514940.URVnEJ4NF0@phil>
References: <27256277.YJ687suYy5@phil> <CAL_JsqJord1OOjwcKk1jqF5o+XO3uw+Lc4ATtQacgwZWAoQq1g@mail.gmail.com> <20140204173034.2D899C4050F@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140204173034.2D899C4050F-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Tuesday, 4. February 2014 17:30:34 Grant Likely wrote:
> On Sat, 18 Jan 2014 09:07:30 -0600, Rob Herring <robherring2-Re5JQEeQqe8@public.gmane.org=
m>=20
wrote:
> > On Sat, Jan 18, 2014 at 6:02 AM, Heiko St=C3=BCbner <heiko@sntech.d=
e> wrote:
> > > The need to know the number of array elements in a property is
> > > a common pattern. To prevent duplication of open-coded implementa=
tions
> > > add a helper static function that also centralises strict sanity
> > > checking and DTB format details, as well as a set of wrapper func=
tions
> > > for u8, u16, u32 and u64.
> > >=20
> > > Suggested-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > ---
> >=20
> > Looks good. Do you plan to convert some users to use this?
>=20
> I'll take that as an acked-by. Merged, thanks.

before you taking this patch, I was planning on simply sending this as =
part of=20
my rockchip-smp series - as I'm currently the only user of it :-) .

This going through your tree is most likely the better way, but now I n=
eed it=20
to somehow make its way into arm-soc too ... I guess some sort of stabl=
e=20
branch arm-soc could pull?


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
