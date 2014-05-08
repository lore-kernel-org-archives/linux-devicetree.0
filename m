From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 0/2] ARM: sunxi: Enable syscon for the
 system controller
Date: Wed, 7 May 2014 22:04:25 -0500
Message-ID: <20140508030425.GJ7047@lukather>
References: <1399212160-26934-1-git-send-email-carlo@caione.org>
 <20140505225517.GE9464@lukather>
 <CAGb2v66JBM_Rv8ie=7iuTPrXGPJECTeevnf9LLXNS=FSYs1+Tg@mail.gmail.com>
 <CAOQ7t2akOEr7o4Q5ze5QPr_RHj6MWmA-u5NTuq2q1epy2LBr8w@mail.gmail.com>
 <20140507032502.GM9464@lukather>
 <CAOQ7t2byRX3HmVjUKYZ-VEocR3S2ATLpSTPV8bdFD98_Q2sY9Q@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ublo+h3cBgJ33ahC"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB37JVONQKGQECQCMWQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOQ7t2byRX3HmVjUKYZ-VEocR3S2ATLpSTPV8bdFD98_Q2sY9Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wens Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Ublo+h3cBgJ33ahC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 10:19:19AM +0200, Carlo Caione wrote:
> On Wed, May 7, 2014 at 5:25 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Tue, May 06, 2014 at 10:03:19AM +0200, Carlo Caione wrote:
> >> On Tue, May 6, 2014 at 8:36 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> >> > Hi,
> >>
> >> Hi,
> >>
> >> > On Tue, May 6, 2014 at 6:55 AM, Maxime Ripard
> >> > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> >> On Sun, May 04, 2014 at 04:02:38PM +0200, Carlo Caione wrote:
> >> >>> The so called "system controller" in Allwinner A20 and A31 SoCs is
> >> >>> multi-purpose controller that tries to add misc functionality to o=
ne
> >> >>> memory region.
> >> >>> In these SoCs it controls the internal SRAM partitioning but it al=
so
> >> >>> includes registers for chip versioning and NMI control.
> >> >>> This patch adds the proper nodes in the DTS files and enable the s=
yscon
> >> >>> in the defconfig files.
> >> >>>
> >> >>> Even though the system controller includes also register for manag=
ing the
> >> >>> NMI controller, these register are not mapped in the syscon since =
they
> >> >>> are directly used and mapped by the NMI controller itself.
> >> >>
> >> >> Hmmm, what exactly do you want to achieve with this?
> >> >>
> >> >> The NMI controller won't be able to use it, since it's initialized
> >> >> much earlier than syscon and regmap.
> >>
> >> This is what I meant with that phrase. NMI controller doesn't use the
> >> syscon but we can use it for several other drivers.
> >
> > I'm sorry, but I believe this should be more handled by the soon-to-be
> > drivers/soc "framework".
>=20
> Oh, didn't know of this framework. Is it supposed to replace syscon?

It's supposed to be a framework to handle all the weird things the
SoCs have, that have to be enabled soon, and don't really fit into any
of the existing frameworks, or multiple of them. Which looks pretty
much like what we are experiencing here.

> >> In fact the registers for NMI controller are excluded from the range
> >> of syscon registers.
> >
> > Then you are lying in the DT :)
>=20
> Uhm, in DT I have:
>=20
> reg =3D <0x01c00000 0x27>;
>=20
> that is I'm mapping the first three registers: SRAM_CTRL_REG0,
> SRAM_CTRL_REG1, VER_REG, leaving out the three register (from offset
> 0x30) of the NMI controller.
> I'm not lying :)

Then you want to set 0x30 as a base. And ok, you're splitting this in
two.


> >> > I believe this will be used for toggling the SRAM mappings. (Am I ri=
ght?)
> >>
> >> Definitely right.
> >>
> >> > The second register toggles mappings for MUSB FIFO, EMAC, and a few =
of
> >> > the other IP blocks we currently don't support.
> >>
> >> Not yet :)
> >
> > I wonder how other SoCs are actually handling this mapping between CPU
> > & DMA vs device of some SRAMs. Did you look at this?
>=20
> It seems quite a few grepping for syscon

