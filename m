From: Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: Disable strict mode for
 H5 driver
Date: Tue, 12 Dec 2017 10:35:16 +0000
Message-ID: <CAP03XeoHGhN84WUXkBpmGEYiLVM-JZj_NBuQgO84sSzLa1acbw@mail.gmail.com>
References: <20171125120200.23294-1-andre.przywara@arm.com>
 <20171125120200.23294-3-andre.przywara@arm.com> <CACRpkdZX5U=JoQFS+X96+F68yVSZbnCZpgNfAnvfJGxZ9moi8A@mail.gmail.com>
 <3ef7cfa4-cc1a-f24b-0013-f36db82781e5@arm.com> <CACRpkdaa0rMxaMseTxXryV7=AhWDQgsO_ZGTj-zGzaqBLFp5sw@mail.gmail.com>
Reply-To: obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="94eb2c1a6580edb3a405602234a4"
Return-path: <linux-sunxi+bncBCVP56HU4ELBBZPBX3IQKGQEJZHWTJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CACRpkdaa0rMxaMseTxXryV7=AhWDQgsO_ZGTj-zGzaqBLFp5sw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--94eb2c1a6580edb3a405602234a4
Content-Type: text/plain; charset="UTF-8"

Excellent, thanks Linus.  The new DTS files are not in mainline, but this
can wait ;-)


Cheers!

On 12 December 2017 at 08:52, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
wrote:

> On Thu, Nov 30, 2017 at 5:07 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> wrote:
> > On 30/11/17 15:51, Linus Walleij wrote:
> >> On Sat, Nov 25, 2017 at 1:02 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> wrote:
> >>
> >>> All of the H5 boards in the kernel reference the MMC0 CD pin twice in
> >>> their DT, so strict mode will make the MMC driver fail to load.
> >>> To keep existing DTs working, disable strict mode in the H5 driver.
> >>>
> >>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> >>> Reported-by: Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >> Patch applied with Maxime's ACK.
> >
> > Thanks for that (also to Maxime and Chen-Yu) and the smooth handling!
> >
> > Sorry, I just see that I didn't point this out explicitly, but this is
> > to fix a regression introduced in 4.15-rc1, so is this on a branch that
> > will be pushed for 4.15-rc, still? (Couldn't find anything quickly on
> > kernel.org)
>
> Should be upstream as:
> commit 07c43a382d7de3db01cc28bf2e17ed151cde2046
>
> Yours,
> Linus Walleij
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--94eb2c1a6580edb3a405602234a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Excellent, thanks Linus.=C2=A0 The new DTS files are =
not in mainline, but this can wait=C2=A0;-)</div><div><br></div><div><br></=
div><div>Cheers!</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 12 December 2017 at 08:52, Linus Walleij <span dir=3D"ltr">&l=
t;<a href=3D"mailto:linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" target=3D"_blank">linus.walle=
ij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Th=
u, Nov 30, 2017 at 5:07 PM, Andre Przywara &lt;<a href=3D"mailto:andre.przy=
wara-5wv7dgnIgG8@public.gmane.org">andre.przywara-5wv7dgnIgG8@public.gmane.org</a>&gt; wrote:<br>
&gt; On 30/11/17 15:51, Linus Walleij wrote:<br>
&gt;&gt; On Sat, Nov 25, 2017 at 1:02 PM, Andre Przywara &lt;<a href=3D"mai=
lto:andre.przywara-5wv7dgnIgG8@public.gmane.org">andre.przywara-5wv7dgnIgG8@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; All of the H5 boards in the kernel reference the MMC0 CD pin t=
wice in<br>
&gt;&gt;&gt; their DT, so strict mode will make the MMC driver fail to load=
.<br>
&gt;&gt;&gt; To keep existing DTs working, disable strict mode in the H5 dr=
iver.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Andre Przywara &lt;<a href=3D"mailto:andre.przy=
wara-5wv7dgnIgG8@public.gmane.org">andre.przywara-5wv7dgnIgG8@public.gmane.org</a>&gt;<br>
&gt;&gt;&gt; Reported-by: Chris Obbard &lt;<a href=3D"mailto:obbardc@gmail.=
com">obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Patch applied with Maxime&#39;s ACK.<br>
&gt;<br>
&gt; Thanks for that (also to Maxime and Chen-Yu) and the smooth handling!<=
br>
&gt;<br>
&gt; Sorry, I just see that I didn&#39;t point this out explicitly, but thi=
s is<br>
&gt; to fix a regression introduced in 4.15-rc1, so is this on a branch tha=
t<br>
&gt; will be pushed for 4.15-rc, still? (Couldn&#39;t find anything quickly=
 on<br>
&gt; <a href=3D"http://kernel.org" target=3D"_blank" rel=3D"noreferrer">ker=
nel.org</a>)<br>
<br>
Should be upstream as:<br>
commit 07c43a382d7de3db01cc28bf2e17ed<wbr>151cde2046<br>
<br>
Yours,<br>
Linus Walleij<br>
</blockquote></div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--94eb2c1a6580edb3a405602234a4--
