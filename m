From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH] dtc: integrate gpp
Date: Tue, 10 Jul 2012 14:41:20 +0200
Message-ID: <CAPnjgZ0fXCHB+jcDQUn=pY1MfeLq1q3FLALJQF6v0drTqJ=7cg@mail.gmail.com>
References: <1339786432-6435-1-git-send-email-swarren@wwwdotorg.org>
 <4FEB7DFE.3030509@wwwdotorg.org> <4FF35238.5090501@wwwdotorg.org>
 <20120705061740.GH17705@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7242670855225274537=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120705061740.GH17705-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============7242670855225274537==
Content-Type: multipart/alternative; boundary=f46d044481d91d432e04c4790ccf

--f46d044481d91d432e04c4790ccf
Content-Type: text/plain; charset=ISO-8859-1

Hi Stephen,

On Thu, Jul 5, 2012 at 8:17 AM, Jean-Christophe PLAGNIOL-VILLARD <
plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:

> On 14:12 Tue 03 Jul     , Stephen Warren wrote:
> > On 06/27/2012 03:41 PM, Stephen Warren wrote:
> > > On 06/15/2012 12:53 PM, Stephen Warren wrote:
> > >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >>
> > >> I figured the easiest way to get named constants into dtc would be to
> > >> re-use an existing C pre-processor implemntation. Surprisingly, I
> could
> > >> not find many /good/ possibilities for this. I eventually found one
> called
> > >> gpp. This patch is an extremely quick-and-dirty integration of gpp
> into
> > >> dtc in order to solicit some feedback. What do people think of this
> > >> approach in general?
> > >
> > > David, Jon,
> > >
> > > What do you think of integrating gpp (or is there some alternative that
> > > would be better)? Does it seem a reasonable approach; should I work on
> > > addressing the TODO items I mentioned in the patch, or give up on this?
> >
> > Are there any comments on this? Thanks.
>
> I'm looking for this too
>
> can we have a clear statement on it?
>

I'm also looking for this.

I was hoping for first-class symbols in dtc, and I wonder how we deal with
error handling in two places, as well as displaying compile errors in
preprocessed code. But still, I hope that this can go ahead as it much
better than what we have at present (nothing).

Regards,
Simon


>
> Best Regards,
> J.
> > _______________________________________________
> > devicetree-discuss mailing list
> > devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > https://lists.ozlabs.org/listinfo/devicetree-discuss
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>

--f46d044481d91d432e04c4790ccf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Stephen,<br><br><div class=3D"gmail_quote">On Thu, Jul 5, 2012 at 8:17 A=
M, Jean-Christophe PLAGNIOL-VILLARD <span dir=3D"ltr">&lt;<a href=3D"mailto=
:plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org" target=3D"_blank">plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 14:12 Tue 03 Jul =A0 =
=A0 , Stephen Warren wrote:<br>
&gt; On 06/27/2012 03:41 PM, Stephen Warren wrote:<br>
&gt; &gt; On 06/15/2012 12:53 PM, Stephen Warren wrote:<br>
&gt; &gt;&gt; From: Stephen Warren &lt;<a href=3D"mailto:swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
">swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I figured the easiest way to get named constants into dtc wou=
ld be to<br>
&gt; &gt;&gt; re-use an existing C pre-processor implemntation. Surprisingl=
y, I could<br>
&gt; &gt;&gt; not find many /good/ possibilities for this. I eventually fou=
nd one called<br>
&gt; &gt;&gt; gpp. This patch is an extremely quick-and-dirty integration o=
f gpp into<br>
&gt; &gt;&gt; dtc in order to solicit some feedback. What do people think o=
f this<br>
&gt; &gt;&gt; approach in general?<br>
&gt; &gt;<br>
&gt; &gt; David, Jon,<br>
&gt; &gt;<br>
&gt; &gt; What do you think of integrating gpp (or is there some alternativ=
e that<br>
&gt; &gt; would be better)? Does it seem a reasonable approach; should I wo=
rk on<br>
&gt; &gt; addressing the TODO items I mentioned in the patch, or give up on=
 this?<br>
&gt;<br>
&gt; Are there any comments on this? Thanks.<br>
<br>
</div>I&#39;m looking for this too<br>
<br>
can we have a clear statement on it?<br></blockquote><div><br></div><div>I&=
#39;m also looking for this.</div><div><br></div><div>I was hoping for firs=
t-class symbols in dtc, and I wonder how we deal with error handling in two=
 places, as well as displaying compile errors in preprocessed code. But sti=
ll, I hope that this can go ahead as it much better than what we have at pr=
esent (nothing).</div>
<div><br></div><div>Regards,</div><div>Simon</div><div>=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
<br>
Best Regards,<br>
<div class=3D"HOEnZb"><div class=3D"h5">J.<br>
&gt; _______________________________________________<br>
&gt; devicetree-discuss mailing list<br>
&gt; <a href=3D"mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-disc=
uss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org</a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/devicetree-discuss" targe=
t=3D"_blank">https://lists.ozlabs.org/listinfo/devicetree-discuss</a><br>
_______________________________________________<br>
devicetree-discuss mailing list<br>
<a href=3D"mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss@l=
ists.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/devicetree-discuss" target=3D"=
_blank">https://lists.ozlabs.org/listinfo/devicetree-discuss</a><br>
</div></div></blockquote></div><br>

--f46d044481d91d432e04c4790ccf--

--===============7242670855225274537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7242670855225274537==--
