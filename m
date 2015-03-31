From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 31 Mar 2015 10:02:29 -0700
Message-ID: <20150331170229.58DCEC40856@trevor.secretlab.ca>
References: <1421859974-24507-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1421861843.10574.23.camel@perches.com>
	<7EBFDD59-156A-42FB-AAF0-CE4A88219794@antoniou-consulting.com>
	<20150330190432.42192C40A67@trevor.secretlab.ca>
	<8421E7C5-C0D9-4C86-AA37-F6507B3BCC57@konsulko.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8421E7C5-C0D9-4C86-AA37-F6507B3BCC57@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robherring2@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

Thanks for the quick reply. Comments below...

On Tue, 31 Mar 2015 13:03:05 +0300
, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
 wrote:
> Hi Grant,
>=20
> > On Mar 30, 2015, at 22:04 , Grant Likely <grant.likely@secretlab.ca=
> wrote:
> >=20
> > On Thu, 22 Jan 2015 22:31:46 +0200
> > , Pantelis Antoniou <panto@antoniou-consulting.com>
> > wrote:
> >> Hi Joe,
> >>=20
> >>> On Jan 21, 2015, at 19:37 , Joe Perches <joe@perches.com> wrote:
> >>>=20
> >>> On Wed, 2015-01-21 at 19:06 +0200, Pantelis Antoniou wrote:
> >>>> 90% of the usage of device node's full_name is printing it out
> >>>> in a kernel message. Preparing for the eventual delayed allocati=
on
> >>>> introduce a custom printk format specifier that is both more
> >>>> compact and more pleasant to the eye.
> >>>>=20
> >>>> For instance typical use is:
> >>>> 	pr_info("Frobbing node %s\n", node->full_name);
> >>>>=20
> >>>> Which can be written now as:
> >>>> 	pr_info("Frobbing node %pO\n", node);
> >>=20
> >>> Still disliking use of %p0.
> >>>=20
> >>=20
> >> pO - Open Firmware
> >>=20
> >> pT for tree is bad, cause we plan to use a tree type in the future=
 in OF.
> >=20
> > So, here's a radical thought. How about we reserve '%pO' for object=
s, as
> > in kobjects.  We'll use extra flags to narrow down specifically to
> > device tree nodes, but we could teach vsprintf() to treat a plain '=
%pO'
> > as plain kobject pointer, and if it is able to recognize the kobj_t=
ype,
> > then run a specific decoder to format it.
> >=20
> > This also gives us a namespace for various kinds of firmware data
> > output. %Od could be a struct device, %On for device tree node, %Oa=
 for
> > an ACPI node, etc.
> >=20
>=20
> I=E2=80=99m fine with this. I also have a patch to turn an overlay to=
 a kobj
> so this fits naturally.
>=20
> OTOH if we do this, I would expect to rework the custom printk infras=
tructure
> to be more generic.
>=20
> IMHO having the format specifier and the format print methods in lib/=
vsprintf.c
> is not very nice.
>=20
> How about having a way to register object printk handlers with someth=
ing like that?
> We could put that in a special linker section and have the printk met=
hod pass control
> there.
>=20
> PRINTK_OBJFMT(=E2=80=99n=E2=80=99, printk_objfmt_device_node);
>=20
> We might have to make a few printk methods public however.

Honestly, I think trying to add registration is an overengineered
solution at this point. We're not hitting a wall on the complexity of
vsprintf.c, and having them all in one place helps to ensure we don't
have conflicts.

>=20
> > I've dropped the refcount decoder. I know it is useful for debuggin=
g the
> > core DT code, but it isn't something that will be used generally. P=
lus
> > the returned value cannot be relied upon to be stable because there=
 may
> > be other code currently iterating over the tree.
> >=20
>=20
> Yeah, I know it=E2=80=99s not something to rely on. If we do %pOk to =
be kobj
> debug I can add it back in.

Yes, that would be a good place to have refcount output.

> > +Device tree nodes:
> > +
> > +	%pOn[fnpPcCFr]
> > +
> > +	For printing device tree nodes. The optional arguments are:
> > +	    f device node full_name
> > +	    n device node name
> > +	    p device node phandle
> > +	    P device node path spec (name + @unit)
> > +	    F device node flags
> > +	    c major compatible string
> > +	    C full compatible string
> > +	Without any arguments prints full_name (same as %pOnf)
> > +	The separator when using multiple arguments is =E2=80=98:=E2=80=99
> ^ separator is =E2=80=98.'

? I'm confused? The separator that I'm using is a colon. ':'  Where do
you see ','? I don't think ',' would be a good separator because it
appears in node names and compatible strings. Originally, I think you
were using pipe '|', but my personal opinion is that ':' is better
because there is already precidence as a separator.

g.
