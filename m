From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: [PATCH RFC 6/8] drm: hisilicon: Add support for fbdev
Date: Thu, 17 Sep 2015 20:11:59 +0800
Message-ID: <CAGd==04392iXjzPfj1Qq4Bgd+TX0gzzU83yw_0bfU+OjB4dMiw@mail.gmail.com>
References: <1442309834-21420-1-git-send-email-kong.kongxinwei@hisilicon.com>
 <1442309834-21420-7-git-send-email-kong.kongxinwei@hisilicon.com>
 <55F862A1.30308@kernel.org>
 <CAGd==05f+XVg4ZSDihftjB2wcOGkAou=AxXYXB+1=ckM2J6EBQ@mail.gmail.com>
 <CAF6AEGs1_9JsCfnbW=-PCunyapMGK4EB3eRzRLg9ZCpuQ-NEbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0883816798=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAF6AEGs1_9JsCfnbW=-PCunyapMGK4EB3eRzRLg9ZCpuQ-NEbA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linuxarm@huawei.com, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, "Yanglong (James)" <james.yanglong@hisilicon.com>, Rob Herring <robh@kernel.org>, Yinshengbao <yinshengbao@hisilicon.com>, Yiping Xu <xuyiping@hisilicon.com>, Jonathan Corbet <corbet@lwn.net>, Min Yi <yimin@huawei.com>, xuwei5@hisilicon.com, Wang Fei <w.f@huawei.com>, qijiwen@hisilicon.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, bintian.wang@huawei.com, puck.chen@hisilicon.com, Yanhaifeng <yanhaifeng@hisilicon.com>, Dechun Fang <fangdechun@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andy Green <andy.green@linaro.or>
List-Id: devicetree@vger.kernel.org

--===============0883816798==
Content-Type: multipart/alternative; boundary=001a113cf35672f4c5051ff0527f

--001a113cf35672f4c5051ff0527f
Content-Type: text/plain; charset=UTF-8

On 17 September 2015 at 19:52, Rob Clark <robdclark@gmail.com> wrote:

> On Wed, Sep 16, 2015 at 5:48 AM, Xinliang Liu <xinliang.liu@linaro.org>
> wrote:
> >
> >
> > On 16 September 2015 at 02:25, Rob Herring <robh@kernel.org> wrote:
> > Hi Rob, thanks a lot for reply:-)
> >
> >> On 09/15/2015 04:37 AM, Xinwei Kong wrote:
> >> > If you config DRM_HISI_FBDEV optional, this patch will only support
> >> > fbdev
> >> > mode while also supporting double buffer.
> >>
> >> This is a lot of duplicated code from CMA fbdev. Is double buffering the
> >> only reason why CMA fbdev can't be used or are there some other
> >> constraints?
> >
> > Yes, double buffering is the main reason we rewrite our own fbdev.
> > CMA fbdev only create one buffer. But we need at least  double buffer for
> > running Android with fbdev.
> >
> >> Double buffering in fbdev has always been a hack, so I'm
> >> guessing that is not a feature that should be added here.
> >>
> > If so, I think it is hard to be accepted for my cma fbdev patch to
> support
> > multi buffer.
> > This early week, I have sent a cma fbdev patch for supporting this. The
> > subject is
> > "[PATCH] drm/cma-helper: Add multi buffer support for cma fbdev".
> > We do have a strong will to support this feature. I described the reason
> in
> > the patch. Please take a look for me. Thank you very much.
>
> fwiw, drm_gralloc has support for kms.

We do have a plan to replace fbdev with kms. But it take time.


> Currently it is expected to be
> paired w/ a mesa gpu driver, which might not work for everyone, but I
> suppose the display part of it could be extracted out for a
> gralloc.kms.so for pure sw rendering.. that might be a better
> approach.
>

