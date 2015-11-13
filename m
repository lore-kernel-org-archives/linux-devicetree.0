From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v7 39/50] powerpc/powernv: Fundamental reset in
 pnv_pci_reset_secondary_bus()
Date: Fri, 13 Nov 2015 11:23:23 +1100
Message-ID: <1447374203.3081.12.camel@kernel.crashing.org>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
	 <1446642770-4681-40-git-send-email-gwshan@linux.vnet.ibm.com>
	 <87fv0azrpe.fsf@gamma.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fv0azrpe.fsf-lvn/ZZ/ogF85kJ7NmlRacFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Axtens <dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2015-11-13 at 11:08 +1100, Daniel Axtens wrote:
> Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> writes:
>=20
> > =C2=A0void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
> > =C2=A0{
> > -> > 	> > pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
> > +> > 	> > int option, freset =3D 0;
> > +
> > +> > 	> > if (dev->subordinate)
> > +> > 	> > 	> > pci_walk_bus(dev->subordinate,
> > +> > 	> > 	> > 	> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pnv_pci_dev_reset=
_type, &freset);
> > +
> > +> > 	> > option =3D freset ? EEH_RESET_FUNDAMENTAL : EEH_RESET_HOT=
;
> > +> > 	> > pnv_eeh_bridge_reset(dev, option);
>=20
> According to the skiboot sources, fundamental reset isn't supported o=
n
> p5ioc2. As far as I can tell from your corresponding skiboot patches,
> this is still the case after they are applied. Do we need a fallback =
to
> EEH_RESET_HOT in this case? Otherwise there will be no reset performe=
d
> at all.

We don't really care that much about what happens on p5ioc2 :-)

> Likewise, if the FUNDAMENTAL reset fails for any reason, should we fa=
ll
> back to a HOT reset?

Probably.

Cheers,
Ben.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
