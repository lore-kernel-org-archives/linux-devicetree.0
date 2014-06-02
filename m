Return-Path: <rickard.strandqvist@spectrumdigital.se>
MIME-Version: 1.0
In-Reply-To: <004801cf7e05$c3354c20$499fe460$%han@samsung.com>
References: <1400346848-25098-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
	<20140601202647.GD3853@katana>
	<004801cf7e05$c3354c20$499fe460$%han@samsung.com>
Date: Mon, 2 Jun 2014 12:15:51 +0200
Message-ID: <CAFo99gbtO10Bt16jH5-tB-1Om5KzwZqrUYLdSRA6PXcbt+SiEQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: busses: i2c-pxa.c: Fix for possible null pointer dereference
From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Content-Type: multipart/alternative; boundary=089e0116070c04b6dc04fad7ae70
To: Jingoo Han <jg1.han@samsung.com>
Cc: Leilei Shang <shangll@marvell.com>, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, Daniel Drake <dsd@laptop.org>
List-ID: <devicetree@vger.kernel.org>

--089e0116070c04b6dc04fad7ae70
Content-Type: text/plain; charset=UTF-8

Hi

Ok, working on it. New patch later then..
On Monday, June 02, 2014 5:27 AM, Wolfram Sang wrote:
> On Sat, May 17, 2014 at 07:14:08PM +0200, Rickard Strandqvist wrote:
> > There is otherwise a risk of a possible null pointer dereference.
> >
> > Was largely found by using a static code analysis program called
cppcheck.
>
> It is useful to put the output of the analyzer here.
>
> >
> > Signed-off-by: Rickard Strandqvist <
rickard_strandqvist@spectrumdigital.se>
> > ---
> >  drivers/i2c/busses/i2c-pxa.c |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> > index bbe6dfb..dbe5ebe 100644
> > --- a/drivers/i2c/busses/i2c-pxa.c
> > +++ b/drivers/i2c/busses/i2c-pxa.c
> > @@ -1269,7 +1269,9 @@ eremap:
> >  eclk:
> >     kfree(i2c);
> >  emalloc:
> > -   release_mem_region(res->start, resource_size(res));
> > +   if(res) {
> > +           release_mem_region(res->start, resource_size(res));
> > +   }
>
> The proper fix is to move the release to the proper place, before kfree.
> Even better would probably be a devm_* conversion.

+1

I agree with Wolfram Sang's opinion. Please call release_mem_region()
prior to kfree().

One more thing, don't use braces when a single statement
is used. Please refer to 'Chapter 3: Placing Braces and Spaces'
of 'Documentation/CodingStyle'.

Best regards,
Jingoo Han

--089e0116070c04b6dc04fad7ae70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi</p>
<p dir=3D"ltr">Ok, working on it. New patch later then..</p>
<div class=3D"gmail_quot&lt;blockquote class=3D" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Monday, June 02, 2014 5:27=
 AM, Wolfram Sang wrote:<br>
&gt; On Sat, May 17, 2014 at 07:14:08PM +0200, Rickard Strandqvist wrote:<b=
r>
&gt; &gt; There is otherwise a risk of a possible null pointer dereference.=
<br>
&gt; &gt;<br>
&gt; &gt; Was largely found by using a static code analysis program called =
cppcheck.<br>
&gt;<br>
&gt; It is useful to put the output of the analyzer here.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Rickard Strandqvist &lt;<a href=3D"mailto:rickard_=
strandqvist@spectrumdigital.se">rickard_strandqvist@spectrumdigital.se</a>&=
gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0drivers/i2c/busses/i2c-pxa.c | =C2=A0 =C2=A04 +++-<br>
&gt; &gt; =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2=
c-pxa.c<br>
&gt; &gt; index bbe6dfb..dbe5ebe 100644<br>
&gt; &gt; --- a/drivers/i2c/busses/i2c-pxa.c<br>
&gt; &gt; +++ b/drivers/i2c/busses/i2c-pxa.c<br>
&gt; &gt; @@ -1269,7 +1269,9 @@ eremap:<br>
&gt; &gt; =C2=A0eclk:<br>
&gt; &gt; =C2=A0 =C2=A0 kfree(i2c);<br>
&gt; &gt; =C2=A0emalloc:<br>
&gt; &gt; - =C2=A0 release_mem_region(res-&gt;start, resource_size(res));<b=
r>
&gt; &gt; + =C2=A0 if(res) {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 release_mem_region(res-&gt;s=
tart, resource_size(res));<br>
&gt; &gt; + =C2=A0 }<br>
&gt;<br>
&gt; The proper fix is to move the release to the proper place, before kfre=
e.<br>
&gt; Even better would probably be a devm_* conversion.<br>
<br>
+1<br>
<br>
I agree with Wolfram Sang&#39;s opinion. Please call release_mem_region()<b=
r>
prior to kfree().<br>
<br>
One more thing, don&#39;t use braces when a single statement<br>
is used. Please refer to &#39;Chapter 3: Placing Braces and Spaces&#39;<br>
of &#39;Documentation/CodingStyle&#39;.<br>
<br>
Best regards,<br>
Jingoo Han<br>
<br>
</div>

--089e0116070c04b6dc04fad7ae70--
