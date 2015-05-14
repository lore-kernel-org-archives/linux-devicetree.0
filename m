From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 19/21] drivers/of: Support adding sub-tree
Date: Thu, 14 May 2015 17:25:58 +1000
Message-ID: <1431588358.4160.42.camel@kernel.crashing.org>
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
	 <1431587657.4160.37.camel@kernel.crashing.org>
	 <75F026CA-5AC1-4106-B2F0-AB0D006DEF5A@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <75F026CA-5AC1-4106-B2F0-AB0D006DEF5A-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-05-14 at 10:19 +0300, Pantelis Antoniou wrote:

>=20
> You don=E2=80=99t want to know how sausages are made, but they are de=
licious :)

 ... most of the time :)

> > But yeah generating the overlay doesn't necessarily scare me, I can
> > generate a temp tree that is the overlay in which I "copy" the subt=
ree
> > (or in my internal ptr-based representation I could have a concept =
of
> > alias which I follow while flattening).
> >=20
> > That leaves me with these problems:
> >=20
> > - No support for removing of nodes, so that needs to be added back =
to
> > the format and to Linux unless I continue removing by hand in the P=
CI
> > hotplug code itself
> >=20
>=20
> What kind of nodes/properties you need to remove at _application_ tim=
e?

Well, if we stick to removing by hand in Linux for the unplug case, the=
n
none.

> What you describe is inserting a bunch of properties and nodes under
> a slot=E2=80=99s device node. Reverting the overlay removes them all =
just fine.

Except that still doesn't work for boot time :-)

So I would have to do a special case on unplug:

	if (slot->dt_is_overlay) /* set to false at boot */
		remove_subtree_myself();
	else
		undo_overlay(slot->overlay);

> > - No support for "committing" the overlay which needs to be added a=
s
> > well.
> >=20
>=20
> That=E2=80=99s the easiest part.

Yeah, I will need to get my head around the code a bit more but it
doesn't seem too scary.

> I see. Well, how about this?
>=20
> Who said you have to do the whole blob dance in the firmware?
>=20
> You can just as easily pass the blob as it is to the linux kernel and
> the kernel there can convert it to an overlay and apply it.

That's not that pretty but we can do that too which solve the problem o=
f
fixing the FW interface.

There is however an argument to be made in having the FW be able to
generate arbitrary overlays. If we ever want to pass more "property"
updates or node updates to Linux at runtime.

A few cases have crept up on the radar, like updating the pstate tables
or VPD informations ...

If we go down that path, then I would implement a concept of generation
count in the firmware, so I can generate an overlay that include all th=
e
changes since the last "generation" given to Linux.

However that requires supporting removal of nodes/properties. So I'm
tempted to keep that feature on the back burner and go with an ad-hoc
interface for PCI for now.

Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
