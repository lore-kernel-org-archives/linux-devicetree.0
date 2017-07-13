Return-Path: <philip.j.elwell@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5967CAA6.6010801@gmail.com>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box> <5967CAA6.6010801@gmail.com>
From: Phil Elwell <philip.j.elwell@gmail.com>
Date: Thu, 13 Jul 2017 20:38:10 +0100
Message-ID: <CAPhXvM4NzU61dENLeJ2Xt=arKqYFjXaPBvzrjxAJ7h3Y-gT4Nw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Content-Type: multipart/alternative; boundary="001a113e228a9dacc805543812ef"
To: Frank Rowand <frowand.list@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robherring2@gmail.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, devicetree@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Tero Kristo <t-kristo@ti.com>, Simon Glass <sjg@chromium.org>
List-ID: <devicetree@vger.kernel.org>

--001a113e228a9dacc805543812ef
Content-Type: text/plain; charset="UTF-8"

Can we also consider a mechanism for overlay-local symbols, i.e. symbols
that are used purely to create links within an overlay - perhaps using a
particular naming convention? This would make it easier to instantiate an
overlay multiple times without having to uniquify all symbols, and it would
avoid polluting the global namespace without reason.

Phil

On 13 Jul 2017 8:32 pm, "Frank Rowand" <frowand.list@gmail.com> wrote:

> On 07/03/17 02:06, David Gibson wrote:
> > On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
> >> This patch enables an overlay to refer to a previous overlay's
> >> labels by performing a merge of symbol information at application
> >> time.
> >
> > This seems to be doing things the hard way.
> >
> > You're essentially extending the semantics of overlay application to
> > add the symbol merging.  You've implemented these extended semantics
> > in libfdt, which is all very well, but that's not the only overlay
> > application implementation.
> >
> >
> > It seems to me a better approach would be to change dtc's -@
> > implementation, so that in /plugin/ mode instead of making a global
> > __symbols__ node, it puts it into the individual fragments.  That way
> > the existing overlay application semantics will update the __symbols__
> > node.
>
> If the __symbols__ node was inside a fragment, then the existing
> code would add (or update) a __symbols__ node located at the location
> pointed to by the fragment's target path, instead of updating the
> node /__symbols__.
>
> It makes sense to me to have only one global __symbols__ node instead
> of several.
>
> If there is a global __symbols__ node then we have a single name
> space for symbols.
>
> If there are multiple __symbols__ nodes spread throughout the tree,
> then to me that would imply different name spaces spread throughout
> the tree, where namespaces are determined by fragments.  This sounds
> confusing to me.  Or if the intent is to have a single name space
> then the __symbols__ information would be scattered throughout the
> tree instead of located in a single node.
>
> My current patch (under review), targeted for Linux 4.13-rc1, puts
> an overlay's __symbols__ node properties into the overlay's
> changeset, so they get added when the overlay is loaded and
> removed when the overlay is unloaded.
>
> -Frank
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> devicetree-compiler" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a113e228a9dacc805543812ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can we also consider a mechanism for overlay-local symbol=
s, i.e. symbols that are used purely to create links within an overlay - pe=
rhaps using a particular naming convention? This would make it easier to in=
stantiate an overlay multiple times without having to uniquify all symbols,=
 and it would avoid polluting the global namespace without reason.<div dir=
=3D"auto"><br></div><div dir=3D"auto">Phil</div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On 13 Jul 2017 8:32 pm, &quot;Frank Ro=
wand&quot; &lt;<a href=3D"mailto:frowand.list@gmail.com">frowand.list@gmail=
.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On 07/03/17 02:06, David Gibson wrote:<br>
&gt; On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:<br>
&gt;&gt; This patch enables an overlay to refer to a previous overlay&#39;s=
<br>
&gt;&gt; labels by performing a merge of symbol information at application<=
br>
&gt;&gt; time.<br>
&gt;<br>
&gt; This seems to be doing things the hard way.<br>
&gt;<br>
&gt; You&#39;re essentially extending the semantics of overlay application =
to<br>
&gt; add the symbol merging.=C2=A0 You&#39;ve implemented these extended se=
mantics<br>
&gt; in libfdt, which is all very well, but that&#39;s not the only overlay=
<br>
&gt; application implementation.<br>
&gt;<br>
&gt;<br>
&gt; It seems to me a better approach would be to change dtc&#39;s -@<br>
&gt; implementation, so that in /plugin/ mode instead of making a global<br=
>
&gt; __symbols__ node, it puts it into the individual fragments.=C2=A0 That=
 way<br>
&gt; the existing overlay application semantics will update the __symbols__=
<br>
&gt; node.<br>
<br>
If the __symbols__ node was inside a fragment, then the existing<br>
code would add (or update) a __symbols__ node located at the location<br>
pointed to by the fragment&#39;s target path, instead of updating the<br>
node /__symbols__.<br>
<br>
It makes sense to me to have only one global __symbols__ node instead<br>
of several.<br>
<br>
If there is a global __symbols__ node then we have a single name<br>
space for symbols.<br>
<br>
If there are multiple __symbols__ nodes spread throughout the tree,<br>
then to me that would imply different name spaces spread throughout<br>
the tree, where namespaces are determined by fragments.=C2=A0 This sounds<b=
r>
confusing to me.=C2=A0 Or if the intent is to have a single name space<br>
then the __symbols__ information would be scattered throughout the<br>
tree instead of located in a single node.<br>
<br>
My current patch (under review), targeted for Linux 4.13-rc1, puts<br>
an overlay&#39;s __symbols__ node properties into the overlay&#39;s<br>
changeset, so they get added when the overlay is loaded and<br>
removed when the overlay is unloaded.<br>
<br>
-Frank<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe devicetree-c=
ompiler&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/<wbr>m=
ajordomo-info.html</a><br>
</blockquote></div></div>

--001a113e228a9dacc805543812ef--
