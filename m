From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: support for Moschip MCS814x SoCs
Date: Mon, 16 Jul 2012 13:57:27 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1207161354500.14068@xanadu.home>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <1342363754-30808-2-git-send-email-florian@openwrt.org>
 <20120716142941.666d928c@skate> <7233708.5ojzueYxjb@flexo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_UyBeAzN+RP8tUhdQEogUGw)"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <7233708.5ojzueYxjb@flexo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_UyBeAzN+RP8tUhdQEogUGw)
Content-type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Jul 2012, Florian Fainelli wrote:

> Hi Thomas,
>=20
> On Monday 16 July 2012 14:29:41 Thomas Petazzoni wrote:
> > Hello Florian,
> >=20
> > Le Sun, 15 Jul 2012 16:49:07 +0200,
> > Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> a =C3=A9crit :
> >=20
> > > diff --git a/arch/arm/mach-mcs814x/Makefile.boot b/arch/arm/mach-
> mcs814x/Makefile.boot
> > > new file mode 100644
> > > index 0000000..414db8b
> > > --- /dev/null
> > > +++ b/arch/arm/mach-mcs814x/Makefile.boot
> > > @@ -0,0 +1,3 @@
> > > +    zreladdr-y :=3D 0x00008000
> > > + params_phys-y :=3D 0x00000008
> > > + initrd_phys-y :=3D 0x00400000
> >=20
> > params_phys-y and initrd_phys-y are useless for DT-based platforms, i=
f
> > I'm correct.
>=20
> Indeed, only zreladdr is actually required.

If you use CONFIG_AUTO_ZRELADDR then even zreladdr-y isn't needed.


Nicolas

--Boundary_(ID_UyBeAzN+RP8tUhdQEogUGw)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--Boundary_(ID_UyBeAzN+RP8tUhdQEogUGw)--
