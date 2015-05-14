From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 19/21] drivers/of: Support adding sub-tree
Date: Thu, 14 May 2015 17:47:32 +1000
Message-ID: <1431589652.4160.49.camel@kernel.crashing.org>
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
	 <1431588358.4160.42.camel@kernel.crashing.org>
	 <D7FC0542-DD1A-428F-8E75-81620C6D83DC@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D7FC0542-DD1A-428F-8E75-81620C6D83DC-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-05-14 at 10:34 +0300, Pantelis Antoniou wrote:

> >> What you describe is inserting a bunch of properties and nodes und=
er
> >> a slot=E2=80=99s device node. Reverting the overlay removes them a=
ll just fine.
> >=20
> > Except that still doesn't work for boot time :-)
> >=20
> > So I would have to do a special case on unplug:
> >=20
> > 	if (slot->dt_is_overlay) /* set to false at boot */
> > 		remove_subtree_myself();
> > 	else
> > 		undo_overlay(slot->overlay);
> >=20
>=20
> OK, in that case you do require removal. But in any case it=E2=80=99s=
 the =E2=80=98negative=E2=80=99
> of an already applied one, either at boot time or not.

Sort-of, unless we have a way in the overlay to simply specify node
removal statements so we don't have to explicitly remove all properties
(or even all children).

> Modifying the overlay code to apply a =E2=80=98negative=E2=80=99 prop=
erty should do the trick.
>=20
> Is that correct?

I would do negatives node and let Linux imply the properties (or even
children).

But yes, that would probably do.

 .../...

> I will probably need that generation count myself for my PCI use case=
=2E
>=20
> > However that requires supporting removal of nodes/properties. So I'=
m
> > tempted to keep that feature on the back burner and go with an ad-h=
oc
> > interface for PCI for now.
> >=20
>=20
> I see. Bonne chance :)

Merci :)

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
