From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Mon, 14 Jun 2010 10:59:20 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1006141044510.13427@xanadu.home>
References: <33BD8E86-9397-432A-97BF-F154812C157B@digitaldans.com>
	<AANLkTilv6TtPZs0DAwd8JlSV_J3VvMsvtVVOOeQauOIn@mail.gmail.com>
	<4C13430B.5000907@firmworks.com> <1276339529.1962.184.camel@pasglop>
	<1276339684.1962.186.camel@pasglop> <4C13B618.1030006@firmworks.com>
	<1276383132.1962.195.camel@pasglop>
	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>
	<4C146F18.9030008@firmworks.com>
	<AANLkTikls3hjXOmKFqG2D_9GaJSjOXNuuRXPlanAjo5E@mail.gmail.com>
	<20100614124438.GF9323@yookeroo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_2EWCd8jZTlRoOyyIIEN3DA)"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100614124438.GF9323@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Dan Malek <ppc6dev-7kUUosv42bfn7oBBQGLwdg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_2EWCd8jZTlRoOyyIIEN3DA)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Jun 2010, David Gibson wrote:

> On Sun, Jun 13, 2010 at 11:02:15PM -0600, Grant Likely wrote:
> [sni]
> > > That's sort of a self-fulfilling prophecy. =A0If the OS doesn't tru=
st the
> > > firmware, there is no pressure for the firmware to "get it right".
> >=20
> > Firmware will not get it right.  Period.  There will always be
> > something wrong.  It is never right on PCs.  It will never be right o=
n
> > the other architectures.
>=20
> Yes, yes, yes.  And there is a great deal of empirical evidence to
> back that assertion.
>=20
> >  That goes for OSes too, but upgrading an OS
> > isn't as risky as upgrading firmware.  That isn't to say that it can'=
t
> > be close, but every firmware feature that the OS depends on is a
> > feature that could force a risky firmware upgrade when the bug in it
> > is discovered.
>=20
> Indeed.  In fact, the general rule of thumb is really "put as much as
> possible into the most easily replaced layer of the stack".  This is,
> incidentally, why I've always been dubious about simple firmwares
> supplying a flattened device tree rather than including the device
> tree template in the kernel, cuboot style.

The biggest advantage, IMHO, for adding DT to ARM, is actually to=20
decouple the hardware config information and the kernel.  If in the end=20
the DT has to be shipped in the kernel then we're losing all this=20
advantage over the current state of things on ARM which still works=20
pretty well otherwise.

In the best case, the simple firmware simply has to retrieve the=20
flattened device tree from flash, and pass it to the kernel just like=20
some anonymous blob.  And the simple firmware only needs to provide a=20
way for that DT blob to be updatable, like through an upload of a=20
replacement blob that was prepared offline.  Just like a ramdisk image=20
or the like.

That doesn't need to be fancier than that, and the goal of having the DT=20
data tied to the hardware instead of the kernel is achieved.

> > I'm also convinced that the economics are all wrong for "getting it
> > right" when talking about firmware.  Manufactures don't care about
> > firmware; they care about selling boxes.  Customers don't care about
> > firmware, they care about the operating system (well, that's not true
> > either, they care about applications).  For manufactures, once it can
> > boot the real operating system, there is little to no incentive to
> > spend any more money on firmware when the money can be better spent o=
n
> > either the next product or the adding features to the operating syste=
m
> > of the existing product.  In fact, spending money on firmware is
> > actually *more risky* one a product ships, because if a firmware
> > upgrade goes bad, then that means product returned for repair at the
> > factory.
>=20
> A good analysis.  The other side of this, is that for an OS, if you
> rely on the firmware to do X, it will work when the firmware gets it
> right.  If you do X yourself, it will work whether or not the firmware
> gets it right.  This means that if there's even one firmware you have
> to deal with out there that gets X wrong, you have to do it yourself
> and then there is little to no incentive to rely on firmware even in
> the cases where it does get it right.  In fact there's a disincentive,
> because then you have two different code paths to test and maintain.

Amen.


Nicolas

--Boundary_(ID_2EWCd8jZTlRoOyyIIEN3DA)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--Boundary_(ID_2EWCd8jZTlRoOyyIIEN3DA)--
