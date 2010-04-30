From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/5] powerpc/mpc5121: shared DIU framebuffer support
Date: Fri, 30 Apr 2010 11:22:54 -0500
Message-ID: <20100430162254.GA24285@schlenkerla.am.freescale.net>
References: <1272584978-19063-1-git-send-email-agust@denx.de>
	<1272584978-19063-4-git-send-email-agust@denx.de>
	<s2ted82fe3e1004291905mf562f0cbi24054bb973aa2dbb@mail.gmail.com>
	<20100430121947.1d265ca6@wker>
	<x2ned82fe3e1004300808q757826cs864ac1c7c082f81@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <x2ned82fe3e1004300808q757826cs864ac1c7c082f81-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur.tabi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wd-ynQEQJNshbs@public.gmane.org, dzu-ynQEQJNshbs@public.gmane.org, John Rigby <jrigby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, yorksun-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 30, 2010 at 10:08:45AM -0500, Timur Tabi wrote:
> On Fri, Apr 30, 2010 at 5:19 AM, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org> wrote:
> =

> >> How about just doing this?
> >>
> >> .init_early =A0 =A0 =A0 =A0 =A0 =A0 =3D mpc512x_init_diu,
> >
> > I thought it should be prepared for adding other code here.
> > mpc5121_ads_init_early() is generic and could contain other
> > things as well. I would vote for current version.
> =

> Do you have any plans to add any additional code?   If not, then I say
> skip the middle-man.  If someone ever needs to do more, he can always
> put that function back.
> =

> >> I'm pretty sure the compiler will optimize this to:
> >>
> >> =A0 =A0 temp =3D (1000000000000UL / pixclock);
> >>
> >> so you may as well do it that way.
> >
> > ??
> > 1000000000000 is _not_ UL, but UUL.
> =

> That's what I meant.  Actually, I think it's ULL.  Regardless, I think
> the compiler will see the  "1000000000 ... * 1000" and just combine
> them together.  You're not actually outsmarting the compiler.

The compiler will do no such thing.  That's a valid transformation when
doing pure math, but not when working with integers.

> >> > + =A0 =A0 =A0 err =3D 100000000;
> >>
> >> Why do you assign err to this arbitrary value?
> >
> > Dunno. It is Freescale's code and I do not have time to check
> > and understand each bit of it and to explain it.
> =

> *sigh*  You're not the first person to modify the DIU driver without
> understanding what it all does.  I suspect that the original author
> should have done this:
> =

>     err =3D -1;
> =

> because he wanted it to be the largest possible integer.

-1 is not the largest possible integer.  LONG_MAX, perhaps?

-Scott
