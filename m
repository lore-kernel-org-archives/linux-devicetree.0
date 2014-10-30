From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 0/9] Renesas R-Car DU HDMI support
Date: Thu, 30 Oct 2014 20:29:22 +0900
Message-ID: <CAGv-rZm=0rvvnO1cgBp0ZNdu0PvA-nwh6Nk05LSyTE=0vg0ipA@mail.gmail.com>
References: <1414337068-28664-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAPM=9tzCRxwLqJTk3kWM47jVUUqyMNKBnm1h2RG3N0zGiMxivg@mail.gmail.com>
 <11054192.lJRMYJX3F4@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0205026700=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <11054192.lJRMYJX3F4@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

--===============0205026700==
Content-Type: multipart/alternative; boundary=001a11331dfa220fae0506a231f6

--001a11331dfa220fae0506a231f6
Content-Type: text/plain; charset=UTF-8

2014/10/30 20:05 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>:
>
> On Tuesday 28 October 2014 15:30:05 Dave Airlie wrote:
> > > The last patch instantiates the HDMI encoder in the Koelsch board DT
file
> > > and connects it to the DU output.
> > >
> > > The patch series depends on Koelsch DU DT enablement (scheduled for
merge
> > > in v3.19-rc1). Dave, I'd like to get this merged in v3.19-rc1, how
would
> > > you like to proceed ? Could it go through Simon's Renesas tree ?
There's
> > > a small risk of conflict in drivers/gpu/drm/drm_edid.c,
> > > include/drm/drm_edid.h, drivers/gpu/drm/i2c/Kconfig and
> > > drivers/gpu/drm/i2c/Makefile. Simon, could you alternatively provide a
> > > stable branch with the required dependencies ?
> >
> > I'd probably like to take the drm patches into drm-next first, then
> > maybe get a stable branch from Simon I could use to base the rest on.
>
> Simon, I believe that would be the dt-du-for-v3.19 branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git
>
> Is it correct ?

Sorry I shuffled things around a bit and what you need should now be in the
dt-for-v3.19 branch. I hope what is there now is stable. But I'd appreciate
it if you could wait a few more days.

>
> > > Changes since v2:
> > >
> > > - Name arguments to get_edid_block()
> > >
> > > Changes since v1:
> > >
> > > - Dropped Philipp Zabel's OF graph patches (the rcar-du-drm driver
will be
> > >   udpated to use for_each_endpoint_of_node when the implementation
hits
> > >   upstream)
> > > - adv7511: Clarify the adi,input-format DT property documentation
> > > - adv7511: Use map array to convert input style to hardware value
> > > - adv7511: Fixed typos
> > >
> > > For ease of testing and review I've pushed this series and its
> > > dependencies to a git branch on
> > >
> > >         git://linuxtv.org/pinchartl/fbdev.git drm/du/adv7511
> > >
> > > Cc: devicetree@vger.kernel.org
> > > Cc: Dave Airlie <airlied@gmail.com>
> > > Cc: Lars-Peter Clausen <lars@metafoo.de>
> > > Cc: Simon <horms@verge.net.au>
> > >
> > > Lars-Peter Clausen (2):
> > >   drm: Decouple EDID parsing from I2C adapter
> > >   drm: Add adv7511 encoder driver
> > >
> > > Laurent Pinchart (7):
> > >   drm: rcar-du: Remove platform data support
> > >   drm: rcar-du: Pass the encoder DT node to rcar_du_encoder_init()
> > >   drm: rcar-du: Replace direct DRM encoder access with cast macro
> > >   drm: rcar-du: Replace drm_encoder with drm_slave_encoder
> > >   drm: rcar-du: Add HDMI encoder and connector support
> > >   video: Add ADV751[13] DT bindings documentation
> > >   ARM: shmobile: koelsch: Add DU HDMI output support
> > >
> > >  .../devicetree/bindings/video/adi,adv7511.txt      |   88 ++
> > >  arch/arm/boot/dts/r8a7791-koelsch.dts              |   50 +-
> > >  drivers/gpu/drm/drm_edid.c                         |   27 +-
> > >  drivers/gpu/drm/i2c/Kconfig                        |    6 +
> > >  drivers/gpu/drm/i2c/Makefile                       |    2 +
> > >  drivers/gpu/drm/i2c/adv7511.c                      | 1010
+++++++++++++++
> > >  drivers/gpu/drm/i2c/adv7511.h                      |  289 ++++++
> > >  drivers/gpu/drm/rcar-du/Kconfig                    |   11 +-
> > >  drivers/gpu/drm/rcar-du/Makefile                   |    2 +
> > >  drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   10 +-
> > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    4 +-
> > >  drivers/gpu/drm/rcar-du/rcar_du_drv.h              |    2 -
> > >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   45 +-
> > >  drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   23 +-
> > >  drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c          |  118 +++
> > >  drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h          |   31 +
> > >  drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |  151 +++
> > >  drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h          |   35 +
> > >  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   53 +-
> > >  drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |   31 +-
> > >  drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h          |    2 -
> > >  drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |    1 -
> > >  drivers/gpu/drm/rcar-du/rcar_du_vgacon.c           |    5 +-
> > >  include/drm/drm_edid.h                             |    5 +
> > >  include/linux/platform_data/rcar-du.h              |   74 --
> > >  25 files changed, 1894 insertions(+), 181 deletions(-)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/video/adi,adv7511.txt
> > >  create mode 100644 drivers/gpu/drm/i2c/adv7511.c
> > >  create mode 100644 drivers/gpu/drm/i2c/adv7511.h
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
> > >  delete mode 100644 include/linux/platform_data/rcar-du.h
>
> --
> Regards,
>
> Laurent Pinchart
>

