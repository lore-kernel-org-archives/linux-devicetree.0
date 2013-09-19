From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] Documentation: add LP3943 DT bindings and document
Date: Thu, 19 Sep 2013 12:56:30 +0100
Message-ID: <20130919115629.GF22389@lee--X1>
References: <1378949700-6384-1-git-send-email-milo.kim@ti.com>
 <20130912152455.GN11227@lee--X1>
 <20130915112755.GB9765@ulmo>
 <20130916073000.GA3999@lee--X1>
 <20130919112545.GC10852@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130919112545.GC10852@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 19 Sep 2013, Thierry Reding wrote:

> On Mon, Sep 16, 2013 at 08:30:00AM +0100, Lee Jones wrote:
> > On Sun, 15 Sep 2013, Thierry Reding wrote:
> >=20
> > > On Thu, Sep 12, 2013 at 04:24:55PM +0100, Lee Jones wrote:
> > > > On Thu, 12 Sep 2013, Milo Kim wrote:
> > > [...]
> > > > > diff --git a/Documentation/lp3943.txt b/Documentation/lp3943.=
txt
> > > > > new file mode 100644
> > > > > index 0000000..576ebd0
> > > > > --- /dev/null
> > > > > +++ b/Documentation/lp3943.txt
> > > [...]
> > > > If this stuff is really important (and most of it really isn't)=
, then
> > > > put it either in the commit log or in the driver.
> > >=20
> > > I can only speak for myself, but the initial driver commit messag=
e is
> > > about the last place I look for this kind of information. I'd exp=
ect it
> > > to be either somewhere in Documentation/ or in one of the source =
files.
> > > In this case I'd probably look at the MFD core driver source file=
=2E More
> > > likely, even, I'd just go google "LP3943" and grab a public datas=
heet
> > > from TI where all of this can hopefully be found.
> >=20
> > The latter option is the most common. If the datasheet is publicly
> > available, then there is no rhyme nor reason to put it in the kerne=
l
> > source too. /Documentation is already overloaded, it would be even
> > more so if each and every driver residing in the kernel decided to
> > bulk it up further.
>=20
> Okay. So in this case perhaps Milo should simply drop the documentati=
on
> file. Perhaps link to the public datasheet from on of the source file=
s,
> although that could be problematic if the URL isn't permanent.

I'm not sure even that's required.

I just Googled it and found the datasheet on the first hit.

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
