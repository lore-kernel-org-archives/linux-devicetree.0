From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] Re: [PATCH v11 1/7] drm/sun4i: dsi: Fix TCON DRQ
 set bits
Date: Thu, 3 Oct 2019 12:25:32 +0530
Message-ID: <CAMty3ZDZBctSRcgfMTc3moTzrJZXL_S-tKKNKyOa4jUKT8rW+Q@mail.gmail.com>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-2-jagan@amarulasolutions.com> <DB2FB6E5-E4B5-40F4-A05F-9A2303FCA1AE@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB2FB6E5-E4B5-40F4-A05F-9A2303FCA1AE@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Michael Trimarchi <michael@amarulasolutions.com>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 12:21 PM Icenowy Zheng <icenowy@aosc.io> wrote:
>
>
>
> =E4=BA=8E 2019=E5=B9=B410=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
2:45:21, Jagan Teki <jagan@amarulasolutions.com> =E5=86=99=E5=88=B0:
> >The LCD timing definitions between Linux DRM vs Allwinner are
> >different,
> >below diagram shows this clear differences.
> >
> >           Active                 Front           Sync           Back
> >           Region                 Porch                          Porch
> ><-----------------------><----------------><--------------><------------=
-->
> >  //////////////////////|
> > ////////////////////// |
> >//////////////////////  |..................
> >................
> >                                           ________________
> ><----- [hv]display ----->
> ><------------- [hv]sync_start ------------>
> ><--------------------- [hv]sync_end ---------------------->
> ><-------------------------------- [hv]total
> >------------------------------>
> >
> ><----- lcd_[xy] -------->                <- lcd_[hv]spw ->
> >                                         <---------- lcd_[hv]bp --------=
->
> ><-------------------------------- lcd_[hv]t
> >------------------------------>
> >
> >The DSI driver misinterpreted the hbp term from the BSP code to refer
> >only to the backporch, when in fact it was backporch + sync. Thus the
> >driver incorrectly used the horizontal front porch plus sync in its
> >calculation of the DRQ set bit value, when it should not have included
> >the sync timing.
> >
> >Including additional sync timings leads to flip_done timed out as:
>
> I don't think attaching this error infomation is useful at all.

Since the error would be common irrespective of panels and it would
trigger from dsi controller, I thought this would be useful for
reference. I have had this conversation in previous version changes,
so I have added it. let me know if have any comments.
