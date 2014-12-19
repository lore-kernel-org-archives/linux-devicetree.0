From: shrk andy <andyshrk@gmail.com>
Subject: Re: [PATCH RFC v2 00/14] Add support for i.MX MIPI DSI DRM driver
Date: Fri, 19 Dec 2014 17:43:40 +0800
Message-ID: <CANbgqARNDOg0CYwCZPo36RQSQ7fuwbgdnX-HdG7kiosbU+XGYw@mail.gmail.com>
References: <1418886696-11636-1-git-send-email-Ying.Liu@freescale.com>
 <59cf2641.8c29.14a614058be.Coremail.andyshrk@163.com>
 <5493D7CF.1020304@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0549819340=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5493D7CF.1020304@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liu Ying <Ying.Liu@freescale.com>
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0549819340==
Content-Type: multipart/alternative; boundary=001a11c231da35a1e0050a8e8b3e

--001a11c231da35a1e0050a8e8b3e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Liu Ying:

2014-12-19 15:46 GMT+08:00 Liu Ying <Ying.Liu@freescale.com>:
>
> Hi Andy,
>
> On 12/19/2014 02:33 PM, Andy Yan wrote:
>
>> Hi Liu Ying:
>>
>>   I foud Rockchip RK618 (a mfd function device with mipi dsi=EF=BC=8Clvd=
s
>> transmitter=E3=80=81HDMI TX=E3=80=81and audio codec=EF=BC=8Cand
>> controlled by the SOC from i2c ) have the same register layout with your
>> i.MX MIPI DSI=EF=BC=8Cwhich means RK618 MIPI
>> DSI also have the Synopsys compatible DSI IP=E3=80=82So Would you please=
 make
>> this drives more platform independent=EF=BC=9F
>>
>>
> I may try to place the Synopsys DesignWare MIPI DSI driver in the
> drm/bridge directory and make it as less platform-dependant as
> possible.
>
> I have no access to the Rockchip RK618 chip and it's reference menu.
> You probably may add the Rockchip part support later.
>
> Regards,
> Liu Ying


  That's would be nice , thank you.
    Andy

