From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/1] of: introduce helper to manage boolean
Date: Tue, 10 Jul 2012 14:10:44 +0200
Message-ID: <CAPnjgZ2dj5pcuGhM2_2nwwnhhcCmKhyi6jVHS7Xf1f682i_j_w@mail.gmail.com>
References: <1328588028-24766-1-git-send-email-plagnioj@jcrosoft.com>
 <20120309014441.8236B3E0903@localhost>
 <20120309100435.GN27213@game.jcrosoft.org>
 <20120309162638.92E813E0880@localhost>
 <20120309163608.GQ27213@game.jcrosoft.org>
 <4F5E50DA.6080000@freescale.com>
 <20120313031739.GA18320@game.jcrosoft.org>
 <20120313041652.563B63E0536@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5266629284117132324=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120313041652.563B63E0536@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============5266629284117132324==
Content-Type: multipart/alternative; boundary=e89a8fb20532bb17a104c4789e90

--e89a8fb20532bb17a104c4789e90
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Tue, Mar 13, 2012 at 5:16 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>wrote:

> On Tue, 13 Mar 2012 04:17:39 +0100, Jean-Christophe PLAGNIOL-VILLARD <
> plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> > On 14:39 Mon 12 Mar     , Scott Wood wrote:
> > > On 03/09/2012 10:36 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > >>>> Ugh.  so any value other than 1 returns false?  I think that will
> surprise
> > > >>>> most people.
> > > >>>>
> > > >>>> I don't like this api or binding.  If it is a bool property, then
> why isn't
> > > >>>> simply testing for the property existance sufficient?
> > > >>> no if you want to disable it
> > > >>>
> > > >>> if a bool is define in the dtsi and want to disable it int the dts
> > > >>>
> > > >>> if you we can do the the invert
> > > >>>
> > > >>> if !0 => true
> > > >>>
> > > >>> is-ok;                  => true
> > > >>> is-ok = <val != 0>;     => true
> > > >>> is-ok = <0>;            => false
> > > >>
> > > >> This is a failure of the dtc tool, not the binding.  Accepting this
> binding
> > > >> means we have to live with it for a very long time.  It needs to be
> fixed
> > > >> in dtc instead so that properties can be deleted instead of only
> modified.
> > > > I understand your idea but today if you put and value in the
> property it's true.
> > > >
> > > > So is-ok = <0>; is true also which is illogical as in any language a
> boolean is
> > > > true (1) or false (0). When I read the property I will understand
> false not true
> > >
> > > You could say similar things about is-ok = "no" or is-ok = "" or is-ok
> =
> > > "I'd rather you didn't"... it's expected that violating the binding may
> > > produce illogical results.
> > today is most of the binding people use a number whe the want to be able
> to
> > delete it and it's the same in most of the promgramming language
>
> It isn't yet a big pain point, so there isn't time pressure here.  Fixing
> the tool
> is the better solution, and since the kernel carries a copy of the tool we
> don't
> need to worry about adding a feature that isn't available by the dtc
> packaged by
> a distribution.
>
> Fixing the tool is the correct thing to do.
>

I just wanted to pick up on this thread. Now in the kernel, absence of a
property indicates false, and presence indicates true. This is a kernel
convention, nothing to do with the dtb format. I think it is useful to
support a boolean with a non-null value which can be 0, meaning true as
Jean-Christophe says.

My reasons are:

