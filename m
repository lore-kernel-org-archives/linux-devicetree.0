From: Daniel Kurtz <djkurtz@google.com>
Subject: Re: [PATCH v11 0/12] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Sat, 15 Nov 2014 13:42:35 +0800
Message-ID: <CAGS+omBuA=K3Q5JevTi6Upviud_c_OFphjuBr5KsDC_2oW5vRg@mail.gmail.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
 <1415972231-8283-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0047331686=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1415972231-8283-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, dri-devel <dri-devel@lists.freedesktop.org>, Yakir Yang <ykk@rock-chips.com>, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Xu Jianqun <jay.xu@rock-chips.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, rmk+kernel@arm.linux.org.uk, "mark.yao@rock-chips.com" <mark.yao@rock-chips.com>, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak>
List-Id: devicetree@vger.kernel.org

--===============0047331686==
Content-Type: multipart/alternative; boundary=001a11339ffa96c6c40507df376c

--001a11339ffa96c6c40507df376c
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 14, 2014 at 9:37 PM, Andy Yan <andy.yan@rock-chips.com> wrote:

>
> We found Freescale imx6 and Rockchip rk3288 and Ingenic JZ4780
> (Xburst/MIPS)
> use the interface compatible Designware HDMI IP, but they also have some
> lightly differences, such as phy pll configuration, register width(imx hdmi
> register is one byte, but rk3288 is 4 bytes width and can only be accessed
> by word), 4K support(imx6 doesn't support 4k, but rk3288 does), and HDMI2.0
> support.
>
> To reuse the imx-hdmi driver, we make this patch set:
> (1): fix some CodingStyle warning to make checkpatch happy
> (2): split out imx-soc code from imx-hdmi to dw_hdmi-imx.c
> (3): move imx-hdmi to bridge/dw-hdmi, and convert it to a drm_bridge driver
> (4): add rockchip rk3288 platform specific code dw_hdmi-rockchip.c
>
> Changes in v11:
> - rearrange the patch order
> - squash patch  <split some phy configuration to platform driver>
> - split some modification form patch <dw_hdmi: add rk3288 support>
>
> Changes in v10:
> - split generic dw_hdmi.c improvements from patch#11 (add rk3288 support)
> - add more display mode support mpll configuration for rk3288
>
> Changes in v9:
> - move some phy configuration to platform driver
>
> Changes in v8:
> - correct some spelling mistake
> - modify ddc-i2c-bus and interrupt description
> - Add documentation for rockchip dw hdmi
>
> Changes in v7:
> - remove unused variables from structure dw_hdmi
> - remove a wrong modification
> - add copyrights for dw_hdmi-imx.c
>
> Changes in v6:
> - rearrange the patch order
> - move some modification from patch#5
> - move some modification to  patch#6
> - refactor register access without reg_shift
>
> Changes in v5:
> - refactor reg-io-width
>
> Changes in v4:
> - fix checkpatch CHECK
> - defer probe ddc i2c adapter
>
> Changes in v3:
> - split multi-register access to one indepent patch
>
> Changes in v2:
> - use git format -M to generate these patch
>
> Andy Yan (11):
>   staging: imx-drm: imx-hdmi: make checkpatch happy
>   staging: imx-drm: imx-hdmi: return defer if can't get ddc i2c adapter
>   staging: imx-drm: imx-hdmi: split imx soc specific code from imx-hdmi
>   staging: imx-drm: imx-hdmi: move imx-hdmi to bridge/dw_hdmi
>   dt-bindings: add document for dw_hdmi
>   drm: bridge/dw_hdmi: add support for multi-byte register width access
>   drm: bridge/dw_hdmi: add mode_valid support
>   drm: bridge/dw_hdmi: clear i2cmphy_stat0 reg in hdmi_phy_wait_i2c_done
>   drm: bridge/dw_hdmi: add function dw_hdmi_phy_enable_spare
>   dt-bindings: Add documentation for rockchip dw hdmi
>   drm: bridge/dw_hdmi: add rockchip rk3288 support
>

Patch 1 & 2 are:

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>

I think these first two are ready (or will be, after a small nit fix to #2).

Since they are independent of the imx/dw_hdmi split, can we get them
accepted first, to help shrink Andy's patch set?

Thanks,
-djk



>
> Yakir Yang (1):
>   drm: bridge/dw_hdmi: convert dw-hdmi to drm_bridge mode
>
>  .../devicetree/bindings/drm/bridge/dw_hdmi.txt     |  40 ++
>  .../devicetree/bindings/video/dw_hdmi-rockchip.txt |  43 ++
>  drivers/gpu/drm/bridge/Kconfig                     |   5 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  .../imx-hdmi.c => gpu/drm/bridge/dw_hdmi.c}        | 762
> +++++++++------------
>  .../imx-hdmi.h => gpu/drm/bridge/dw_hdmi.h}        |   8 +-
>  drivers/gpu/drm/rockchip/Kconfig                   |  10 +
>  drivers/gpu/drm/rockchip/Makefile                  |   2 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 355 ++++++++++
>  drivers/staging/imx-drm/Kconfig                    |   1 +
>  drivers/staging/imx-drm/Makefile                   |   2 +-
>  drivers/staging/imx-drm/dw_hdmi-imx.c              | 274 ++++++++
>  include/drm/bridge/dw_hdmi.h                       |  60 ++
>  13 files changed, 1138 insertions(+), 425 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
>  create mode 100644
> Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt
>  rename drivers/{staging/imx-drm/imx-hdmi.c => gpu/drm/bridge/dw_hdmi.c}
> (70%)
>  rename drivers/{staging/imx-drm/imx-hdmi.h => gpu/drm/bridge/dw_hdmi.h}
> (99%)
>  create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>  create mode 100644 drivers/staging/imx-drm/dw_hdmi-imx.c
>  create mode 100644 include/drm/bridge/dw_hdmi.h
>
> --
> 1.9.1
>
>


