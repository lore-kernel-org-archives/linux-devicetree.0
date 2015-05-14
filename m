From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 19/21] drivers/of: Support adding sub-tree
Date: Thu, 14 May 2015 17:14:17 +1000
Message-ID: <1431587657.4160.37.camel@kernel.crashing.org>
References: <1430460188-31343-1-git-send-email-gwshan@linux.vnet.ibm.com>
	 <1430460188-31343-20-git-send-email-gwshan@linux.vnet.ibm.com>
	 <CAL_JsqKEUevxSe0Q=pGdsWOiT+TW9iAnCsAWuuqOYj3ZPOG7dg@mail.gmail.com>
	 <1430493730.7979.58.camel@kernel.crashing.org>
	 <CAL_JsqLrBSB4y_0j+i=kXbDA08HO23JuYjJGHR9nhsPnMC_Zyg@mail.gmail.com>
	 <1430521038.7979.70.camel@kernel.crashing.org>
	 <A6DF99C6-7059-4670-86D0-6926861F0164@antoniou-consulting.com>
	 <1430774063.7979.139.camel@kernel.crashing.org>
	 <1431560124.20218.91.camel@kernel.crashing.org>
	 <CAL_JsqKqTa5eg3eOqx3bkeNdO_920WwDiRbQaxwWLEWpCypFmA@mail.gmail.com>
	 <1431564871.4160.8.camel@kernel.crashing.org>
	 <53EAE361-0015-4702-97C6-9F67B87963C2@antoniou-consulting.com>
	 <1431585994.4160.32.camel@kernel.crashing.org>
	 <3988EABE-3DE9-4E1C-9778-22E35138E359@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3988EABE-3DE9-4E1C-9778-22E35138E359-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-05-14 at 10:04 +0300, Pantelis Antoniou wrote:

> Hmm, since you just want to transmit a whole subtree things are a bit
> simpler.
>=20
> You don=E2=80=99t need any of the fixups, and your target node is kno=
wn.
>=20
> So your overlay is simply:
>=20
> / {
> 	fragment@0 {
> 		target-path =3D =E2=80=9C/foo=E2=80=9D;
> 		__overlay__ {
> 			/* contents of the slot */
> 		};
> 	};=20
> };
>
> I think it=E2=80=99s possible to just bit-mangle a blob (in pseudo co=
de).
>=20
> 	const u8 template_overlay_blob[] =3D { <compiled blob of the above> =
};
>=20
> 	flatten_slot(slot_blob);
>=20
> 	overlay_blob =3D allocate_new_blob(template_overlay_blob, slot_blob)=
;
>=20
> 	overlay_node =3D find_node(overlay_blob, =E2=80=9C/fragment@0/__over=
lay__);
> 	target_prop =3D find_prop(overlay_blob, =E2=80=9C/fragment@0/target-=
path=E2=80=9D);
>=20
> 	inject_slot_blob(overlay_blob, overlay_node, slot_blob);
> 	modify_slot_target(overlay_blob, target_prop, slot_target);
> =09
> I don=E2=80=99t think you need to re-flatten anything, shuffling bits=
 around with
> memmove should work.

=46airly gross :-)

But yeah generating the overlay doesn't necessarily scare me, I can
generate a temp tree that is the overlay in which I "copy" the subtree
(or in my internal ptr-based representation I could have a concept of
alias which I follow while flattening).

That leaves me with these problems:

 - No support for removing of nodes, so that needs to be added back to
the format and to Linux unless I continue removing by hand in the PCI
hotplug code itself

 - No support for "committing" the overlay which needs to be added as
well.

> >>> Now we could consider that subtree as a changeset that can be und=
one,
> >>> but that wouldn't work for boot time. And subsequent updates woul=
dn't
> >>> have that concept of "undoing" anyway.
> >>>=20
> >>=20
> >> I have posted another patch that does boot-time DT quirk which are
> >> non-revertable.
> >>=20
> >> https://lkml.org/lkml/2015/2/18/258
> >=20
> > Not sure how that applies in my case ... I can't change the
> > representation of the PCI subtree, this is standard OFW representat=
ion,
> > I can't change the FW to make it an overlay-like thing at boot time=
,
> > that would break existing kernels.
> >=20
>=20
> The idea is to append the =E2=80=98quirk=E2=80=99 to the already boot=
ing device tree blob.

I know but that's not how things work for me. At boot time the FW passe=
s
me one tree that contains all the PCI stuff it has probed.

> Another idea floating around was to simple concatenate the booting bl=
ob with
> any overlay blobs you want applied at boot time.

Sure but I don't get overlay blobs at boot time.

> >>> IE. conceptually, what overlays do today is quite rooted around t=
he idea
> >>> of having a fixed "base" DT and some pre-compiled DTB overlays th=
at
> >>> get added/removed. The design completely ignore the idea of a FW =
that
> >>> maintains a "live" tree which we want to keep in sync, which is w=
hat we
> >>> want to do here, or what we could do with a "live" open firmware
> >>> implementation.
> >>>=20
> >>> Now we might be able to reconcile them, but it feels to me that t=
he
> >>> overlay/changeset stuff is too rooted in the first concept=E2=80=A6
> >>>=20
> >>=20
> >> The first DT overlays use case (beaglebone capes) is what got the =
concept
> >> started.
> >>=20
> >> Right now is a generic mechanism to apply modifications to the ker=
nel
> >> live tree, with the possibility to revert them.
> >=20
> > Yes but as I said it's not really thought in term of keeping the ke=
rnel
> > tree in sync with an external dynamically generated tree. Maybe we =
can
> > fix it, but it's more complex=E2=80=A6
> >=20
>=20
> Yes it is, unfortunately.

Right. Which makes the solution of just passing my bit of tree as a blo=
b
which I expand in Linux where I want it rather than an overlay tempting
if we can make Gavin patch more palatable (removing the hybrid stuff
etc...).

Cheers,
Ben.

> > Ben.
> >=20
> >>> Ben.
> >>>=20
> >>>=20
> >>=20
> >> Regards
> >>=20
> >> =E2=80=94 Pantelis
> >=20
> >=20
>=20
> Regards
>=20
> =E2=80=94 Pantelis


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
