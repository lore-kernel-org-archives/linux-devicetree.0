From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
Date: Tue, 14 Nov 2017 15:39:41 +0100
Message-ID: <20171114143941.3qgdlqn4xfarfhql@flea.lan>
References: <20171103195855.15283-2-geomatsi@gmail.com>
 <CAMty3ZCs8kq1vUGLOi0ZghY7n0iXgUQ1E=ngBO6Y4wm7wMLF7Q@mail.gmail.com>
 <20171104154221.ao7kkcwqhnja3cxe@speedy.hunter>
 <20171106122633.5mnqfh6xhmmxr45s@flea>
 <20171106161306.tq6yeq6bq36ridj3@speedy.hunter>
 <CAMty3ZCYQx0MfiJnOZPtO4nSAtOrGicOzw_x_AznTiEW8h2sLg@mail.gmail.com>
 <CAMty3ZANhL7cHqYw4VY2Sj_JUZGyqFZ+7pLssc1tniN3BdupOA@mail.gmail.com>
 <20171107201245.gptgfli54o6eqmrj@speedy.hunter>
 <CAMty3ZB3aXCsd9VkibjxPdA=BXvXr3nMbGJJvtZN_z2SGVUAXA@mail.gmail.com>
 <20171113192411.kmohcthzickk4n5v@speedy.hunter>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7naslupaituavp2i"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171113192411.kmohcthzickk4n5v-tVm4GcgtBpsfMUw/CLfKLg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7naslupaituavp2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Mon, Nov 13, 2017 at 10:24:11PM +0300, Sergey Matyukevich wrote:
> Hello Maxime,
>=20
> On Wed, Nov 08, 2017 at 04:55:32PM +0530, Jagan Teki wrote:
> > On Wed, Nov 8, 2017 at 1:42 AM, Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > > Hi,
> > >
> > >> >>> > Did you try to boot from sdcard ? I am not able to boot my boa=
rd from
> > >> >>> > sd-card without this change. As I mentioned earlier in my email
> > >> >>> > to buildroot mailing list, with mmc debug enabled I see that m=
mc
> > >> >>> > tries to init sd-card when I remove it from the slot.
> > >> >>> >
> > >> >>> > Maybe there is a minor differences between h/w versions or bat=
ches ?
> > >> >>> > What is you board version ? I tested on board v1.0.
> > >> >>>
> > >> >>> Looking at the schematics, it definitely looks like it's active =
low.
> > >> >>
> > >> >> Is it ok to merge it then ? Or using 'cd-inverted' property
> > >> >> is the preferable option ?
> > >> >
> > >> > W/o any change mainline works unstable for me, it wasn't booting
> > >> > at-all[1] did you find the same?
> > >> >
> > >> > Even tried with active LOW and cd-inverted.
> > >> >
> > >> > [1] https://paste.ubuntu.com/25909064/
> > >>
> > >> Look like something broken for H5 and A64 between v4.14-rc8 to latest
> > >
> > > Both 4.13.7 and 4.14-rc8 (synched today) kernels worked fine for me.
> > > DTS behavior is all the same:
> >=20
> > I've tried fresh sync [2] but still see the issue, can you check the
> > Image size of log(suspecting on that area)
>=20
> Do you plan to accept this patch as well ? Or you would prefer to wait
> for the confirmation from Jagan as well ?

I'm happy with the patch, but I was under the impression that the
discussion had not settled yet. If it did, then yeah I'll merge it :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7naslupaituavp2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaCwAtAAoJEBx+YmzsjxAgAdIP/3SOGU3ZT7FC5JSBluSpRdoh
ClDzfISX7pbgCMOMGoqxG6wtUvUx3R7p1hh6FEL5OEoZo87CpqXvYz6RZNLVo28a
EDUCKhqzJM2JChCuwfkDlPqVKgcfSRFyys9/7b6EdY8xYF3xiFbOWx9aBL+LlNTY
BPNMQZTMBvEcy/D7WbgeY2qb22Xj9FtyhYJECOLEw5nngK8Y/ST/Pfr6rOgetQmo
VY9jCg6GDvfKRWZ9Su4qZpXwMc8OVxrl2nPkZliXnI+arm7+Kht+Kh/FjvSMPeEQ
Ms5cyFDUFlbsxAQstIPugi8eYVBm+ySE649IGK5V/4qmh4f2BSrfFKWgJAo1icp5
2AwtDHpx86h/PhHZeQnedOfHE/1PaU+p70rP/XoAcLHl1AZjjMYoXJ9eWMTLm9tK
5MRcD8IAOC6MnD4YGQbZFVnRRJu3KF9y+W4mEscw/wuECPjb8o+5TvoKK7KhXZ0T
2tqsk1QV8eOFAmcDnV8ttUHv1zr+GMUK+EHeICEWlhOp0z9n1RoieXmEHcxtH337
uzWJda18UE8KY/dfE7cdsIXjDc423V0WTm2y1VWuogAFgJ4Rh+Ogc4YJ0Ehjy1xd
pEALPXQwhfyKCLGIRohAEdy31s4eLmxSgjYY2MpO4zBRbdHNM4eZ6J6aXBHL4Ish
cTg55qgs7EOvk4VwUhYp
=0v5A
-----END PGP SIGNATURE-----

--7naslupaituavp2i--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
