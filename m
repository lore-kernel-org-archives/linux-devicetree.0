From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/1] of: introduce helper to manage boolean
Date: Wed, 11 Jul 2012 00:53:01 +0200
Message-ID: <CAPnjgZ1D0hCZobFENTPN8Vkz04x5bXa9RviJuVcgBt66BL961Q@mail.gmail.com>
References: <1328588028-24766-1-git-send-email-plagnioj@jcrosoft.com>
 <20120309014441.8236B3E0903@localhost>
 <20120309100435.GN27213@game.jcrosoft.org>
 <20120309162638.92E813E0880@localhost>
 <20120309163608.GQ27213@game.jcrosoft.org>
 <4F5E50DA.6080000@freescale.com>
 <20120313031739.GA18320@game.jcrosoft.org>
 <20120313041652.563B63E0536@localhost>
 <CAPnjgZ2dj5pcuGhM2_2nwwnhhcCmKhyi6jVHS7Xf1f682i_j_w@mail.gmail.com>
 <4FFC9D46.6090006@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2756609624036068631=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FFC9D46.6090006-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2756609624036068631==
Content-Type: multipart/alternative; boundary=14dae9399cefad1ecc04c4819798

--14dae9399cefad1ecc04c4819798
Content-Type: text/plain; charset=ISO-8859-1

Hi Scott,

On Tue, Jul 10, 2012 at 11:23 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>wrote:

> On 07/10/2012 07:10 AM, Simon Glass wrote:
> > Hi,
> >
> > On Tue, Mar 13, 2012 at 5:16 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> > <mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>> wrote:
> >
> >     On Tue, 13 Mar 2012 04:17:39 +0100, Jean-Christophe PLAGNIOL-VILLARD
> >     <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org <mailto:plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>> wrote:
> >     > On 14:39 Mon 12 Mar     , Scott Wood wrote:
> >     > > On 03/09/2012 10:36 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> >     > > >>>> Ugh.  so any value other than 1 returns false?  I think
> >     that will surprise
> >     > > >>>> most people.
> >     > > >>>>
> >     > > >>>> I don't like this api or binding.  If it is a bool
> >     property, then why isn't
> >     > > >>>> simply testing for the property existance sufficient?
> >     > > >>> no if you want to disable it
> >     > > >>>
> >     > > >>> if a bool is define in the dtsi and want to disable it int
> >     the dts
> >     > > >>>
> >     > > >>> if you we can do the the invert
> >     > > >>>
> >     > > >>> if !0 => true
> >     > > >>>
> >     > > >>> is-ok;                  => true
> >     > > >>> is-ok = <val != 0>;     => true
> >     > > >>> is-ok = <0>;            => false
> >     > > >>
> >     > > >> This is a failure of the dtc tool, not the binding.
> >      Accepting this binding
> >     > > >> means we have to live with it for a very long time.  It needs
> >     to be fixed
> >     > > >> in dtc instead so that properties can be deleted instead of
> >     only modified.
> >     > > > I understand your idea but today if you put and value in the
> >     property it's true.
> >     > > >
> >     > > > So is-ok = <0>; is true also which is illogical as in any
> >     language a boolean is
> >     > > > true (1) or false (0). When I read the property I will
> >     understand false not true
> >     > >
> >     > > You could say similar things about is-ok = "no" or is-ok = "" or
> >     is-ok =
> >     > > "I'd rather you didn't"... it's expected that violating the
> >     binding may
> >     > > produce illogical results.
> >     > today is most of the binding people use a number whe the want to
> >     be able to
> >     > delete it and it's the same in most of the promgramming language
> >
> >     It isn't yet a big pain point, so there isn't time pressure here.
> >      Fixing the tool
> >     is the better solution, and since the kernel carries a copy of the
> >     tool we don't
> >     need to worry about adding a feature that isn't available by the dtc
> >     packaged by
> >     a distribution.
> >
> >     Fixing the tool is the correct thing to do.
> >
> >
> > I just wanted to pick up on this thread. Now in the kernel, absence of a
> > property indicates false, and presence indicates true. This is a kernel
> > convention, nothing to do with the dtb format.
>
> It's an aspect of the device binding, and was used by Open Firmware
> bindings before Linux came up with flat device trees.
>