>
>
>>
>>
>> At 2014-12-18 15:11:22, "Liu Ying" <Ying.Liu@freescale.com> wrote:
>>
>>> Hi,
>>>
>>> This series addressed almost all comments from Thierry Redding and
>>> Russell
>>> on v1.
>>>
>>> This series adds support for i.MX MIPI DSI DRM driver.
>>> Currently, the MIPI DSI driver only supports the burst with sync pulse
>>> mode.
>>>
>>> This series also includes a DRM panel driver for the Truly
>>> TFT480800-16-E panel
>>> which is driven by the Himax HX8369A driver IC.  The driver IC data
>>> sheet could
>>> be found at [1].  As mentioned by the data sheet, the driver IC support=
s
>>> several
>>> interface modes.  Currently, the DRM panel driver only supports the MIP=
I
>>> DSI video
>>> mode.  New interface modes could be added later(perhaps, just like the
>>> way the DRM
>>> simple panel driver supports both MIPI DSI interface panels and
>>> simple(parallel)
>>> interface panels).
>>>
>>> The MIPI DSI feature is tested on i.MX6Q SabreSD board and i.MX6DL
>>> SabreSD board.
>>> The MIPI DSI display could be enabled directly on i.MX6Q SabreSD board
>>> after
>>> applying this series, because the 26.4MHz pixel clock the panel require=
s
>>> could be
>>> derived from the IPU HSP clock(264MHz) with an integer divider.
>>> On i.MX6DL SabreSD board, we need to manually disable the LVDS and HDMI
>>> displays in
>>> the device tree blob, since the i.MX6DL IPU HSP clock is 198MHz at
>>> present, which
>>> makes the pixel clock share the PLL5 video clock source with the LVDS
>>> and HDMI,
>>> thus, the panel cannot get the pixel clock rate it wants.
>>>
>>> Patch 01/15 is needed to get a precise pixel clock rate(26.4MHz) from
>>> the PLL5 video
>>> clock.  If we don't have this patch, the pixel clock rate is about
>>> 20MHz, which
>>> causes a horitonal shift on the display image.
>>>
>>> This series can be applied on the drm-next branch.
>>>
>>> [1] http://www.allshore.com/pdf/Himax_HX8369-A.pdf
>>>
>>> Liu Ying (14):
>>>  clk: divider: Correct parent clk round rate if no bestdiv is normally
>>>    found
>>>  of: Add vendor prefix for Himax Technologies Inc.
>>>  of: Add vendor prefix for Truly Semiconductors Limited
>>>  ARM: imx6q: Add GPR3 MIPI muxing control register field shift bits
>>>    definition
>>>  ARM: imx6q: clk: Add the video_27m clock
>>>  ARM: dts: imx6qdl: Move existing MIPI DSI ports into a new 'ports'
>>>    node
>>>  drm/dsi: Add a helper to get bits per pixel of MIPI DSI pixel format
>>>  drm: imx: Add MIPI DSI host controller driver
>>>  drm: panel: Add support for Himax HX8369A MIPI DSI panel
>>>  ARM: dtsi: imx6qdl: Add support for MIPI DSI host controller
>>>  ARM: dts: imx6qdl-sabresd: Add support for TRULY TFT480800-16-E MIPI
>>>    DSI panel
>>>  ARM: imx_v6_v7_defconfig: Cleanup for imx drm being moved out of
>>>    staging
>>>  ARM: imx_v6_v7_defconfig: Add support for MIPI DSI host controller
>>>  ARM: imx_v6_v7_defconfig: Add support for Himax HX8369A panel
>>>
>>> .../devicetree/bindings/drm/imx/mipi_dsi.txt       |   78 ++
>>> .../devicetree/bindings/panel/himax,hx8369a.txt    |   41 +
>>> .../devicetree/bindings/vendor-prefixes.txt        |    2 +
>>> arch/arm/boot/dts/imx6q.dtsi                       |   20 +-
>>> arch/arm/boot/dts/imx6qdl-sabresd.dtsi             |   20 +
>>> arch/arm/boot/dts/imx6qdl.dtsi                     |   30 +-
>>> arch/arm/configs/imx_v6_v7_defconfig               |   17 +-
>>> arch/arm/mach-imx/clk-imx6q.c                      |    1 +
>>> drivers/clk/clk-divider.c                          |    3 +-
>>> drivers/gpu/drm/imx/Kconfig                        |    6 +
>>> drivers/gpu/drm/imx/Makefile                       |    1 +
>>> drivers/gpu/drm/imx/imx-mipi-dsi.c                 | 1056
>>> ++++++++++++++++++++
>>> drivers/gpu/drm/panel/Kconfig                      |    5 +
>>> drivers/gpu/drm/panel/Makefile                     |    1 +
>>> drivers/gpu/drm/panel/panel-himax-hx8369a.c        |  573 +++++++++++
>>> include/drm/drm_mipi_dsi.h                         |   14 +
>>> include/dt-bindings/clock/imx6qdl-clock.h          |    3 +-
>>> include/linux/mfd/syscon/imx6q-iomuxc-gpr.h        |    1 +
>>> 18 files changed, 1844 insertions(+), 28 deletions(-)
>>> create mode 100644 Documentation/devicetree/
>>> bindings/drm/imx/mipi_dsi.txt
>>> create mode 100644 Documentation/devicetree/
>>> bindings/panel/himax,hx8369a.txt
>>> create mode 100644 drivers/gpu/drm/imx/imx-mipi-dsi.c
>>> create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8369a.c
>>>
>>> --
>>> 2.1.0
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>
>>
>>
>>  --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>