--001a11331dfa220fae0506a231f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
2014/10/30 20:05 &quot;Laurent Pinchart&quot; &lt;<a href=3D"mailto:laurent=
.pinchart@ideasonboard.com">laurent.pinchart@ideasonboard.com</a>&gt;:<br>
&gt;<br>
&gt; On Tuesday 28 October 2014 15:30:05 Dave Airlie wrote:<br>
&gt; &gt; &gt; The last patch instantiates the HDMI encoder in the Koelsch =
board DT file<br>
&gt; &gt; &gt; and connects it to the DU output.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The patch series depends on Koelsch DU DT enablement (schedu=
led for merge<br>
&gt; &gt; &gt; in v3.19-rc1). Dave, I&#39;d like to get this merged in v3.1=
9-rc1, how would<br>
&gt; &gt; &gt; you like to proceed ? Could it go through Simon&#39;s Renesa=
s tree ? There&#39;s<br>
&gt; &gt; &gt; a small risk of conflict in drivers/gpu/drm/drm_edid.c,<br>
&gt; &gt; &gt; include/drm/drm_edid.h, drivers/gpu/drm/i2c/Kconfig and<br>
&gt; &gt; &gt; drivers/gpu/drm/i2c/Makefile. Simon, could you alternatively=
 provide a<br>
&gt; &gt; &gt; stable branch with the required dependencies ?<br>
&gt; &gt;<br>
&gt; &gt; I&#39;d probably like to take the drm patches into drm-next first=
, then<br>
&gt; &gt; maybe get a stable branch from Simon I could use to base the rest=
 on.<br>
