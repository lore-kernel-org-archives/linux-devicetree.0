From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add maintainer for arm komeda driver
Date: Mon, 24 Dec 2018 14:05:43 +0100
Message-ID: <CAKMK7uGt63=_KuECQc2ivuSZb8gMD1=6n0=Q2bcvzCEPo84uFw@mail.gmail.com>
References: <20181221095757.15510-1-james.qian.wang@arm.com>
 <20181221095757.15510-10-james.qian.wang@arm.com> <20181224123314.GK22341@e110455-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181224123314.GK22341@e110455-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>, "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>, Brian Starkey <Brian.Starkey@arm.com>, "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>, "thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>, Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>, "Jin Gao (Arm Technology China)" <Jin.Gao@arm.com>, "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>, nd <nd@arm.com>, "malidp@foss.arm.com" <malidp@foss.arm.com>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "maxime.ripard@bootlin.com" <maxime.ripar>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 24, 2018 at 1:33 PM Liviu Dudau <Liviu.Dudau@arm.com> wrote:
>
> On Fri, Dec 21, 2018 at 10:01:06AM +0000, james qian wang (Arm Technology=
 China) wrote:
> > v2: Adjusted the position of KOMEDA by alphabetical order
> >
> > Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>
>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>
> Best regards,
> Liviu
>
> > ---
> >  MAINTAINERS | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 254b7b267731..e48c2e5fd29f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1124,6 +1124,15 @@ S:     Supported
> >  F:   drivers/gpu/drm/arm/hdlcd_*
> >  F:   Documentation/devicetree/bindings/display/arm,hdlcd.txt
> >
> > +ARM KOMEDA DRM-KMS DRIVER
> > +M:   James (Qian) Wang <james.qian.wang@arm.com>
> > +M:   Mali DP Maintainers <malidp@foss.arm.com>
> > +S:   Supported
> > +F:   drivers/gpu/drm/arm/display/include/
> > +F:   drivers/gpu/drm/arm/display/komeda/
> > +F:   Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> > +F:   Documentation/gpu/komeda-kms.rst

Mentioning the git tree would be good. And I guess you'll do some kind
of group maintainership? Probably still good if you send out a
dedicated/topic pull request for this new driver, but from then on
it's all in the same git repo.
-Daniel

> > +
> >  ARM MALI-DP DRM DRIVER
> >  M:   Liviu Dudau <liviu.dudau@arm.com>
> >  M:   Brian Starkey <brian.starkey@arm.com>
> > --
> > 2.17.1
> >
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