??

What do you mean?

I wasn't really talking about syscon itself, just how other SoCs
usually deals with this kind of remapping usually.

> >> >> Moreover, the A31 doesn't seem to have this system controller, or at
> >> >> least this overlap.
> >>
> >> I admit that I didn't check the A31 manual but I trusted the wiki page
> >> at http://linux-sunxi.org/SRAM_Controller and
> >> http://linux-sunxi.org/A31/Memory_map
> >>
> >> > There should be something similar, as does the A23. There is no over=
lap AFAIK.
> >>
> >> I agree and will check also A23.
> >>
> >> >> And since on the A20, registers seem to have one usage only, so I
> >> >> guess we can just split this IP into several nodes, just like we did
> >> >> with the NMI.
> >> >
> >> > As stated above, the second register toggles SRAM mappings for at mo=
st
> >> > 4 SRAM blocks (for EMAC, MUSB, ACE, ISP).
> >> >
> >> > syscon would be a good way to share this register among the various =
drivers.
> >> > We do not toggle it in the current EMAC driver. The driver seems to =
assume
> >> > it is setup by the bootloader, and on the A20, it seems to be mapped=
 to
> >> > EMAC by default.
> >> >
> >> > The MUSB glue layer driver must toggle this.
> >>
> >> This is exactly why I wrote these patches. I started hacking /
> >> studying your MUSB driver and I think that using syscon is a better
> >> way to manage these registers instead of mapping them in several
> >> drivers also because most of the time a single register has to be used
> >> by multiple drivers (i.e. SRAM_CTL1_CFG is used for USB,  EMAC,
> >> etc...)
> >>
> >> > I think this approach is better than all the individual drivers mapp=
ing
> >> > the registers and toggling a single bit. In fact I did something sim=
ilar
> >> > when working on preliminary musb support.
> >
> > I agree with that.
>=20
> So do you suggest to drop the syscon idea waiting for the new soc
> framework?

To be honest, I don't really know what to think of it. I'd need to see
some code that uses this. Maybe we can just postpone the decision to
whenever we will actually have some code submitted that make any use
of this?

If it's easier for you to keep the syscon at the moment for whateever
driver you're working on before submitting it, I'm fine with it, but
I'm not going to merge it right now either.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Ublo+h3cBgJ33ahC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTavQ4AAoJEBx+YmzsjxAgWgwQAIMvnsAx5HuxZcs97Q1WvM3n
JBfjl5v1O6uIvtjwZzXm793nlBmKadaaHl8WrNAy2rMRrcQI8Zwd4HfPhyxv6rbn
zaxGXGQRpFArFIPOoVHPltGiLGmbJDzJUg0tz0tg0Zd4zeZ+e/Sy3ZujpEaOcDBq
TWsotoXblj9VUkgY2t1Z1lhsQeotMX8EHX8SZyutMecCaAYreQ14IBHbbTfA4kOG
GBECLp/B1197bxt0/cnQMgDZl+J6XsfJqC/ix0UPFQDU/m2o7irNT27t9vspmOdr
H9a/JDK/llDmgG3AigAG4dARGWH2sZ0WziCVvKcSBEZvKBilxJLRGuSA3Le/ErGa
p+LFHbUU7l3VScoCcLjlXdtXyuT98bBNwLgB/Kd45V7MEJK5lUzfltb7EHPMxfbF
DI9e4Kdn7L0jWFawOyuY1rPCtJGs98E58Nt5LaQOEMK6QOGRe/I2M16vQKKwqPTJ
QtU9t6jxWvJDy2VhElpC36Sq5x4rMn/pR6QL2U0zljhf7IvlyHHza2k+s0IUdsEN
RIbpZO3ExA4ZF1MROUjhOjH3IJS+0xE0y02g04nwu+HsXRVweqd/OEG+X1PPg9vk
0J/KjMDG6WDPjfS5fjkXmAM9wGtFXT+vHpjAblItoBG9yBgafa1ahsgCytOblNYZ
HuRNGVjlRmM3fs6ifpIY
=thVE
-----END PGP SIGNATURE-----

--Ublo+h3cBgJ33ahC--
