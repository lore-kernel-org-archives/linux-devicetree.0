Return-Path: <SRS0=KIr6=IS=benyossef.com=gilad@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180529161248.fphjnceozoyxqy7v@verge.net.au>
References: <1527171551-21979-1-git-send-email-gilad@benyossef.com>
 <1527171551-21979-2-git-send-email-gilad@benyossef.com> <20180529161248.fphjnceozoyxqy7v@verge.net.au>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Thu, 31 May 2018 14:49:54 +0300
Message-ID: <CAOtvUMebK3eM0O0C4bMa+13vej6egVV389AZ=HOnruPbfxZDkg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] crypto: ccree: correct host regs offset
Content-Type: multipart/alternative; boundary="000000000000da90a2056d7f104e"
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Ofir Drang <ofir.drang@arm.com>, stable@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000da90a2056d7f104e
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 7:12 PM, Simon Horman <horms@verge.net.au> wrote:

> On Thu, May 24, 2018 at 03:19:06PM +0100, Gilad Ben-Yossef wrote:
> > The product signature and HW revision register have different offset on
> the
> > older HW revisions.
> > This fixes the problem of the driver failing sanity check on silicon
> > despite working on the FPGA emulation systems.
> >
> > Fixes: 27b3b22dd98c ("crypto: ccree - add support for older HW revs")
>
> Did the above introduce a regression that is fixed by this patch
> or did it add a feature that only works with this patch?
>
>
Sort of in between - the first patch made more devices work but
unreliability (it will sometime work, sometime doesn't).
This one make it work reliably.


> In the case of the latter I would drop the Fixes tag,
> but I don't feel strongly about it.
>



>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
>
> Minor not below not withstanding,
>



> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> Thank you for the review and help :-)

Gilad

--000000000000da90a2056d7f104e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 29, 2018 at 7:12 PM, Simon Horman <span dir=3D"ltr">&lt;<a =
href=3D"mailto:horms@verge.net.au" target=3D"_blank">horms@verge.net.au</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Th=
u, May 24, 2018 at 03:19:06PM +0100, Gilad Ben-Yossef wrote:<br>
&gt; The product signature and HW revision register have different offset o=
n the<br>
&gt; older HW revisions.<br>
&gt; This fixes the problem of the driver failing sanity check on silicon<b=
r>
&gt; despite working on the FPGA emulation systems.<br>
&gt; <br>
&gt; Fixes: 27b3b22dd98c (&quot;crypto: ccree - add support for older HW re=
vs&quot;)<br>
<br>
</span>Did the above introduce a regression that is fixed by this patch<br>
or did it add a feature that only works with this patch?<br>
<br></blockquote><div><br></div><div>Sort of in between - the first patch m=
ade more devices work but unreliability (it will sometime work, sometime do=
esn&#39;t).</div><div>This one make it work reliably.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
In the case of the latter I would drop the Fixes tag,<br>
but I don&#39;t feel strongly about it.<br></blockquote><div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; Cc: <a href=3D"mailto:stable@vger.kernel.org">stable@vger.kernel.org</=
a><br>
&gt; Signed-off-by: Gilad Ben-Yossef &lt;<a href=3D"mailto:gilad@benyossef.=
com">gilad@benyossef.com</a>&gt;<br>
<br>
</span>Minor not below not withstanding,<br></blockquote><div><br></div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
Reviewed-by: Simon Horman &lt;<a href=3D"mailto:horms%2Brenesas@verge.net.a=
u">horms+renesas@verge.net.au</a>&gt;<br>
<div><div class=3D"h5"><br></div></div></blockquote><div>

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial">T=
hank you for the review and help :-)</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:small;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><br></div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial">Gilad=C2=A0</div>

<br></div></div>
</div></div>

--000000000000da90a2056d7f104e--
