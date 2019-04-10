From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-nitrogen6_max: Disable LVDS channels
Date: Wed, 10 Apr 2019 09:35:50 +0200
Message-ID: <CAAMH-ys-S7miJFCAY9bxrDGTPPT7e7c430-_4+edH8scV_qTwA@mail.gmail.com>
References: <20190408175319.9106-1-robert.foss@collabora.com>
 <CAOMZO5DAvaibi5r9CXzk8qbE7XHiHJHHvi9rcq_BJdx7aRVgoQ@mail.gmail.com> <4fd506a1-c961-0569-6d39-283758f363d9@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4fd506a1-c961-0569-6d39-283758f363d9@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Foss <robert.foss@collabora.com>
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Troy Kisky <troy.kisky@boundarydevices.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Apr 9, 2019 at 2:07 AM Robert Foss <robert.foss@collabora.com> wrote:
>
> Hey Fabio,
>
> On 4/8/19 10:37 PM, Fabio Estevam wrote:
> > Hi Robert,
> >
> > [Adding Gary]

Adding Troy, I'm no longer a full-time employee at Boundary Devices.

> > On Mon, Apr 8, 2019 at 2:54 PM Robert Foss <robert.foss@collabora.com> wrote:
> >>
> >> If a LVDS device is not connected, having the LVDS channels
> >> enabled will prevent imx-ldb from probing correctly even
> >> if other CRTCs are connected.
> >>
> >> Signed-off-by: Robert Foss <robert.foss@collabora.com>
> >> ---
> >>   arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
> >> index 39200e5dc896..5b413cf4c250 100644
> >> --- a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
> >> +++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
> >> @@ -703,7 +703,7 @@
> >>          status = "okay";
> >>
> >>          lvds-channel@0 {
> >> -               status = "okay";
> >> +               status = "disabled";
> >>
> >>                  port@4 {
> >>                          reg = <4>;
> >> @@ -715,7 +715,7 @@
> >>          };
> >>
> >>          lvds-channel@1 {
> >> -               status = "okay";
> >> +               status = "disabled";
> >
> > I am not sure I understood what you are trying to fix.
>
> If CONFIG_DRM_IMX_LDB is enabled, LVDS DT channels are enabled
> and no LVDS-panels are connected the imx-ldb driver will
> fail to bind.
>
> This is a problem, since it will prevent other actually connected
> display output from being used, even if they bind properly.
>
> >
> > Could you please share some logs when imx-ldb fails to probe correctly?
>
>
> [    2.119563] component_bind_all() trying to bind: ldb
> [    2.124600] imx-drm display-subsystem: binding ldb (ops imx_ldb_ops)
> [    2.146169] drm_of_find_panel_or_bridge() np->name=lvds-channel  np->type=<NULL>
> [    2.153709] drm_of_find_panel_or_bridge() no panel found for remote
> [    2.160081] drm_of_find_panel_or_bridge() bridge needed
> [    2.162043] drm_of_find_panel_or_bridge() bridge not found
> [    2.165331] drm_of_find_panel_or_bridge() failed
> [    2.170023] imx-drm display-subsystem: failed to bind ldb (ops imx_ldb_ops): -517
>
> This at the same time as HDMI binds properly:
>
> [    4.458954] dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with
> HDCP (DWC HDMI 3D TX PHY)
> [    4.469633] imx-drm display-subsystem: bound 120000.hdmi (ops dw_hdmi_imx_ops)
>
> Which in the end causes the IMX driver to not initialize properly
> and ignore the HDMI connection that bound properly.
> This in turn prevents us from having any graphical output while there
> is no LVDS panel connected.

Does this happen if the LVDS is disabled in cmdline? (adding "video=LVDS-1:d")

Note that a bootscript was written for mainline kernel that takes care
of display configuration [1].

Currently this bootscript disables all the displays that aren't used.
It was tested with HDMI, where LVDS and LCD display are disabled, and
it *used to* work.

If this doesn't work then there's most likely a regression somewhere.

Regards,
Gary

[1] https://github.com/boundarydevices/u-boot-imx6/blob/boundary-v2018.07/board/boundary/bootscripts/bootscript-mainline.txt#L90
