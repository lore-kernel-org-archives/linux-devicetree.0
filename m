From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Compatible string best practices
Date: Tue, 27 May 2014 10:15:35 -0700
Message-ID: <6b2f3662-caa1-4a00-a006-1f251f32770f@BN1AFFO11FD054.protection.gbl>
References: <cc5b8415-4297-49fb-8a2c-bdc4b1b19c2c@BY2FFO11FD033.protection.gbl>
 <20140523160331.GA6969@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140523160331.GA6969@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "git-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <git-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-05-23 at 05:03PM +0100, Mark Rutland wrote:
> On Fri, May 23, 2014 at 04:03:06PM +0100, S=C3=B6ren Brinkmann wrote:
> > Hi,
>=20
> Hi,
>=20
> > I have a question regarding how a compatible string should be creat=
ed.
> > The simple case is obvious:
> >  <IP-vendor>,<IP-type/name>-<IP-revision>
> >=20
> > But what is the recommended string for a SOC specific implementatio=
n of
> > that IP? Let's say for
> >  <SOC-vendor>,<SOC-name>-<SOC-revision>
> > how would I assemble a compatible string to identify the SOC-specif=
ic
> > implementation of IP?
> > I think my biggest confusion is which vendor string to use in that =
case.
> > But in general I'm curious whether some best practice exists for th=
ese
> > cases.
> >=20
> > I think what I've seen most is:
> >  <SOC-vendor>,<SOC-name>-<IP-type>
> >=20
> > But one could probably argue whether to rather use IP-vendor, appen=
ding
> > all the revision strings, ...
>=20
> I would expect that the vendor prefix would be the last entity along =
the
> chain which altered the IP in some way. Say foo sells device to bar, =
who
> do nothing other than sell it to baz who do some hacks to integrate i=
t.
> For that I'd expect something like:
>=20
> compatible =3D "baz,soc-device", "foo,device";
>=20
> I'm not sure with revisions (they're not always that useful), but I'd
> expect that to be kept next to the element it represent the revision
> for:
>=20
> "baz,soc-vX-device-vY", "bar,soc-device-vY", "foo,device-vY",
> "foo,device-vY";

Thanks, Mark!

	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
