From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH v4 19/21] drivers/of: Support adding sub-tree
Date: Mon, 4 May 2015 19:41:59 +0300
Message-ID: <A6DF99C6-7059-4670-86D0-6926861F0164@antoniou-consulting.com>
References: <1430460188-31343-1-git-send-email-gwshan@linux.vnet.ibm.com> <1430460188-31343-20-git-send-email-gwshan@linux.vnet.ibm.com> <CAL_JsqKEUevxSe0Q=pGdsWOiT+TW9iAnCsAWuuqOYj3ZPOG7dg@mail.gmail.com> <1430493730.7979.58.camel@kernel.crashing.org> <CAL_JsqLrBSB4y_0j+i=kXbDA08HO23JuYjJGHR9nhsPnMC_Zyg@mail.gmail.com> <1430521038.7979.70.camel@kernel.crashing.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430521038.7979.70.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ben,

> On May 2, 2015, at 01:57 , Benjamin Herrenschmidt <benh-XVmvHMARGAQRh2imMr4xaA@public.gmane.org=
ng.org> wrote:
>=20
> On Fri, 2015-05-01 at 13:46 -0500, Rob Herring wrote:
>> On Fri, May 1, 2015 at 10:22 AM, Benjamin Herrenschmidt
>> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>>> On Fri, 2015-05-01 at 07:54 -0500, Rob Herring wrote:
>>>=20
>>>> The difference seems to be whether you allocate space or just poin=
t to
>>>> the FDT for various strings/data. Is that right?
>>>>=20
>>>>>   * of_fdt_add_subtree() is the introduced API to do the work.
>>>>=20
>>>> Have you looked at overlays and if so why do they not work for you=
r purposes?
>>>>=20
>>>> Why do you need to do this with the flattened tree?
>>>=20
>>> The basic idea I asked Gavin to implement is that since the FW need=
s to
>>> provide a bunch of DT updates to Linux at runtime in the form of ne=
w
>>> nodes below an existing one, rather than doing it via some new/cust=
om
>>> format, instead, have it send a bit of FDT blob to expand under an
>>> existing node.
>>=20
>> Overlay =3D an FDT blob to graft into a live running system. Sounds =
like
>> the same thing.
>>=20
>>> As for the details of Gavin implementation, I haven't looked at it =
in
>>> details yet so there might be issues there, however I don't know wh=
at
>>> you mean by "overlays", any pointer ?
>>=20
>> CONFIG_OF_OVERLAY
>>=20
>> http://events.linuxfoundation.org/sites/events/files/slides/dynamic-=
dt-keynote-v3.pdf
>=20
> Well, that looks horrendously complicated, poorly documented and tota=
lly
> unused in-tree outside of the unittest stuff, yay ! It has all sort o=
f
> "features" that I don't really care about.
>=20

If it was easy to get stuff in, it would get more of the real-use drive=
rs
in.

> I still don't see what it buys me other than making my FW a lot more
> complex having to generate all that additional fixup etc... crap that=
 I
> don't totally get yet.
>=20

You don=E2=80=99t generate any additional fixups. You just compile with=
 the option
that generates all the fixups for you.

> What's wrong with just unflattening the nodes in place ? The DT comes
> from the FW in the first place so all the phandles are already good i=
n
> the new added blob. Internally, the FW created new nodes in its inter=
nal
> representation and flattened the subtree and sends that subtree to
> Linux.
>=20
> I don't plan to play "revert" either, if you unplug, I do need to rem=
ove
> what's under the slot but that's true of boot time devices, not just
> "new" ones, so the overlay stuff won't do the trick and I certainly
> don't want to keep track=E2=80=A6
>=20

You get all of the corner cases handled for free. Perhaps it works for =
your
case too.

Perhaps you can educate me on what you need supported and we can make s=
ure
it=E2=80=99s included.

> Ben.
>=20
>=20

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