&gt;<br>
&gt; Simon, I believe that would be the dt-du-for-v3.19 branch of<br>
&gt; git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/horms/=
renesas.git">git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git</a><=
br>
&gt;<br>
&gt; Is it correct ?</p>
<p dir=3D"ltr">Sorry I shuffled things around a bit and what you need shoul=
d now be in the dt-for-v3.19 branch. I hope what is there now is stable. Bu=
t I&#39;d appreciate it if you could wait a few more days.</p>
<p dir=3D"ltr">&gt;<br>
&gt; &gt; &gt; Changes since v2:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - Name arguments to get_edid_block()<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Changes since v1:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - Dropped Philipp Zabel&#39;s OF graph patches (the rcar-du-=
drm driver will be<br>
&gt; &gt; &gt;=C2=A0 =C2=A0udpated to use for_each_endpoint_of_node when th=
e implementation hits<br>
&gt; &gt; &gt;=C2=A0 =C2=A0upstream)<br>
&gt; &gt; &gt; - adv7511: Clarify the adi,input-format DT property document=
ation<br>
&gt; &gt; &gt; - adv7511: Use map array to convert input style to hardware =
value<br>
&gt; &gt; &gt; - adv7511: Fixed typos<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For ease of testing and review I&#39;ve pushed this series a=
nd its<br>
&gt; &gt; &gt; dependencies to a git branch on<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://lin=
uxtv.org/pinchartl/fbdev.git">linuxtv.org/pinchartl/fbdev.git</a> drm/du/ad=
v7511<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cc: <a href=3D"mailto:devicetree@vger.kernel.org">devicetree=
@vger.kernel.org</a><br>
&gt; &gt; &gt; Cc: Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com">air=
lied@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Lars-Peter Clausen &lt;<a href=3D"mailto:lars@metafoo.de=
">lars@metafoo.de</a>&gt;<br>
&gt; &gt; &gt; Cc: Simon &lt;<a href=3D"mailto:horms@verge.net.au">horms@ve=
rge.net.au</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Lars-Peter Clausen (2):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0drm: Decouple EDID parsing from I2C adapter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0drm: Add adv7511 encoder driver<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Laurent Pinchart (7):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0drm: rcar-du: Remove platform data support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0drm: rcar-du: Pass the encoder DT node to rcar_d=
u_encoder_init()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0drm: rcar-du: Replace direct DRM encoder access =
with cast macro<br>
&gt; &gt; &gt;=C2=A0 =C2=A0drm: rcar-du: Replace drm_encoder with drm_slave=
_encoder<br>
&gt; &gt; &gt;=C2=A0 =C2=A0drm: rcar-du: Add HDMI encoder and connector sup=
port<br>
&gt; &gt; &gt;=C2=A0 =C2=A0video: Add ADV751[13] DT bindings documentation<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0ARM: shmobile: koelsch: Add DU HDMI output suppo=
rt<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 .../devicetree/bindings/video/adi,adv7511.txt=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A088 ++<br>
&gt; &gt; &gt;=C2=A0 arch/arm/boot/dts/r8a7791-koelsch.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A050 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/drm_edid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A027 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 +=
<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/i2c/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2=
 +<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/i2c/adv7511.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1010 +++++++++++++++=
<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/i2c/adv7511.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 289 ++++++<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/Kconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A011 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/Makefile=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_crtc.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_drv.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_drv.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 -<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_encoder.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A045 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_encoder.h=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A023 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 118 +++<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A031 +<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 151 +++<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A035 +<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_kms.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A053 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A031 +-<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 -<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 -<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +-<br>
&gt; &gt; &gt;=C2=A0 include/drm/drm_edid.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 5 +<br>
&gt; &gt; &gt;=C2=A0 include/linux/platform_data/rcar-du.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A074 --<br>
&gt; &gt; &gt;=C2=A0 25 files changed, 1894 insertions(+), 181 deletions(-)=
<br>
&gt; &gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; &gt;=C2=A0 Documentation/devicetree/bindings/video/adi,adv7511.tx=
t<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/gpu/drm/i2c/adv7511.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/gpu/drm/i2c/adv7511.h<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdm=
icon.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdm=
icon.h<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdm=
ienc.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdm=
ienc.h<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 include/linux/platform_data/rcar-du=
.h<br>
&gt;<br>
&gt; --<br>
&gt; Regards,<br>
&gt;<br>
&gt; Laurent Pinchart<br>
&gt;<br>
</p>

--001a11331dfa220fae0506a231f6--

--===============0205026700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0205026700==--
