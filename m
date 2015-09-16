From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: [PATCH RFC 6/8] drm: hisilicon: Add support for fbdev
Date: Wed, 16 Sep 2015 17:48:56 +0800
Message-ID: <CAGd==05f+XVg4ZSDihftjB2wcOGkAou=AxXYXB+1=ckM2J6EBQ@mail.gmail.com>
References: <1442309834-21420-1-git-send-email-kong.kongxinwei@hisilicon.com>
 <1442309834-21420-7-git-send-email-kong.kongxinwei@hisilicon.com>
 <55F862A1.30308@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0208114624=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55F862A1.30308@kernel.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linuxarm@huawei.com, dri-devel@lists.freedesktop.org, Haojian Zhuang <haojian.zhuang@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, "Yanglong (James)" <james.yanglong@hisilicon.com>, Yinshengbao <yinshengbao@hisilicon.com>, xuyiping@hisilicon.com, corbet@lwn.net, Min Yi <yimin@huawei.com>, xuwei5@hisilicon.com, Wang Fei <w.f@huawei.com>, qijiwen@hisilicon.com, devicetree@vger.kernel.org, bintian.wang@huawei.com, puck.chen@hisilicon.com, Yanhaifeng <yanhaifeng@hisilicon.com>, Dechun Fang <fangdechun@hisilicon.com>, linux-arm-kernel@lists.infradead.org, Andy Green <andy.green@linaro.org>, gongyu@hisilicon.com, linux-kernel@vger.kernel.org, Yangminglei <ml.yang@hisilicon.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>
List-Id: devicetree@vger.kernel.org

--===============0208114624==
Content-Type: multipart/alternative; boundary=001a113cc51608a83a051fda354b

--001a113cc51608a83a051fda354b
Content-Type: text/plain; charset=UTF-8

On 16 September 2015 at 02:25, Rob Herring <robh@kernel.org> wrote:
Hi Rob, thanks a lot for reply:-)

On 09/15/2015 04:37 AM, Xinwei Kong wrote:
> > If you config DRM_HISI_FBDEV optional, this patch will only support fbdev
> > mode while also supporting double buffer.
>
> This is a lot of duplicated code from CMA fbdev. Is double buffering the
> only reason why CMA fbdev can't be used or are there some other
> constraints?

Yes, double buffering is the main reason we rewrite our own fbdev.
CMA fbdev only create one buffer. But we need at least  double buffer for
running Android with fbdev.

Double buffering in fbdev has always been a hack, so I'm
> guessing that is not a feature that should be added here.
>
> If so, I think it is hard to be accepted for my cma fbdev patch to support
multi buffer.
This early week, I have sent a cma fbdev patch for supporting this. The
subject is
"[PATCH] drm/cma-helper: Add multi buffer support for cma fbdev".
We do have a strong will to support this feature. I described the reason in
the patch. Please take a look for me. Thank you very much.

-Xinliang

Rob
>
> > Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> > Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > Signed-off-by: Andy Green <andy.green@linaro.org>
> > Signed-off-by: Jiwen Qi <qijiwen@hisilicon.com>
> > Signed-off-by: Yu Gong <gongyu@hisilicon.com>
> > ---
> >  drivers/gpu/drm/hisilicon/Kconfig              |  13 +
> >  drivers/gpu/drm/hisilicon/Makefile             |   3 +-
> >  drivers/gpu/drm/hisilicon/hisi_drm_connector.c |   4 +
> >  drivers/gpu/drm/hisilicon/hisi_drm_drv.c       |   9 +
> >  drivers/gpu/drm/hisilicon/hisi_drm_dsi.c       |  15 +
> >  drivers/gpu/drm/hisilicon/hisi_drm_fb.h        |   5 +
> >  drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c     | 395
> +++++++++++++++++++++++++
> >  drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h     |  24 ++
> >  8 files changed, 467 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c
> >  create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h
>
>

--001a113cc51608a83a051fda354b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 16 September 2015 at 02:25, Rob Herring <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt;</spa=
n> wrote:</div><div class=3D"gmail_quote">Hi Rob, thanks a lot for reply:-)=
</div><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"><span>On 09/15/2015 0=
4:37 AM, Xinwei Kong wrote:<br>
&gt; If you config DRM_HISI_FBDEV optional, this patch will only support fb=
dev<br>
&gt; mode while also supporting double buffer.<br>
<br>
</span>This is a lot of duplicated code from CMA fbdev. Is double buffering=
 the<br>
only reason why CMA fbdev can&#39;t be used or are there some other<br>
constraints? </blockquote><div>Yes, double buffering is the main reason we =
rewrite our own fbdev.</div><div>CMA fbdev only create one buffer. But we n=
eed at least =C2=A0double buffer for running Android with fbdev.</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex">Double buffering in fbdev has always been a hack=
, so I&#39;m<br>
guessing that is not a feature that should be added here.<br>
<span><font color=3D"#888888"><br></font></span></blockquote><div>If so, I =
think it is hard to be accepted for my cma fbdev patch to support multi buf=
fer.</div><div>This early week, I have sent a cma fbdev patch for supportin=
g this. The subject is=C2=A0</div><div>&quot;[PATCH] drm/cma-helper: Add mu=
lti buffer support for cma fbdev&quot;.</div><div>We do have a strong will =
to support this feature. I described the reason in the patch. Please take a=
 look for me. Thank you very much.</div><div><br></div><div>-Xinliang</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><span><font color=3D"#888888">
Rob<br>
</font></span><div><div><br>
&gt; Signed-off-by: Xinliang Liu &lt;<a href=3D"mailto:xinliang.liu@linaro.=
org" target=3D"_blank">xinliang.liu@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Xinwei Kong &lt;<a href=3D"mailto:kong.kongxinwei@hisil=
icon.com" target=3D"_blank">kong.kongxinwei@hisilicon.com</a>&gt;<br>
&gt; Signed-off-by: Andy Green &lt;<a href=3D"mailto:andy.green@linaro.org"=
 target=3D"_blank">andy.green@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Jiwen Qi &lt;<a href=3D"mailto:qijiwen@hisilicon.com" t=
arget=3D"_blank">qijiwen@hisilicon.com</a>&gt;<br>
&gt; Signed-off-by: Yu Gong &lt;<a href=3D"mailto:gongyu@hisilicon.com" tar=
get=3D"_blank">gongyu@hisilicon.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/hisilicon/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 13 +<br>
&gt;=C2=A0 drivers/gpu/drm/hisilicon/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_connector.c |=C2=A0 =C2=A04 +=
<br>
&gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_dsi.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 15 +<br>
&gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_fb.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c=C2=A0 =C2=A0 =C2=A0| =
395 +++++++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 24 ++<br>
&gt;=C2=A0 8 files changed, 467 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c<br=
>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h<br=
>
<br>
</div></div></blockquote></div><br></div></div>

--001a113cc51608a83a051fda354b--

--===============0208114624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0208114624==--