Yes, I also think kms should be handle in hwc rather than in gralloc.
IMO, gralloc should just handle dma buffer alloc and free.
We have a reference hwc implementation. which will handle kms inside it.
wiki:
https://wiki.linaro.org/BenjaminGaignard/HWComposer_DRM?highlight=%28hwcomposer%2
source code: git://git.linaro.org/people/benjamin.gaignard/hwcomposer.git

Cheers,
-Xinliang


> http://git.android-x86.org/?p=platform/hardware/drm_gralloc.git
>
> BR,
> -R
>
> > -Xinliang
> >
> >> Rob
> >>
> >> > Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> >> > Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> >> > Signed-off-by: Andy Green <andy.green@linaro.org>
> >> > Signed-off-by: Jiwen Qi <qijiwen@hisilicon.com>
> >> > Signed-off-by: Yu Gong <gongyu@hisilicon.com>
> >> > ---
> >> >  drivers/gpu/drm/hisilicon/Kconfig              |  13 +
> >> >  drivers/gpu/drm/hisilicon/Makefile             |   3 +-
> >> >  drivers/gpu/drm/hisilicon/hisi_drm_connector.c |   4 +
> >> >  drivers/gpu/drm/hisilicon/hisi_drm_drv.c       |   9 +
> >> >  drivers/gpu/drm/hisilicon/hisi_drm_dsi.c       |  15 +
> >> >  drivers/gpu/drm/hisilicon/hisi_drm_fb.h        |   5 +
> >> >  drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c     | 395
> >> > +++++++++++++++++++++++++
> >> >  drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h     |  24 ++
> >> >  8 files changed, 467 insertions(+), 1 deletion(-)
> >> >  create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c
> >> >  create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h
> >>
> >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>

--001a113cf35672f4c5051ff0527f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 17 September 2015 at 19:52, Rob Clark <span dir=3D"ltr">&lt;<a href=
=3D"mailto:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><span>On Wed, Sep 16, 2015 at 5:48 AM,=
 Xinliang Liu &lt;<a href=3D"mailto:xinliang.liu@linaro.org" target=3D"_bla=
nk">xinliang.liu@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 16 September 2015 at 02:25, Rob Herring &lt;<a href=3D"mailto:robh@=
kernel.org" target=3D"_blank">robh@kernel.org</a>&gt; wrote:<br>
&gt; Hi Rob, thanks a lot for reply:-)<br>
&gt;<br>
&gt;&gt; On 09/15/2015 04:37 AM, Xinwei Kong wrote:<br>
&gt;&gt; &gt; If you config DRM_HISI_FBDEV optional, this patch will only s=
upport<br>
&gt;&gt; &gt; fbdev<br>
&gt;&gt; &gt; mode while also supporting double buffer.<br>
&gt;&gt;<br>
&gt;&gt; This is a lot of duplicated code from CMA fbdev. Is double bufferi=
ng the<br>
&gt;&gt; only reason why CMA fbdev can&#39;t be used or are there some othe=
r<br>
&gt;&gt; constraints?<br>
&gt;<br>
&gt; Yes, double buffering is the main reason we rewrite our own fbdev.<br>
&gt; CMA fbdev only create one buffer. But we need at least=C2=A0 double bu=
ffer for<br>
&gt; running Android with fbdev.<br>
&gt;<br>
&gt;&gt; Double buffering in fbdev has always been a hack, so I&#39;m<br>
&gt;&gt; guessing that is not a feature that should be added here.<br>
&gt;&gt;<br>
&gt; If so, I think it is hard to be accepted for my cma fbdev patch to sup=
port<br>
&gt; multi buffer.<br>
&gt; This early week, I have sent a cma fbdev patch for supporting this. Th=
e<br>
&gt; subject is<br>
&gt; &quot;[PATCH] drm/cma-helper: Add multi buffer support for cma fbdev&q=
uot;.<br>
&gt; We do have a strong will to support this feature. I described the reas=
on in<br>
&gt; the patch. Please take a look for me. Thank you very much.<br>
<br>
</span>fwiw, drm_gralloc has support for kms.=C2=A0 </blockquote><div>We do=
 have a plan to replace fbdev with kms. But it take time.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:so=
