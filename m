Return-Path: <SRS0=zRAX=Y2=google.com=djkurtz@kernel.org>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <1470279438-60372-1-git-send-email-bibby.hsieh@mediatek.com>
References: <1470279438-60372-1-git-send-email-bibby.hsieh@mediatek.com>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Thu, 12 Jan 2017 12:42:21 +0800
Message-ID: <CAGS+omANoCvW4xFkd6Hy9wJFhcda8TTxZBXhsW_Yb0kbgvmqYA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: mt8173: add mmsel clocks for 4K support
Content-Type: multipart/alternative; boundary=001a113a98c400d9b10545de59ea
To: Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, James Liao <jamesjj.liao@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, YH Huang <yh.huang@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, "dawei.chien@mediatek.com" <dawei.chien@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Junzhi Zhao <junzhi.zhao@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

--001a113a98c400d9b10545de59ea
Content-Type: text/plain; charset=UTF-8

Hi Matthias,

On Thu, Aug 4, 2016 at 10:57 AM, Bibby Hsieh <bibby.hsieh@mediatek.com>
wrote:
> To support HDMI 4K resolution, mmsys need clcok
> mm_sel to be 400MHz.
>
> The board .dts file should override the clock rate
> property with the higher VENCPLL frequency the board
> supports HDMI 4K resolution.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>


It looks like this patch was lost.  It is actually a prerequisite for MTK
4k HDMI support, which already landed in v4.9.

See the email thread entitled:
[PATCH v5 0/3] MT8173 HDMI 4K support <https://lkml.org/lkml/2016/9/28/893>

Or these three:

0d2200794f0a drm/mediatek: modify the factor to make the pll_rate set in
the 1G-2G range
968253bd7caa drm/mediatek: enhance the HDMI driving current
d542b7c473f0 drm/mediatek: do mtk_hdmi_send_infoframe after HDMI clock
enable


> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 78529e4..c3f32f3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -690,6 +690,8 @@
>                         compatible = "mediatek,mt8173-mmsys", "syscon";
>                         reg = <0 0x14000000 0 0x1000>;
>                         power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> +                       assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
> +                       assigned-clock-rates = <400000000>;
>                         #clock-cells = <1>;
>                 };
>
> --
> 1.7.9.5
>

--001a113a98c400d9b10545de59ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Matthias,<br><br>On Thu, Aug 4, 2016 at 10:57 AM, Bibby=
 Hsieh &lt;<a href=3D"mailto:bibby.hsieh@mediatek.com">bibby.hsieh@mediatek=
.com</a>&gt; wrote:<br>&gt; To support HDMI 4K resolution, mmsys need clcok=
<br>&gt; mm_sel to be 400MHz.<br>&gt;<br>&gt; The board .dts file should ov=
erride the clock rate<br>&gt; property with the higher VENCPLL frequency th=
e board<br>&gt; supports HDMI 4K resolution.<br><div><div>&gt;<br>&gt; Sign=
ed-off-by: Bibby Hsieh &lt;<a href=3D"mailto:bibby.hsieh@mediatek.com">bibb=
y.hsieh@mediatek.com</a>&gt;</div><div><br></div><div>Reviewed-by: Daniel K=
urtz &lt;<a href=3D"mailto:djkurtz@chromium.org">djkurtz@chromium.org</a>&g=
t;<br></div><div><br></div><div><br>It looks like this patch was lost.=C2=
=A0 It is actually a prerequisite for MTK 4k HDMI support, which already la=
nded in v4.9.<div><br></div><div>See the email thread entitled: =C2=A0<div>=
<a href=3D"https://lkml.org/lkml/2016/9/28/893">[PATCH v5 0/3] MT8173 HDMI =
4K support</a></div><div><br></div><div>Or these three:</div><div><br></div=
><div><div>0d2200794f0a drm/mediatek: modify the factor to make the pll_rat=
e set in the 1G-2G range</div><div>968253bd7caa drm/mediatek: enhance the H=
DMI driving current</div><div>d542b7c473f0 drm/mediatek: do mtk_hdmi_send_i=
nfoframe after HDMI clock enable</div></div><div><br></div><div><br></div><=
/div>&gt; ---<br>&gt; =C2=A0arch/arm64/boot/dts/mediatek/mt8173.dtsi | =C2=
=A0 =C2=A02 ++<br>&gt; =C2=A01 file changed, 2 insertions(+)<br>&gt;<br>&gt=
; diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8173.dtsi<br>&gt; index 78529e4..c3f32f3 100644<br>&gt; --- a=
/arch/arm64/boot/dts/mediatek/mt8173.dtsi<br>&gt; +++ b/arch/arm64/boot/dts=
/mediatek/mt8173.dtsi<br>&gt; @@ -690,6 +690,8 @@<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatib=
le =3D &quot;mediatek,mt8173-mmsys&quot;, &quot;syscon&quot;;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;0 0x14000000 0 0x1000&gt;;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 power-domain=
s =3D &lt;&amp;scpsys MT8173_POWER_DOMAIN_MM&gt;;<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assigned-clo=
cks =3D &lt;&amp;topckgen CLK_TOP_MM_SEL&gt;;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assigned-clock-=
rates =3D &lt;400000000&gt;;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #clock-cells =3D &lt;1&gt;;<b=
r>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>&gt;<b=
r>&gt; --<br>&gt; 1.7.9.5<br>&gt;</div></div></div>

--001a113a98c400d9b10545de59ea--
