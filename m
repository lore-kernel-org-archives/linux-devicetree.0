From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Mon, 6 Feb 2017 11:07:42 +0100
Message-ID: <CAKMK7uHgW15EPpPSU2se7r89JCGD_oTvn9ZJptYaNJAWMKb9Fg@mail.gmail.com>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-3-noralf@tronnes.org>
 <20170206085629.GD27607@ulmo.ba.sec>
 <20170206090918.6rqr6l7pd62znl5j@phenom.ffwll.local>
 <20170206093556.GF27607@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1817707101=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170206093556.GF27607@ulmo.ba.sec>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

--===============1817707101==
Content-Type: multipart/alternative; boundary=001a11451bc66739e00547d9cd0b

--001a11451bc66739e00547d9cd0b
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 6, 2017 at 10:35 AM, Thierry Reding <thierry.reding@gmail.com>
wrote:

> > > > +EXPORT_SYMBOL(tinydrm_disable_backlight);
> > > > +#endif
> > >
> > > These look like they really should be part of the backlight subsystem.
> I
> > > don't see anything DRM specific about them. Well, except for the error
> > > messages.
> >
> > So this is a bit an unpopular opinion with some folks, but I don't
> require
> > anyone to submit new code to subsystems outside of drm for new drivers.
> > Simply because it takes months to get stuff landed, and in general it's
> > not worth the trouble.
>
> "Not worth the trouble" is very subjective. If you look at the Linux
> kernel in general, one of the reasons why it works so well is because
> the changes we make apply to the kernel as a whole. Yes, sometimes that
> makes things more difficult and time-consuming, but it also means that
> the end result will be much more widely usable and therefore benefits
> everyone else in return. In my opinion that's a large part of why the
> kernel is so successful.
>
> > We have piles of stuff in drm and drm drivers that should be in core but
> > isn't.
> >
> > Imo the only reasonable way is to merge as-is, then follow-up with a
> patch
> > series to move the helper into the right subsystem. Most often
> > unfortunately that follow-up patch series will just die.
>
> Of course follow-up series die. That's because nobody cares to follow-up
> once their code has been merged.
>
> Collecting our own helpers or variants of subsystems is a great way of
> isolating ourselves from the rest of the community. I don't think that's
> a good solution in the long run at all.
>

We have a bunch of patch series that we resubmit for months and they go
exactly nowhere. They don't die because we stop caring, they die because
they die. Some of them we even need to constantly rebase and carry around
in drm-tip since our CI would Oops or spew WARNIGs all over the place.
There's simply some areas of the kernel which seem overloaded under patches
and no one is willing or able to fix things, and I can't fix the entire
kernel. Nor expect contributors (who have much less political weight to
throw around than me) to do that and succeed. And we don't end up with
worse code in the drm subsystem, since we can still do the refactoring
within drm helpers and end up with clean drivers.

I fully agree that it's not great for the kernel's future, but when I'm
stuck with the option to get shit done or burning out playing the
upstreaming game, the choice is easy. And in the end I care about open
source gfx much more than the kernel, and I think for open source gfx's
success it's crucial that we're welcoming to new contributors and don't
throw up massive roadblocks. Open source gfx is tiny and still far away
from world domination, we need _lots_ more people. If that means routing
around other subsystems for them, I'm all for it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

--001a11451bc66739e00547d9cd0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Feb 6, 2017 at 10:35 AM, Thierry Reding <span dir=3D"ltr">&lt;<a href=
=3D"mailto:thierry.reding@gmail.com" target=3D"_blank">thierry.reding@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">&gt; &gt; &gt; +EXPORT_SYMBOL(tinydrm_<wbr>disable_backlight);<br>
&gt; &gt; &gt; +#endif<br>
&gt; &gt;<br>
&gt; &gt; These look like they really should be part of the backlight subsy=
stem. I<br>
&gt; &gt; don&#39;t see anything DRM specific about them. Well, except for =
the error<br>
&gt; &gt; messages.<br>
&gt;<br>
&gt; So this is a bit an unpopular opinion with some folks, but I don&#39;t=
 require<br>
&gt; anyone to submit new code to subsystems outside of drm for new drivers=
.<br>
&gt; Simply because it takes months to get stuff landed, and in general it&=
#39;s<br>
&gt; not worth the trouble.<br>
<br>
</span>&quot;Not worth the trouble&quot; is very subjective. If you look at=
 the Linux<br>
kernel in general, one of the reasons why it works so well is because<br>
the changes we make apply to the kernel as a whole. Yes, sometimes that<br>
makes things more difficult and time-consuming, but it also means that<br>
the end result will be much more widely usable and therefore benefits<br>
everyone else in return. In my opinion that&#39;s a large part of why the<b=
r>
kernel is so successful.<br>
<span class=3D""><br>
&gt; We have piles of stuff in drm and drm drivers that should be in core b=
ut<br>
&gt; isn&#39;t.<br>
&gt;<br>
&gt; Imo the only reasonable way is to merge as-is, then follow-up with a p=
atch<br>
&gt; series to move the helper into the right subsystem. Most often<br>
&gt; unfortunately that follow-up patch series will just die.<br>
<br>
</span>Of course follow-up series die. That&#39;s because nobody cares to f=
ollow-up<br>
once their code has been merged.<br>
<br>
Collecting our own helpers or variants of subsystems is a great way of<br>
isolating ourselves from the rest of the community. I don&#39;t think that&=
#39;s<br>
a good solution in the long run at all.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"></font></span></blockquote><=
/div><br></div><div class=3D"gmail_extra">We have a bunch of patch series t=
hat we resubmit for months and they go exactly nowhere. They don&#39;t die =
because we stop caring, they die because they die. Some of them we even nee=
d to constantly rebase and carry around in drm-tip since our CI would Oops =
or spew WARNIGs all over the place. There&#39;s simply some areas of the ke=
rnel which seem overloaded under patches and no one is willing or able to f=
ix things, and I can&#39;t fix the entire kernel. Nor expect contributors (=
who have much less political weight to throw around than me) to do that and=
 succeed. And we don&#39;t end up with worse code in the drm subsystem, sin=
ce we can still do the refactoring within drm helpers and end up with clean=
 drivers.<br><br></div><div class=3D"gmail_extra">I fully agree that it&#39=
;s not great for the kernel&#39;s future, but when I&#39;m stuck with the o=
ption to get shit done or burning out playing the upstreaming game, the cho=
ice is easy. And in the end I care about open source gfx much more than the=
 kernel, and I think for open source gfx&#39;s success it&#39;s crucial tha=
t we&#39;re welcoming to new contributors and don&#39;t throw up massive ro=
adblocks. Open source gfx is tiny and still far away from world domination,=
 we need _lots_ more people. If that means routing around other subsystems =
for them, I&#39;m all for it.<br></div><div class=3D"gmail_extra">-Daniel<b=
r>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
Daniel Vetter<br>Software Engineer, Intel Corporation<br>+41 (0) 79 365 57 =
48 - <a href=3D"http://blog.ffwll.ch" target=3D"_blank">http://blog.ffwll.c=
h</a></div>
</div></div>

--001a11451bc66739e00547d9cd0b--

--===============1817707101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1817707101==--