lid;padding-left:1ex">Currently it is expected to be<br>
paired w/ a mesa gpu driver, which might not work for everyone, but I<br>
suppose the display part of it could be extracted out for a<br>
<a href=3D"http://gralloc.kms.so" rel=3D"noreferrer" target=3D"_blank">gral=
loc.kms.so</a> for pure sw rendering.. that might be a better<br>
approach.<br></blockquote><div>=C2=A0</div><div>Yes, I also think kms shoul=
d be handle in hwc rather than in gralloc.</div><div>IMO, gralloc should ju=
st handle dma buffer alloc and free.</div><div>We have a reference hwc impl=
ementation. which will handle kms inside it.</div><div><div style=3D"font-s=
ize:12.8000001907349px">wiki:=C2=A0<a href=3D"https://wiki.linaro.org/Benja=
minGaignard/HWComposer_DRM?highlight=3D%28hwcomposer%2" target=3D"_blank">h=
ttps://wiki.linaro.org/BenjaminGaignard/HWComposer_DRM?highlight=3D%28hwcom=
poser%2</a></div><div style=3D"font-size:12.8000001907349px">source code:=
=C2=A0<span style=3D"color:rgb(51,51,51);font-family:Ubuntu,sans-serif;font=
-size:13px;line-height:20.7999992370605px">git://<a href=3D"http://git.lina=
ro.org/people/benjamin.gaignard/hwcomposer.git" target=3D"_blank">git.linar=
o.org/people/benjamin.gaignard/hwcomposer.git</a></span></div></div><div st=
yle=3D"font-size:12.8000001907349px"><br></div><div style=3D"font-size:12.8=
000001907349px"><span style=3D"font-size:12.8000001907349px">Cheers</span>,=
</div><div style=3D"font-size:12.8000001907349px">-Xinliang</div><div style=
=3D"font-size:12.8000001907349px"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-colo=
r:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<br>
<a href=3D"http://git.android-x86.org/?p=3Dplatform/hardware/drm_gralloc.gi=
t" rel=3D"noreferrer" target=3D"_blank">http://git.android-x86.org/?p=3Dpla=
tform/hardware/drm_gralloc.git</a><br>
<br>
BR,<br>
-R<br>
<span><br>
&gt; -Xinliang<br>
&gt;<br>
&gt;&gt; Rob<br>
&gt;&gt;<br>
&gt;&gt; &gt; Signed-off-by: Xinliang Liu &lt;<a href=3D"mailto:xinliang.li=
u@linaro.org" target=3D"_blank">xinliang.liu@linaro.org</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Xinwei Kong &lt;<a href=3D"mailto:kong.kongxin=
wei@hisilicon.com" target=3D"_blank">kong.kongxinwei@hisilicon.com</a>&gt;<=
br>
&gt;&gt; &gt; Signed-off-by: Andy Green &lt;<a href=3D"mailto:andy.green@li=
naro.org" target=3D"_blank">andy.green@linaro.org</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Jiwen Qi &lt;<a href=3D"mailto:qijiwen@hisilic=
on.com" target=3D"_blank">qijiwen@hisilicon.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Yu Gong &lt;<a href=3D"mailto:gongyu@hisilicon=
.com" target=3D"_blank">gongyu@hisilicon.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/hisilicon/Kconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/hisilicon/Makefile=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_connector.c |=C2=A0 =
=C2=A04 +<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_drv.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_dsi.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 +<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_fb.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c=C2=A0 =C2=A0=
 =C2=A0| 395<br>
&gt;&gt; &gt; +++++++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 24 ++<br>
&gt;&gt; &gt;=C2=A0 8 files changed, 467 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_f=
bdev.c<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_f=
bdev.h<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
</span>&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.freedesktop.org/mailman/lis=
tinfo/dri-devel</a><br>
&gt;<br>
</blockquote></div><br></div></div>

--001a113cf35672f4c5051ff0527f--

--===============0883816798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0883816798==--
