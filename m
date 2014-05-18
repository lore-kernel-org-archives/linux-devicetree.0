From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] irqchip: armada-370-xp: Move the devicetree binding
 documentation
Date: Sun, 18 May 2014 20:51:48 -0300
Message-ID: <20140518235148.GB630@arch.cereza>
References: <1399904860-937-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140512163642.0cac3359@free-electrons.com>
 <20140512144838.GA2689@arch.cereza>
 <20140518233757.GA630@arch.cereza>
 <20140518234034.GA27822@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140518234034.GA27822-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18 May 07:40 PM, Jason Cooper wrote:
> On Sun, May 18, 2014 at 08:37:58PM -0300, Ezequiel Garcia wrote:
> > On 12 May 11:48 AM, Ezequiel Garcia wrote:
> > > On 12 May 04:36 PM, Thomas Petazzoni wrote:
> > > > On Mon, 12 May 2014 11:27:40 -0300, Ezequiel Garcia wrote:
> > > > > Move the devicetree binding documentation to the interrupt-co=
ntroller
> > > > > directory, where it belongs.
> > > > >=20
> > > > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electron=
s.com>
> > > > > ---
> > > > >  .../devicetree/bindings/arm/armada-370-xp-mpic.txt | 38 ----=
------------------
> > > > >  .../marvell,armada-370-xp-mpic.txt                 | 38 ++++=
++++++++++++++++++
> > > > >  2 files changed, 38 insertions(+), 38 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/arm/arm=
ada-370-xp-mpic.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/interru=
pt-controller/marvell,armada-370-xp-mpic.txt
> > > >=20
> > > > Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.=
com>
> > >=20
> > > Thanks for reviewing!
> > >=20
> > > Ouch, before anyone complains, I've just realised I forgot to cre=
ate the patch
> > > with the rename detection flag :-(
> >=20
> > Jason,
> >=20
> > Would you take this?
>=20
> Sure, my quick read of the above self-reply led me to believe there w=
as
> another version coming...
>=20

Actually, there was... and then thought maybe you didn't need it.

Want me send it? I can do that real quick.
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