1. dtc does not have a way to delete a property and it isn't clear what
syntax could be used there. It also seems a little brittle to delete a
property in one place and define it in another (ordering? confusion when
people can't work out why it has gone?). So not only can dtc not do this,
but I'm not sure that it should.

2. fdtput allows updating a property. It is pretty easy to do something
like 'fdtput file.dtb /node propname $value' where value is 0 or 1. To use
the current binding we need to either do:

if [[ $value == 0 ]]; then
   fdtput -d file.dtb /node propname   # new function to delete a property?
else
   fdtput file.dtb /node propname 1
fi

or perhaps something like:

   fdtput -B file.dtb /node propname ${value}

where -B is a new option meaning either create an empty property, or delete
any property it finds, based on the value being 0 or non-zero.

3. Discoverability: it is nice to be able to see the possible options, even
if disabled. In particular, if a boolean value is true, and you later
decide with fdtput to turn it off, you effectively remove all trace of it.
This could be confusing for those who are looking for available options.

Arguably these issues could be fixed if we introduced some sort of type
hinting into the dtb file format, but that seems a long shot. I am not sure
that modifying the tools to support this arguable odd 'present/absent'
boolean binding is the right approach.

So I think Jean-Christophe's idea has significant merit.

Thoughts?

Regards,
Simon

>
> g.
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>

--e89a8fb20532bb17a104c4789e90
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br><div class=3D"gmail_quote">On Tue, Mar 13, 2012 at 5:16 AM, Gran=
t Likely <span dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org"=
 target=3D"_blank">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Tue, 13 Mar 2012 04:17:39 +0100,=
 Jean-Christophe PLAGNIOL-VILLARD &lt;<a href=3D"mailto:plagnioj@jcrosoft.c=
om">plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org</a>&gt; wrote:<br>
&gt; On 14:39 Mon 12 Mar =A0 =A0 , Scott Wood wrote:<br>
&gt; &gt; On 03/09/2012 10:36 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:<b=
r>
&gt; &gt; &gt;&gt;&gt;&gt; Ugh. =A0so any value other than 1 returns false?=
 =A0I think that will surprise<br>
&gt; &gt; &gt;&gt;&gt;&gt; most people.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; I don&#39;t like this api or binding. =A0If it i=
s a bool property, then why isn&#39;t<br>
&gt; &gt; &gt;&gt;&gt;&gt; simply testing for the property existance suffic=
ient?<br>
&gt; &gt; &gt;&gt;&gt; no if you want to disable it<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; if a bool is define in the dtsi and want to disable =
it int the dts<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; if you we can do the the invert<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; if !0 =3D&gt; true<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; is-ok; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D&gt; tr=
ue<br>
&gt; &gt; &gt;&gt;&gt; is-ok =3D &lt;val !=3D 0&gt;; =A0 =A0 =3D&gt; true<b=
r>
&gt; &gt; &gt;&gt;&gt; is-ok =3D &lt;0&gt;; =A0 =A0 =A0 =A0 =A0 =A0=3D&gt; =
false<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; This is a failure of the dtc tool, not the binding. =A0A=
ccepting this binding<br>
&gt; &gt; &gt;&gt; means we have to live with it for a very long time. =A0I=
t needs to be fixed<br>
&gt; &gt; &gt;&gt; in dtc instead so that properties can be deleted instead=
 of only modified.<br>
&gt; &gt; &gt; I understand your idea but today if you put and value in the=
 property it&#39;s true.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So is-ok =3D &lt;0&gt;; is true also which is illogical as i=
n any language a boolean is<br>
&gt; &gt; &gt; true (1) or false (0). When I read the property I will under=
stand false not true<br>
&gt; &gt;<br>
&gt; &gt; You could say similar things about is-ok =3D &quot;no&quot; or is=
-ok =3D &quot;&quot; or is-ok =3D<br>
&gt; &gt; &quot;I&#39;d rather you didn&#39;t&quot;... it&#39;s expected th=
at violating the binding may<br>
&gt; &gt; produce illogical results.<br>
&gt; today is most of the binding people use a number whe the want to be ab=
le to<br>
&gt; delete it and it&#39;s the same in most of the promgramming language<b=
r>
<br>
</div></div>It isn&#39;t yet a big pain point, so there isn&#39;t time pres=
sure here. =A0Fixing the tool<br>
is the better solution, and since the kernel carries a copy of the tool we =
don&#39;t<br>
need to worry about adding a feature that isn&#39;t available by the dtc pa=
ckaged by<br>
a distribution.<br>
<br>
Fixing the tool is the correct thing to do.<br></blockquote><div><br></div>=
<div>I just wanted to pick up on this thread. Now in the kernel, absence of=
 a property indicates false, and presence indicates true. This is a kernel =
convention, nothing to do with the dtb format. I think it is useful to supp=
ort a boolean with a non-null value which can be 0, meaning true as Jean-Ch=
ristophe says.</div>
<div><br></div><div>My reasons are:</div><div><br></div><div>1. dtc does no=
t have a way to delete a property and it isn&#39;t clear what syntax could =
be used there. It also seems a little brittle to delete a property in one p=
lace and define it in another (ordering? confusion when people can&#39;t wo=
rk out why it has gone?). So not only can dtc not do this, but I&#39;m not =
sure that it should.</div>
<div><br></div><div>2. fdtput allows updating a property. It is pretty easy=
 to do something like &#39;fdtput file.dtb /node propname $value&#39; where=
 value is 0 or 1. To use the current binding we need to either do:</div>
<div><br></div><div>if [[ $value =3D=3D 0 ]]; then</div><div>=A0 =A0fdtput =
-d file.dtb /node=A0propname =A0 # new function to delete a property?</div>=
<div>else</div><div>=A0 =A0fdtput file.dtb /node=A0propname 1=A0</div><div>=
fi</div><div><br>
</div><div>or perhaps something like:</div><div><br></div><div><div>=A0 =A0=
fdtput -B file.dtb /node=A0propname ${value} =A0=A0</div><div><br></div><di=
v>where -B is a new option meaning either create an empty property, or dele=
te any property it finds, based on the value being 0 or non-zero.</div>
</div><div><br></div><div>3. Discoverability: it is nice to be able to see =
the possible options, even if disabled. In particular, if a boolean value i=
s true, and you later decide with fdtput to turn it off, you effectively re=
move all trace of it. This could be confusing for those who are looking for=
 available options.</div>
<div><br></div><div>Arguably these issues could be fixed if we introduced s=
ome sort of type hinting into the dtb file format, but that seems a long sh=
ot. I am not sure that modifying the tools to support this arguable odd &#3=
9;present/absent&#39; boolean binding is the right approach.</div>
<div><br></div><div>So I think=A0Jean-Christophe&#39;s idea has significant=
 merit.</div><div><br></div><div>Thoughts?</div><div><br></div><div>Regards=
,</div><div>Simon=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5"><br>
g.<br>
<br>
_______________________________________________<br>
devicetree-discuss mailing list<br>
<a href=3D"mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss@l=
ists.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/devicetree-discuss" target=3D"=
_blank">https://lists.ozlabs.org/listinfo/devicetree-discuss</a><br>
</div></div></blockquote></div><br>

--e89a8fb20532bb17a104c4789e90--

--===============5266629284117132324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5266629284117132324==--