--001a11c231da35a1e0050a8e8b3e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Liu Ying:<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2014-12-19 15:46 GMT+08:00 Liu Ying <span dir=3D"ltr">&lt;=
<a href=3D"mailto:Ying.Liu@freescale.com" target=3D"_blank">Ying.Liu@freesc=
ale.com</a>&gt;</span>:<blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Andy,<br>
<br>
On 12/19/2014 02:33 PM, Andy Yan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Liu Ying:<br>
<br>
=C2=A0 I foud Rockchip RK618 (a mfd function device with mipi dsi=EF=BC=8Cl=
vds<br>
transmitter=E3=80=81HDMI TX=E3=80=81and audio codec=EF=BC=8Cand<br>
controlled by the SOC from i2c ) have the same register layout with your<br=
>
i.MX MIPI DSI=EF=BC=8Cwhich means RK618 MIPI<br>
DSI also have the Synopsys compatible DSI IP=E3=80=82So Would you please ma=
ke<br>
this drives more platform independent=EF=BC=9F<br>
<br>
</blockquote>
<br>
I may try to place the Synopsys DesignWare MIPI DSI driver in the<br>
drm/bridge directory and make it as less platform-dependant as<br>
possible.<br>
<br>
I have no access to the Rockchip RK618 chip and it&#39;s reference menu.<br=
>
You probably may add the Rockchip part support later.<br>
<br>
Regards,<br>
Liu Ying</blockquote><div>=C2=A0</div><div>=C2=A0 That&#39;s would be nice =
, thank you.</div><div>=C2=A0 =C2=A0 Andy</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div class=3D"h5">
<br>
<br>
<br>
At 2014-12-18 15:11:22, &quot;Liu Ying&quot; &lt;<a href=3D"mailto:Ying.Liu=
@freescale.com" target=3D"_blank">Ying.Liu@freescale.com</a>&gt; wrote:<br>
</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
Hi,<br>
<br>
This series addressed almost all comments from Thierry Redding and Russell<=
br>
on v1.<br>
<br>
This series adds support for i.MX MIPI DSI DRM driver.<br>
Currently, the MIPI DSI driver only supports the burst with sync pulse mode=
.<br>
<br>
This series also includes a DRM panel driver for the Truly TFT480800-16-E p=
anel<br>
which is driven by the Himax HX8369A driver IC.=C2=A0 The driver IC data sh=
eet could<br>
be found at [1].=C2=A0 As mentioned by the data sheet, the driver IC suppor=
ts several<br>
interface modes.=C2=A0 Currently, the DRM panel driver only supports the MI=
PI DSI video<br>
mode.=C2=A0 New interface modes could be added later(perhaps, just like the=
 way the DRM<br>
simple panel driver supports both MIPI DSI interface panels and simple(para=
llel)<br>
interface panels).<br>
<br>
The MIPI DSI feature is tested on i.MX6Q SabreSD board and i.MX6DL SabreSD =
board.<br>
The MIPI DSI display could be enabled directly on i.MX6Q SabreSD board afte=
r<br>
applying this series, because the 26.4MHz pixel clock the panel requires co=
uld be<br>
derived from the IPU HSP clock(264MHz) with an integer divider.<br>
On i.MX6DL SabreSD board, we need to manually disable the LVDS and HDMI dis=
plays in<br>
the device tree blob, since the i.MX6DL IPU HSP clock is 198MHz at present,=
 which<br>
makes the pixel clock share the PLL5 video clock source with the LVDS and H=
DMI,<br>
thus, the panel cannot get the pixel clock rate it wants.<br>
<br>
Patch 01/15 is needed to get a precise pixel clock rate(26.4MHz) from the P=
LL5 video<br>
clock.=C2=A0 If we don&#39;t have this patch, the pixel clock rate is about=
 20MHz, which<br>
