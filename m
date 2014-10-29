From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Wed, 29 Oct 2014 13:08:21 +0200
Message-ID: <5450CAA5.5020205@ti.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com> <544F737A.7000109@ti.com> <CAL_JsqJ2JRg7k21CEVe4-At7enD+y3TN_7wfqhY0OHZm-_j17w@mail.gmail.com> <544F7E5D.60104@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="R8PTPoLvQiNvl7iqU3U9jUAweQJhjbGDM"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBL4VYORAKGQEKP2GDRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <544F7E5D.60104-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--R8PTPoLvQiNvl7iqU3U9jUAweQJhjbGDM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Hans, Rob,

On 28/10/14 13:30, Hans de Goede wrote:
> Hi,
>=20
> On 10/28/2014 12:11 PM, Rob Herring wrote:

>> Yes, I object to the binding still as it has not changed from what was=

>> previously posted.
>=20
> It would be helpful if you could explain why you object. Last time you
> said: " You are mixing in a hardware description that is simply inaccur=
ate."
>=20
> I then explained that this is not hardware description, but runtime sta=
te
> information, as it tells the kernel which clocks were chosen to drive t=
he
> display (out of typically a list of possible options, depending on whic=
h
> output is used, etc.). Just like which memory address the bootloader ha=
s
> chosen to scan out the video image from.
>=20
> Then you got quiet, so sorry, but this time your objection really is to=
o
> late. You cannot simply go quiet halfway through a discussion and then =
pop
> up again when a new version is posted to say "I object" yet another tim=
e,
> you've had your chance to make your arguments last time, and chose to s=
tay
> quiet after I explained in detail that this is not hardware description=
 but
> state information, so now it is simply too late.
>=20
> These bindings have been discussed at Plumbers with various interested =
people
> present, and the conclusion was that this really is the best way to han=
dle this,
> so this patch is:
>=20
>     Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>     Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>     Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>     Reviewed-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> And David Herrman who is working on simpledrm, which will be merged soo=
n, which
> will also use the simplefb bindings also agrees. So we have the simplef=
b maintainer,
> simpledrm maintainer, and the clk subsystem maintainer + 2 other mainta=
iners all
> agreeing on a way forward, the time for bikeshedding now really really =
really is
> over.
>=20
> Tomi, can you please let us know how you plan to proceed with this ?

I won't merge DT bindings via fbdev tree, if a DT maintainer says no.

I took Rob's silence to the earlier series as a silent ack for your
explanation. Obviously that was not the case.

Rob, please advice asap what should be done to the bindings to get your
ack. As Hans explained above, this discussion has been going on for a
long time, and afaik this series is the best way forward of all the
options discussed.

 Tomi



--R8PTPoLvQiNvl7iqU3U9jUAweQJhjbGDM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUUMqlAAoJEPo9qoy8lh71rO4P/07cj6xRTdRmk0+1TrMQMCgI
rVsIPuyHAm+0nT0yo/7Dk0VvMu3ox2iWrbUnBMyZ1alQgSN8vTMm4eyjmxdJ+XUJ
DVMeX1GpuuydjpyXxjNeq/xrGalIEie/E1/mCom0Ewr0QCDwG8PRDSaHNUqs2onx
1Dq9zBZ2rZcohBog6elVzJ7TbznUb/JOn2wdj7r0sLd32fcjfUERhhxEozq+tTaD
lVflN2H/zKEUTdWEn5ioMEJscypFG6rW410CzTPZ2tLpMgTc/3qc5nmFZNcqU+sP
mINyPA+RZ8RgIbdSEIcLVaEkI7mUfC/DyOMWQYYM1hZsbDggzMV8DfyfF16JYhWb
6vqYkw2PAErax7EP51nzt1XMuax8/yCAuEZ0Os3JaMJLb9IR0iVb6tMZ5rRjQu8S
yQK9pqLsPq0k7QETtgKensRya4i+q5Blkt0ITQo6owQhp2fQGXUC2jl96CMRwhFj
9mwr01mXhkUA7lQJaN9RDg4D74/Alzu4f/DdJLyrnMJlSS3ojhcmRWyhRarrQElP
kg6O3o9UrSKDd6amsYxH98ZrNm5uD125sn8y0fFzTq1LIsOWQ0FtzvDeQ6Xl0fDI
+JzCKFYVN627wuEOjTyhi0rQ6PndudgRJJMe6/bUKgRa4+CWk+MVHaog04N/uwL2
RLDw6FE9flvdY+6aYrRB
=WwAI
-----END PGP SIGNATURE-----

--R8PTPoLvQiNvl7iqU3U9jUAweQJhjbGDM--