OK. When I asked about the boolean property on the devicetree-discuss I
understood that no one really cared, and it was a matter for Linux.


>
> Also note that even non-boolean properties can mean something different
> when absent.  Sometimes this is a default value; sometimes, like with
> "ranges", it's something that can't be expressed with any value (empty
> ranges means all translations go straight through; no ranges means no
> translation is possible).
>

That's fine, but I'm not sure I understand why that relates to boolean
properties, which currently mean always the same thing (false) when absent.
I don't think there is any intent to change that.


> > I think it is useful to
> > support a boolean with a non-null value which can be 0, meaning true as
> > Jean-Christophe says.
> >
> > My reasons are:
> >
> > 1. dtc does not have a way to delete a property and it isn't clear what
> > syntax could be used there.
>
> Surely some syntax can be created for this.  E.g. /delete-prop/ foo;
>

Yes, in fact I saw a patch after sending this email. So for normal values
to change the value we do

   prop = <23>;

but for booleans we must do EITHER:

   bool;

or

   /delete-prop/ bool;

depending on whether we want the make it true or false? Ick.


>
> > It also seems a little brittle to delete a
> > property in one place and define it in another (ordering? confusion when
> > people can't work out why it has gone?). So not only can dtc not do
> > this, but I'm not sure that it should.
>
> I don't see how it's worse than defining it one place and then
> redefining it elsewhere.
>

It seems worse to me, see above. Also if we end up with symbols it will be
impossible to do something like:

   bool-property = <WIBBLE_VALUE>;

You will have to do:

if WIBBLE_VALUE == 0
  /delete-prop/ bool-property;
#else
  bool-property;
#endif

or whatever, or maybe I got that around the wrong way.... Not nice IMO.

(any comments on point 2?)


>
> > 3. Discoverability: it is nice to be able to see the possible options,
> > even if disabled.
>
> This assumes the possible options were known in advance, or that you
> don't maintain compatibility with old device trees when a new option is
> added.
>

You can still add the option with a zero value - or maybe I misunderstand
what you mean.

>
> > In particular, if a boolean value is true, and you
> > later decide with fdtput to turn it off, you effectively remove all
> > trace of it. This could be confusing for those who are looking for
> > available options.
>
> There should still be a "trace of it" in the binding document.
>

Yes true, that's the saving grace.

I'm not even saying that we ever use

   bool-prop = <1>;

Clearly that is redundant. I'm just agreeing with Jean-Chrstophe that it
would be nice and clean to do something like:

   bool-prop = <0>;

and it will make it false.

Regards,
Simon


>
> -Scott
>
>

--14dae9399cefad1ecc04c4819798
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Scott,<br><br><div class=3D"gmail_quote">On Tue, Jul 10, 2012 at 11:23 P=
M, Scott Wood <span dir=3D"ltr">&lt;<a href=3D"mailto:scottwood@freescale.c=
om" target=3D"_blank">scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<div class=3D"im">On 07/10/2012 07:10 AM, Simon Glass wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Tue, Mar 13, 2012 at 5:16 AM, Grant Likely &lt;<a href=3D"mailto:gr=
ant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a><br>
</div><div class=3D"im">&gt; &lt;mailto:<a href=3D"mailto:grant.likely@secr=
etlab.ca">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 On Tue, 13 Mar 2012 04:17:39 +0100, Jean-Christophe PLAGNIOL-V=
ILLARD<br>
</div><div><div class=3D"h5">&gt; =A0 =A0 &lt;<a href=3D"mailto:plagnioj@jc=
rosoft.com">plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org</a> &lt;mailto:<a href=3D"mailto:plagnioj=
@jcrosoft.com">plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org</a>&gt;&gt; wrote:<br>
&gt; =A0 =A0 &gt; On 14:39 Mon 12 Mar =A0 =A0 , Scott Wood wrote:<br>
&gt; =A0 =A0 &gt; &gt; On 03/09/2012 10:36 AM, Jean-Christophe PLAGNIOL-VIL=
LARD wrote:<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;&gt; Ugh. =A0so any value other than 1 r=
eturns false? =A0I think<br>
&gt; =A0 =A0 that will surprise<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;&gt; most people.<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;&gt; I don&#39;t like this api or bindin=
g. =A0If it is a bool<br>
&gt; =A0 =A0 property, then why isn&#39;t<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;&gt; simply testing for the property exi=
stance sufficient?<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt; no if you want to disable it<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt; if a bool is define in the dtsi and wan=
t to disable it int<br>
&gt; =A0 =A0 the dts<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt; if you we can do the the invert<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt; if !0 =3D&gt; true<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt;<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt; is-ok; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=3D&gt; true<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt; is-ok =3D &lt;val !=3D 0&gt;; =A0 =A0 =
=3D&gt; true<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;&gt; is-ok =3D &lt;0&gt;; =A0 =A0 =A0 =A0 =
=A0 =A0=3D&gt; false<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt;<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt; This is a failure of the dtc tool, not the =
binding.<br>
&gt; =A0 =A0 =A0Accepting this binding<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt; means we have to live with it for a very lo=
ng time. =A0It needs<br>
&gt; =A0 =A0 to be fixed<br>
&gt; =A0 =A0 &gt; &gt; &gt;&gt; in dtc instead so that properties can be de=
leted instead of<br>
&gt; =A0 =A0 only modified.<br>
&gt; =A0 =A0 &gt; &gt; &gt; I understand your idea but today if you put and=
 value in the<br>
&gt; =A0 =A0 property it&#39;s true.<br>
&gt; =A0 =A0 &gt; &gt; &gt;<br>
&gt; =A0 =A0 &gt; &gt; &gt; So is-ok =3D &lt;0&gt;; is true also which is i=
llogical as in any<br>
&gt; =A0 =A0 language a boolean is<br>
&gt; =A0 =A0 &gt; &gt; &gt; true (1) or false (0). When I read the property=
 I will<br>
&gt; =A0 =A0 understand false not true<br>
&gt; =A0 =A0 &gt; &gt;<br>
&gt; =A0 =A0 &gt; &gt; You could say similar things about is-ok =3D &quot;n=
o&quot; or is-ok =3D &quot;&quot; or<br>
&gt; =A0 =A0 is-ok =3D<br>
&gt; =A0 =A0 &gt; &gt; &quot;I&#39;d rather you didn&#39;t&quot;... it&#39;=
s expected that violating the<br>
&gt; =A0 =A0 binding may<br>
&gt; =A0 =A0 &gt; &gt; produce illogical results.<br>
&gt; =A0 =A0 &gt; today is most of the binding people use a number whe the =
want to<br>
&gt; =A0 =A0 be able to<br>
&gt; =A0 =A0 &gt; delete it and it&#39;s the same in most of the promgrammi=
ng language<br>
&gt;<br>
&gt; =A0 =A0 It isn&#39;t yet a big pain point, so there isn&#39;t time pre=
ssure here.<br>
&gt; =A0 =A0 =A0Fixing the tool<br>
&gt; =A0 =A0 is the better solution, and since the kernel carries a copy of=
 the<br>
&gt; =A0 =A0 tool we don&#39;t<br>
&gt; =A0 =A0 need to worry about adding a feature that isn&#39;t available =
by the dtc<br>
&gt; =A0 =A0 packaged by<br>
&gt; =A0 =A0 a distribution.<br>
&gt;<br>
&gt; =A0 =A0 Fixing the tool is the correct thing to do.<br>
&gt;<br>
&gt;<br>
&gt; I just wanted to pick up on this thread. Now in the kernel, absence of=
 a<br>
&gt; property indicates false, and presence indicates true. This is a kerne=
l<br>
&gt; convention, nothing to do with the dtb format.<br>
<br>
</div></div>It&#39;s an aspect of the device binding, and was used by Open =
Firmware<br>
bindings before Linux came up with flat device trees.<br></blockquote><div>=
<br></div><div>OK. When I asked about the boolean property on the devicetre=
e-discuss I understood that no one really cared, and it was a matter for Li=
nux.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
Also note that even non-boolean properties can mean something different<br>
when absent. =A0Sometimes this is a default value; sometimes, like with<br>
&quot;ranges&quot;, it&#39;s something that can&#39;t be expressed with any=
 value (empty<br>
ranges means all translations go straight through; no ranges means no<br>
translation is possible).<br></blockquote><div><br></div><div>That&#39;s fi=
ne, but I&#39;m not sure I understand why that relates to boolean propertie=
s, which currently mean always the same thing (false) when absent. I don&#3=
9;t think there is any intent to change that.</div>
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; I think it is useful to<br>
&gt; support a boolean with a non-null value which can be 0, meaning true a=
s<br>
&gt; Jean-Christophe says.<br>
&gt;<br>
&gt; My reasons are:<br>
&gt;<br>
&gt; 1. dtc does not have a way to delete a property and it isn&#39;t clear=
 what<br>
&gt; syntax could be used there.<br>
<br>
</div>Surely some syntax can be created for this. =A0E.g. /delete-prop/ foo=
;<br></blockquote><div><br></div><div>Yes, in fact I saw a patch after send=
ing this email. So for normal values to change the value we do</div><div>
<br></div><div>=A0 =A0prop =3D &lt;23&gt;;</div><div><br></div><div>but for=
 booleans we must do EITHER:</div><div><br></div><div>=A0 =A0bool;</div><di=
v><br></div><div>or</div><div><br></div><div>=A0 =A0/delete-prop/ bool;</di=
v><div><br>
</div><div>depending on whether we want the make it true or false? Ick.</di=
v><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; It also seems a little brittle to delete a<br>
&gt; property in one place and define it in another (ordering? confusion wh=
en<br>
&gt; people can&#39;t work out why it has gone?). So not only can dtc not d=
o<br>
&gt; this, but I&#39;m not sure that it should.<br>
<br>
</div>I don&#39;t see how it&#39;s worse than defining it one place and the=
n<br>
redefining it elsewhere.<br></blockquote><div><br></div><div>It seems worse=
 to me, see above. Also if we end up with symbols it will be impossible to =
do something like:</div><div><br></div><div>=A0 =A0bool-property =3D &lt;WI=
BBLE_VALUE&gt;;</div>
<div><br></div><div>You will have to do:</div><div><br></div><div>if WIBBLE=
_VALUE =3D=3D 0</div><div>=A0 /delete-prop/=A0bool-property;</div><div>#els=
e</div><div>=A0 bool-property;</div><div>#endif</div><div><br></div><div>or=
 whatever, or maybe I got that around the wrong way.... Not nice IMO.</div>
<div><br></div><div>(any comments on point 2?)</div><div>=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<div class=3D"im"><br>
&gt; 3. Discoverability: it is nice to be able to see the possible options,=
<br>
&gt; even if disabled.<br>
<br>
</div>This assumes the possible options were known in advance, or that you<=
br>
don&#39;t maintain compatibility with old device trees when a new option is=
<br>
added.<br></blockquote><div><br></div><div>You can still add the option wit=
h a zero value - or maybe I misunderstand what you mean.</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

<div class=3D"im"><br>
&gt; In particular, if a boolean value is true, and you<br>
&gt; later decide with fdtput to turn it off, you effectively remove all<br=
>
&gt; trace of it. This could be confusing for those who are looking for<br>
&gt; available options.<br>
<br>
</div>There should still be a &quot;trace of it&quot; in the binding docume=
nt.<br></blockquote><div><br></div><div>Yes true, that&#39;s the saving gra=
ce.</div><div><br></div><div>I&#39;m not even saying that we ever use</div>
<div><br></div><div>=A0 =A0bool-prop =3D &lt;1&gt;;</div><div><br></div><di=
v>Clearly that is redundant. I&#39;m just agreeing with Jean-Chrstophe that=
 it would be nice and clean to do something like:</div><div><br></div><div>=
=A0 =A0bool-prop =3D &lt;0&gt;;</div>
<div><br></div><div>and it will make it false.</div><div><br></div><div>Reg=
ards,</div><div>Simon</div><div>=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Scott<br>
<br>
</font></span></blockquote></div><br>

--14dae9399cefad1ecc04c4819798--

--===============2756609624036068631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2756609624036068631==--