causes a horitonal shift on the display image.<br>
<br>
This series can be applied on the drm-next branch.<br>
<br>
[1] <a href=3D"http://www.allshore.com/pdf/Himax_HX8369-A.pdf" target=3D"_b=
lank">http://www.allshore.com/pdf/<u></u>Himax_HX8369-A.pdf</a><br>
<br>
Liu Ying (14):<br>
=C2=A0clk: divider: Correct parent clk round rate if no bestdiv is normally=
<br>
=C2=A0 =C2=A0found<br>
=C2=A0of: Add vendor prefix for Himax Technologies Inc.<br>
=C2=A0of: Add vendor prefix for Truly Semiconductors Limited<br>
=C2=A0ARM: imx6q: Add GPR3 MIPI muxing control register field shift bits<br=
>
=C2=A0 =C2=A0definition<br>
=C2=A0ARM: imx6q: clk: Add the video_27m clock<br>
=C2=A0ARM: dts: imx6qdl: Move existing MIPI DSI ports into a new &#39;ports=
&#39;<br>
=C2=A0 =C2=A0node<br>
=C2=A0drm/dsi: Add a helper to get bits per pixel of MIPI DSI pixel format<=
br>
=C2=A0drm: imx: Add MIPI DSI host controller driver<br>
=C2=A0drm: panel: Add support for Himax HX8369A MIPI DSI panel<br>
=C2=A0ARM: dtsi: imx6qdl: Add support for MIPI DSI host controller<br>
=C2=A0ARM: dts: imx6qdl-sabresd: Add support for TRULY TFT480800-16-E MIPI<=
br>
=C2=A0 =C2=A0DSI panel<br>
=C2=A0ARM: imx_v6_v7_defconfig: Cleanup for imx drm being moved out of<br>
=C2=A0 =C2=A0staging<br>
=C2=A0ARM: imx_v6_v7_defconfig: Add support for MIPI DSI host controller<br=
>
=C2=A0ARM: imx_v6_v7_defconfig: Add support for Himax HX8369A panel<br>
<br>
.../devicetree/bindings/drm/<u></u>imx/mipi_dsi.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A078 ++<br>
.../devicetree/bindings/panel/<u></u>himax,hx8369a.txt=C2=A0 =C2=A0 |=C2=A0=
 =C2=A041 +<br>
.../devicetree/bindings/<u></u>vendor-prefixes.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +<br>
arch/arm/boot/dts/imx6q.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +-<br>
arch/arm/boot/dts/imx6qdl-<u></u>sabresd.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +<br>
arch/arm/boot/dts/imx6qdl.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A030 +-<br>
arch/arm/configs/imx_v6_v7_<u></u>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017 +-<br>
arch/arm/mach-imx/clk-imx6q.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
drivers/clk/clk-divider.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-<br>
drivers/gpu/drm/imx/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 +<br>
drivers/gpu/drm/imx/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
drivers/gpu/drm/imx/imx-mipi-<u></u>dsi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1056 ++++++++++++++++++++<br>
drivers/gpu/drm/panel/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
drivers/gpu/drm/panel/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
drivers/gpu/drm/panel/panel-<u></u>himax-hx8369a.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 573 +++++++++++<br>
include/drm/drm_mipi_dsi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
include/dt-bindings/clock/<u></u>imx6qdl-clock.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 3 +-<br>
include/linux/mfd/syscon/<u></u>imx6q-iomuxc-gpr.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 1 +<br>
18 files changed, 1844 insertions(+), 28 deletions(-)<br>
create mode 100644 Documentation/devicetree/<u></u>bindings/drm/imx/mipi_ds=
i.txt<br>
create mode 100644 Documentation/devicetree/<u></u>bindings/panel/himax,hx8=
369a.<u></u>txt<br>
create mode 100644 drivers/gpu/drm/imx/imx-mipi-<u></u>dsi.c<br>
create mode 100644 drivers/gpu/drm/panel/panel-<u></u>himax-hx8369a.c<br>
<br>
--<br>
2.1.0<br>
<br></div></div>
______________________________<u></u>_________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.<u></u>org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/<u></u>mailman/listinfo/dri-devel<=
/a><br>
</blockquote>
<br>
<br>
<br>
</blockquote><div class=3D"HOEnZb"><div class=3D"h5">
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-kernel=
&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org" targe=
t=3D"_blank">majordomo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank">http://vger.kernel.org/<u></u>majordomo-info.htm=
l</a><br>
Please read the FAQ at=C2=A0 <a href=3D"http://www.tux.org/lkml/" target=3D=
"_blank">http://www.tux.org/lkml/</a><br>
</div></div></blockquote></div></div></div>

--001a11c231da35a1e0050a8e8b3e--

--===============0549819340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0549819340==--
