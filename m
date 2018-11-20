Return-Path: <SRS0=UDVs=N7=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20181118123504.83082-1-tmaimon77@gmail.com> <20181118123504.83082-2-tmaimon77@gmail.com>
 <CAOesGMjUJ1+qmbPWcVFm1F_F0fcdg-54YY6o4iK=PYWoAuEczA@mail.gmail.com>
In-Reply-To: <CAOesGMjUJ1+qmbPWcVFm1F_F0fcdg-54YY6o4iK=PYWoAuEczA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 20 Nov 2018 12:51:19 +0200
Message-ID: <CAP6Zq1j46ch8UUxJkO7SnrHWyP3Y7g58Fodejr98WN-TW8jhEw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] spi: npcm: fix uninitialized 'val' warning in
 receive function
Content-Type: multipart/alternative; boundary="000000000000170726057b16540a"
To: olof@lixom.net
Cc: broonie@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-spi@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000170726057b16540a
Content-Type: text/plain; charset="UTF-8"

Hi Olof,

On Sun, 18 Nov 2018 at 23:38, Olof Johansson <olof@lixom.net> wrote:

> On Sun, Nov 18, 2018 at 4:36 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Fix uninitialized 'val' warning receive function, send function
> > has been modify to be aligned with the receive function.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/spi/spi-npcm-pspi.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
> > index 6dae91091143..f75df49ab84e 100644
> > --- a/drivers/spi/spi-npcm-pspi.c
> > +++ b/drivers/spi/spi-npcm-pspi.c
> > @@ -199,11 +199,11 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
> >         wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
> >         priv->tx_bytes -= wsize;
> >
> > -       if (priv->tx_buf) {
> > -               if (wsize == 1)
> > -                       iowrite8(*priv->tx_buf, NPCM_PSPI_DATA +
> priv->base);
> > +       if (priv->tx_buf && wsize) {
>
> In general, doing an early:
>         if (!condition)
>                 return;
>
> is a pattern we prefer in the kernel. Setting up the assumptions at
> the beginning of the function makes it easier to follow the code flow,
> and saves a level of indentation.
>
> It's a matter of taste though, and this function has only one level.
> So, either way is OK. Just mentioning it.
>
> >                 if (wsize == 2)
> >                         iowrite16(*priv->tx_buf, NPCM_PSPI_DATA +
> priv->base);
> > +               else
> > +                       iowrite8(*priv->tx_buf, NPCM_PSPI_DATA +
> priv->base);
>
> I think this is broken? If wsize is something else than 1 or 2, you'll
> do a one-byte write but advance the buffer pointer with a different
> amount.
>
> It'll be fairly tricky to debug if this ever happens (it shouldn't,
> but still). This is why I added a WARN_ON_ONCE() in my patch instead.
>

We just tried to reduce the number of lines to minimum, so we have debug it
quite a lot (with all the numbers that can
get from priv->tx_bytes) and the only numbers that minimum function return
are 0, 1 or 2.

But in the end of the day,  we don't have an issue with your solution as
long it will be done also in the transfer function.

So if you can send a new patch with transfer function modification as well
it will be great (Please let me know if you like me to send the patch).

Thanks again

Tomer



-Olof
>

--000000000000170726057b16540a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Olof,<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Sun, 18 Nov 2018 at 23:38, Olof Johansson &lt;<a href=3D"mailto:olof@l=
ixom.net" target=3D"_blank">olof@lixom.net</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Sun, Nov 18, 2018 at 4:36 AM Tomer Maimon &lt;<a =
href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon77@gmail.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; Fix uninitialized &#39;val&#39; warning receive function, send functio=
n<br>
&gt; has been modify to be aligned with the receive function.<br>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/spi/spi-npcm-pspi.c | 12 ++++++------<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c=
<br>
&gt; index 6dae91091143..f75df49ab84e 100644<br>
&gt; --- a/drivers/spi/spi-npcm-pspi.c<br>
&gt; +++ b/drivers/spi/spi-npcm-pspi.c<br>
&gt; @@ -199,11 +199,11 @@ static void npcm_pspi_send(struct npcm_pspi *pri=
v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wsize =3D min(bytes_per_word(priv-&gt=
;bits_per_word), priv-&gt;tx_bytes);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;tx_bytes -=3D wsize;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;tx_buf) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (wsize =3D=
=3D 1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0iowrite8(*priv-&gt;tx_buf, NPCM_PSPI_DATA + priv-&gt;base);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;tx_buf &amp;&amp; wsize) {<br=
>
<br>
In general, doing an early:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!condition)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
is a pattern we prefer in the kernel. Setting up the assumptions at<br>
the beginning of the function makes it easier to follow the code flow,<br>
and saves a level of indentation.<br>
<br>
It&#39;s a matter of taste though, and this function has only one level.<br=
>
So, either way is OK. Just mentioning it.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (wsize=
 =3D=3D 2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0iowrite16(*priv-&gt;tx_buf, NPCM_PSPI_DATA + priv-&gt;b=
ase);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0iowrite8(*priv-&gt;tx_buf, NPCM_PSPI_DATA + priv-&gt;base);<b=
r>
<br>
I think this is broken? If wsize is something else than 1 or 2, you&#39;ll<=
br>
do a one-byte write but advance the buffer pointer with a different<br>
amount.<br>
<br>
It&#39;ll be fairly tricky to debug if this ever happens (it shouldn&#39;t,=
<br>
but still). This is why I added a WARN_ON_ONCE() in my patch instead.<br></=
blockquote><div><br></div><div>We just tried to reduce the number of lines =
to minimum, so we have debug it quite a lot (with all the numbers that can=
=C2=A0</div><div>get from priv-&gt;tx_bytes) and the only numbers that mini=
mum function return are 0, 1 or 2.</div><div><br></div><div>But in the end =
of the day,=C2=A0 we don&#39;t have an issue with your solution as long it =
will be done also in the transfer function.<br></div><div><br></div><div>So=
 if you can send a new patch with transfer function modification as well it=
 will be great (Please let me know if you like me to send the patch).</div>=
<div><br></div><div>Thanks again</div><div><br></div><div>Tomer</div><div><=
br></div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-Olof<br>
</blockquote></div></div>

--000000000000170726057b16540a--
