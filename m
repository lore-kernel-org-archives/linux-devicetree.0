From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 27 Mar 2012 12:05:19 +0300
Message-ID: <20120327090518.GL7379@arwen.pp.htv.fi>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203211009.40934.arnd@arndb.de>
 <20120321114546.GC3092@arwen.pp.htv.fi>
 <201203211317.38339.arnd@arndb.de>
 <20120321132230.GL3092@arwen.pp.htv.fi>
 <A2CA0424C0A6F04399FB9E1CD98E0304090B77CA@US01WEMBX2.internal.synopsys.com>
 <20120322081315.GG31160@arwen.pp.htv.fi>
 <A2CA0424C0A6F04399FB9E1CD98E0304090B7F02@US01WEMBX2.internal.synopsys.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CgTrtGVSVGoxAIFj"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E0304090B7F02-Yu2iAY70zvrYN67daEjeMPufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--CgTrtGVSVGoxAIFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 22, 2012 at 06:28:26PM +0000, Paul Zimmerman wrote:
> > > > context, toggle clocks, set pads in safe mode (when needed) and so =
on.
> > > >
> > > > But fair enough, both ways would work fine.
> > >
> > > I would also recommend your/Alan's approach to this over Felipe's way.
> > > We have a DWC3 platform with an (admittedly oddball) PM implementation
> > > that requires the bus driver to have some knowledge of the base drive=
r's
> > > internal state, and needs the two drivers to be able to communicate w=
ith
> > > each other. With the base driver being a separate platform device, th=
is
> > > is nearly impossible to achieve in a clean way. If the DWC3 driver was
> > > designed the way you and Alan are recommending, it would be easy.
> > >
> > > I'm trying to convince Felipe to change the DWC3 driver design to
> > > accommodate this, but I hold out little hope for that :)
> >=20
> > yeah, I'm not thinking on taking that patch, sorry. Didn't you say SNPS
> > had agreed on rebuilding the FPGA system so that it's a more standard
> > PCIe implementation ?
> >=20
> > I still owe you another possible implementation for the whole PM thing,
> > sorry about the delay.
>=20
> Dropped the other folks from CC since they probably aren't interested.
>=20
> The FPGA rework is very low priority, those guys have more important
> stuff to work on at the moment. Plus management doesn't understand
> why the current design won't work, since the Synopsys driver supports
> it OK.
>=20
> So I'm not sure when the FPGA rework will happen.

Ok, so let's work with what we have now. I'll try to shuffle your
patches around to the way I think they could/should be done, but I'll
need your help testing since I don't have any hibernation-enabled
version of the IP at hand. Hope it's ok with you ;-)

--=20
balbi

--CgTrtGVSVGoxAIFj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPcYLOAAoJEIaOsuA1yqRE0skP/i1GCQBMqI6MPFE0ZdhASdXo
zoFFz9HgTcdv8WXpgl8U43uyki7ePbf91+inTN/EKmsSBJrbUE4cOBm3fMo5pgOC
04oY0ZHM7U9Na/0Rfr+fVFtNrb1SanmPK5ydLJZZm/mOp9IH13H/z+sKTHc9JwTT
f/eWfA9G0vWPJEgOFUH94+2vtwuOIcXoFY3KFj5VqMeXPfCbmE7zwjxjEblffhM9
BF4VprNmQNDfR2n0nsh5Bj7mVUQo/B6MmnOX0ngC1HZcF/7j5IV0eaWwcVhKPwy/
1NQ9NV/4VRjssGtqaAtUnfRmNFv6xnuFv9n9SAL0IhCK2+8KbUTDbtqh6SRcZ72p
Vm++yLZEQCOF4k40jZ5IjXnJ3H00rQTpDqygJEEeb9ygZ7gOQBSZyKl+FBVfafi4
hjmaOOI2boSldpEZrkLrXPyo76gIufWQa/JP0ejsBwC9N4YvbCh1GaLvru4Mtoz0
N4YdhtzFxBXaSV4D6SX/cfTAsStFFuMdsjadHU/PtK7q7SY0vS+2KPpoNLPTgFd2
d9jaUE7KIh04S0oJMsbakwI/Az2/TQD+zQIZHkmzX8rj8J+Gr/EuXhrQHmAyc4bK
hSb9W7MFysroS8cJr8PeCmufMTP2uc2Ma6MsDsMXWo7s2LrcXMjqT/H8vijV79JQ
lEMhnF6NhcsMJ0JrzsI+
=HtC3
-----END PGP SIGNATURE-----

--CgTrtGVSVGoxAIFj--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