-- 
Daniel Kurtz | Software Engineer | djkurtz@google.com | 650.204.0722

--001a11339ffa96c6c40507df376c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Nov 14, 2014 at 9:37 PM, Andy Yan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andy.yan@rock-chips.com" target=3D"_blank">andy.yan@rock-chips.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><span class=3D""><br>
We found Freescale imx6 and Rockchip rk3288 and Ingenic JZ4780 (Xburst/MIPS=
)<br>
use the interface compatible Designware HDMI IP, but they also have some<br=
>
lightly differences, such as phy pll configuration, register width(imx hdmi=
<br>
register is one byte, but rk3288 is 4 bytes width and can only be accessed<=
br>
by word), 4K support(imx6 doesn&#39;t support 4k, but rk3288 does), and HDM=
I2.0<br>
support.<br>
<br>
To reuse the imx-hdmi driver, we make this patch set:<br>
(1): fix some CodingStyle warning to make checkpatch happy<br>
(2): split out imx-soc code from imx-hdmi to dw_hdmi-imx.c<br>
(3): move imx-hdmi to bridge/dw-hdmi, and convert it to a drm_bridge driver=
<br>
(4): add rockchip rk3288 platform specific code dw_hdmi-rockchip.c<br>
<br>
</span>Changes in v11:<br>
<span class=3D"">- rearrange the patch order<br>
</span>- squash patch=C2=A0 &lt;split some phy configuration to platform dr=
iver&gt;<br>
- split some modification form patch &lt;dw_hdmi: add rk3288 support&gt;<br=
>
<br>
Changes in v10:<br>
- split generic dw_hdmi.c improvements from patch#11 (add rk3288 support)<b=
r>
<span class=3D"">- add more display mode support mpll configuration for rk3=
288<br>
<br>
Changes in v9:<br>
- move some phy configuration to platform driver<br>
<br>
Changes in v8:<br>
- correct some spelling mistake<br>
- modify ddc-i2c-bus and interrupt description<br>
- Add documentation for rockchip dw hdmi<br>
<br>
Changes in v7:<br>
- remove unused variables from structure dw_hdmi<br>
- remove a wrong modification<br>
- add copyrights for dw_hdmi-imx.c<br>
<br>
Changes in v6:<br>
- rearrange the patch order<br>
</span>- move some modification from patch#5<br>
<span class=3D"">- move some modification to=C2=A0 patch#6<br>
- refactor register access without reg_shift<br>
<br>
</span><span class=3D"">Changes in v5:<br>
- refactor reg-io-width<br>
<br>
Changes in v4:<br>
- fix checkpatch CHECK<br>
- defer probe ddc i2c adapter<br>
<br>
Changes in v3:<br>
</span>- split multi-register access to one indepent patch<br>
<span class=3D""><br>
Changes in v2:<br>
- use git format -M to generate these patch<br>
<br>
</span>Andy Yan (11):<br>
<span class=3D"">=C2=A0 staging: imx-drm: imx-hdmi: make checkpatch happy<b=
r>
=C2=A0 staging: imx-drm: imx-hdmi: return defer if can&#39;t get ddc i2c ad=
apter<br>
=C2=A0 staging: imx-drm: imx-hdmi: split imx soc specific code from imx-hdm=
i<br>
=C2=A0 staging: imx-drm: imx-hdmi: move imx-hdmi to bridge/dw_hdmi<br>
</span><span class=3D"">=C2=A0 dt-bindings: add document for dw_hdmi<br>
</span>=C2=A0 drm: bridge/dw_hdmi: add support for multi-byte register widt=
h access<br>
=C2=A0 drm: bridge/dw_hdmi: add mode_valid support<br>
<span class=3D"">=C2=A0 drm: bridge/dw_hdmi: clear i2cmphy_stat0 reg in hdm=
i_phy_wait_i2c_done<br>
</span>=C2=A0 drm: bridge/dw_hdmi: add function dw_hdmi_phy_enable_spare<br=
>
<div class=3D""><div class=3D"h5">=C2=A0 dt-bindings: Add documentation for=
 rockchip dw hdmi<br>
=C2=A0 drm: bridge/dw_hdmi: add rockchip rk3288 support<br></div></div></bl=
ockquote><div><br></div><div><div>Patch 1 &amp; 2 are:</div><div><br></div>=
<div>Reviewed-by: Daniel Kurtz &lt;<a href=3D"mailto:djkurtz@chromium.org">=
djkurtz@chromium.org</a>&gt;</div><div><br></div><div>I think these first t=
wo are ready (or will be, after a small nit fix to #2).</div><div><br></div=
><div>Since they are independent of the imx/dw_hdmi split, can we get them =
accepted first, to help shrink Andy&#39;s patch set?</div><div><br></div><d=
iv>Thanks,</div><div>-djk</div></div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding=
-left:1ex"><div class=3D""><div class=3D"h5">
<br>
Yakir Yang (1):<br>
=C2=A0 drm: bridge/dw_hdmi: convert dw-hdmi to drm_bridge mode<br>
<br>
=C2=A0.../devicetree/bindings/drm/bridge/dw_hdmi.txt=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 40 ++<br>
=C2=A0.../devicetree/bindings/video/dw_hdmi-rockchip.txt |=C2=A0 43 ++<br>
=C2=A0drivers/gpu/drm/bridge/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0drivers/gpu/drm/bridge/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../imx-hdmi.c =3D&gt; gpu/drm/bridge/dw_hdmi.c}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 762 +++++++++------------<br>
=C2=A0.../imx-hdmi.h =3D&gt; gpu/drm/bridge/dw_hdmi.h}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0drivers/gpu/drm/rockchip/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
=C2=A0drivers/gpu/drm/rockchip/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 355 ++++++++++<br>
=C2=A0drivers/staging/imx-drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/staging/imx-drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/staging/imx-drm/dw_hdmi-imx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 274 ++++++++<br>
=C2=A0include/drm/bridge/dw_hdmi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 60 ++<br>
=C2=A013 files changed, 1138 insertions(+), 425 deletions(-)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw_hd=
mi.txt<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/video/dw_hdmi-ro=
ckchip.txt<br>
=C2=A0rename drivers/{staging/imx-drm/imx-hdmi.c =3D&gt; gpu/drm/bridge/dw_=
hdmi.c} (70%)<br>
=C2=A0rename drivers/{staging/imx-drm/imx-hdmi.h =3D&gt; gpu/drm/bridge/dw_=
hdmi.h} (99%)<br>
=C2=A0create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c<br>
=C2=A0create mode 100644 drivers/staging/imx-drm/dw_hdmi-imx.c<br>
=C2=A0create mode 100644 include/drm/bridge/dw_hdmi.h<br>
<br>
--<br>
1.9.1<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature"><span style=3D"font-family:&#39;Times New Ro=
man&#39;;font-size:medium"><div style=3D"line-height:1.5em;padding-top:10px=
;margin-top:10px;color:rgb(85,85,85);font-family:sans-serif;font-size:small=
"><span style=3D"border-width:2px 0px 0px;border-style:solid;border-color:r=
gb(213,15,37);padding-top:2px;margin-top:2px">Daniel Kurtz=C2=A0|</span><sp=
an style=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(51=
,105,232);padding-top:2px;margin-top:2px">=C2=A0Software Engineer=C2=A0|</s=
pan><span style=3D"border-width:2px 0px 0px;border-style:solid;border-color=
:rgb(0,153,57);padding-top:2px;margin-top:2px">=C2=A0<a href=3D"mailto:djku=
rtz@google.com" target=3D"_blank">djkurtz@google.com</a>=C2=A0|</span><span=
 style=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(238,=
178,17);padding-top:2px;margin-top:2px">=C2=A0<span id=3D"gc-number-1" clas=
s=3D"" title=3D"Call with Google Voice">650.204.0722</span></span></div></s=
pan></div>
</div></div>

--001a11339ffa96c6c40507df376c--

--===============0047331686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0047331686==--
