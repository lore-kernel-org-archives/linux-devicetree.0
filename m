From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH] of/pdt: allow DT device matching by fixing 'name'
 brokenness
Date: Wed, 23 Feb 2011 11:54:14 -0800
Message-ID: <20110223115414.547b8c17@queued.net>
References: <20110216222820.487AE9D401C@zog.reactivated.net>
	<1297896277.3011.5.camel@macbook.infradead.org>
	<AANLkTikAF2X1A5jfoNfCPRhZkZ7qPdZ57c8B5b9z4+qr@mail.gmail.com>
	<20110218190659.7f955e4c@queued.net>
	<20110223194352.GR14597@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20110223194352.GR14597@angua.secretlab.ca>
Sender: sparclinux-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Daniel Drake <dsd@laptop.org>, David Woodhouse <dwmw2@infradead.org>, cbou@mail.ru, linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, dmitry.torokhov@gmail.com, devicetree-discuss@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 23 Feb 2011 12:43:52 -0700
Grant Likely <grant.likely@secretlab.ca> wrote:

> On Fri, Feb 18, 2011 at 07:06:59PM -0800, Andres Salomon wrote:
> > On Fri, 18 Feb 2011 23:42:57 +0000
> > Daniel Drake <dsd@laptop.org> wrote:
> >=20
> > > On 16 February 2011 22:44, David Woodhouse <dwmw2@infradead.org>
> > > wrote:
> > > > On Wed, 2011-02-16 at 22:28 +0000, Daniel Drake wrote:
> > > >>
> > > >> +static int __init add_common_platform_devices(void)
> > > >> +{
> > > >> + =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev;
> > > >> +
> > > >> + =C2=A0 =C2=A0 =C2=A0 pdev =3D platform_device_register_simpl=
e("olpc-battery",
> > > >> -1, NULL, 0);
> > > >> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(pdev))
> > > >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_=
ERR(pdev);
> > > >> +
> > > >> + =C2=A0 =C2=A0 =C2=A0 return 0;
> > > >> +}
> > > >> +
> > > >
> > > > Still kind of sucks that you have to do this, and can't bind to
> > > > something in the device-tree.
> > >=20
> > > OK, feel free to put this patch on hold for now. I started
> > > looking at the device tree approach today. It looks doable but
> > > first we have to fix a DT bug/inconsistency that is preventing us
> > > from correctly binding to the tree's devices.
> > >=20
> > > Daniel
> >=20
> >=20
> > Mea culpa.  The patch below fixes a bug I introduced earlier.
> > Cc'ing the sparc folks, as this probably affects them
> > (although I would think that it fixes broken behavior for them..?)
>=20
> Wait; why are you binding to a device based on name?  Binding by name
> and/or device_type is strongly discouraged for new code.  Use
> compatible instead.
>=20

Daniel posted a separate patch showing his code, would you mind
commenting on that?  I noticed he didn't cc you though, here's the
patch:

https://patchwork.kernel.org/patch/574901/


> As for this patch, comments below...
>=20
> > From: Andres Salomon <dilinger@queued.net>
> >=20
> > Commit e2f2a93b changed dp->name from using the 'name' property to
> > using package-to-path.  This fixed /proc/device-tree creation by
> > eliminating conflicts between names (the 'name' property provides
> > names like 'battery', whereas package-to-path provides names like
> > '/foo/bar/battery@0', which we stripped to 'battery@0').  However,
> > it also breaks of_device_id table matching.
> >=20
> > The fix that we _really_ wanted was to keep dp->name based upon
> > the name property ('battery'), but based dp->full_name upon
> > package-to-path ('battery@0').  This patch does just that.
> >=20
> > Signed-off-by: Andres Salomon <dilinger@queued.net>
> > Reported-by: Daniel Drake <dsd@laptop.org>
>=20
> From what I can tell, this only affects OLPC, correct?  It looks like
> SPARC's implementation of of_pdt_node_name() will sidestep most of
> this name retrieval code.
>=20


This affects sparc as well; it changes behavior back for dp->name to
what it used to be.  dp->full_name behavior is still the same for sparc=
=2E


> > ---
> >  drivers/of/pdt.c |   42 +++++++++++++++++++-----------------------
> >  1 files changed, 19 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
> > index 28295d0..b39d584 100644
> > --- a/drivers/of/pdt.c
> > +++ b/drivers/of/pdt.c
> > @@ -48,7 +48,7 @@ static inline void irq_trans_init(struct
> > device_node *dp) { }=20
> >  static inline const char *of_pdt_node_name(struct device_node *dp)
> >  {
> > -	return dp->name;
> > +	return NULL;
> >  }
>=20
> Rather than using this hook; perhaps the sparc .path_component_name
> should be enabled for all architectures.  It is a useful data item to
> keep a pointer to, and it would simplify the of_pdt code.
>=20
> > =20

Yeah, I considered that, but pkg2path works even better for our
purposes.


I'll combine patches and resend, thanks.
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
